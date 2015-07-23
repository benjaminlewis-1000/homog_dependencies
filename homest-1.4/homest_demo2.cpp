/////////////////////////////////////////////////////////////////////////////////
// 
//  Non-linear, robust homography estimation
//  Copyright (C) 2003-11  Manolis Lourakis (lourakis **at** ics.forth.gr)
//  Institute of Computer Science, Foundation for Research & Technology - Hellas
//  Heraklion, Crete, Greece.
//
//  This program is free software; you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation; either version 2 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
/////////////////////////////////////////////////////////////////////////////////

/******************************************************************************** 
 * homest demo. The program accepts a text file containing quadruples of matching
 * point coordinates (i.e., x1 y1  x2 y2 where x1 y1 is a (corner) point in the
 * 1st image and x2 y2 its corresponding one in the 2nd) and estimates the
 * homography mapping points in the first image to points in the second
 ********************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <iostream>
#include <time.h>

#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/opencv.hpp>
#include <opencv2/calib3d/calib3d.hpp>
#include <opencv2/nonfree/nonfree.hpp>
#include <opencv2/nonfree/features2d.hpp>

#include <list>
#include <vector>
#include "homest.h"

#define MAXSTRLEN	256

/* read pairs of matching points from a file */

static int readMatchingPoint2d(std::vector<cv::Point2d> in1, std::vector<cv::Point2d> in2, double (**pts0)[2], double (**pts1)[2]){
  *pts0=(double (*)[2])malloc(in1.size()*sizeof(double[2]));
  *pts1=(double (*)[2])malloc(in1.size()*sizeof(double[2]));
// There should definitely be error checking and bounding. 

	if (in1.size() != in2.size() ){	
      fprintf(stderr, "The two point vectors are not the same size\n");
      exit(1);
	}
	if(in1.size() == 0 || in2.size() == 0){
		fprintf(stderr, "One or both of the input vectors has no elements.\n");
	}
	for (int i = 0; i < in1.size(); i++){
		*((*pts0)[i]  )  = in1[i].x;
		*((*pts0)[i]+1) = in1[i].y;
		*((*pts1)[i]  )  = in2[i].x;  // Hooray for the magic of pointers. 
		*((*pts1)[i]+1) = in2[i].y;
	}
}


void readPoints(char *fname, std::vector<cv::Point2d> *in1, std::vector<cv::Point2d> *in2){
// A method to read points from a file into a vector<Point2d>. Mostly used to check accuracy of my readMatchingPoint2d method. 
	register int i;
	int ncoords, nmatches;
	double coords[4];
	FILE *fp;
	char buf[MAXSTRLEN];
	if((fp=fopen(fname, "r"))==NULL){
		fprintf(stderr, "cannot open file %s\n", fname);
		exit(1);
	}

	fgets(buf, MAXSTRLEN, fp);
	if(ferror(fp)){
 		fprintf(stderr, "File %s: error reading first line\n", fname);
		exit(1);
	}
	std::cout << buf << std::endl;
	
	ncoords=sscanf(buf, "%lf%lf%lf%lf", coords, coords+1, coords+2, coords+3);
	std::cout << coords[2] << std::endl;
	
	for(i=0; !feof(fp); i++){
		ncoords=fscanf(fp, "%lf%lf%lf%lf\n", coords, coords+1, coords+2, coords+3);
		//std::cout << coords[2] << std::endl;
		//cv::Point2d pt1(coords[0], coords[1]);
		in1->insert(in1->end(), cv::Point2d(coords[0], coords[1]) );
		in2->insert(in2->end(), cv::Point2d(coords[2], coords[3]) );
		if(ncoords==EOF) break;

		if(ncoords!=4){
		  fprintf(stderr, "File %s: line %d contains only %d coordinates\n", fname, i + 1, ncoords);
		  exit(1);
  		}

		if(ferror(fp)){
		  fprintf(stderr, "File %s: error reading 2D point coordinates, line %d\n", fname, i + 1);
		  exit(1);
		}

  }
}

static int readMatching2DPoints(char *fname, double (**pts0)[2], double (**pts1)[2])
{
register int i;
int ncoords, nmatches;
double coords[4];
FILE *fp;
char buf[MAXSTRLEN];

  if((fp=fopen(fname, "r"))==NULL){
    fprintf(stderr, "cannot open file %s\n", fname);
    exit(1);
  }

  fgets(buf, MAXSTRLEN, fp);
  if(ferror(fp)){
    fprintf(stderr, "File %s: error reading first line\n", fname);
    exit(1);
  }

  ncoords=sscanf(buf, "%lf%lf%lf%lf", coords, coords+1, coords+2, coords+3);
  if(ncoords==4){ /* no lines number */
    for(nmatches=1; !feof(fp); nmatches++){
      fscanf(fp, "%*g%*g%*g%*g\n");
      if(ferror(fp)){
        fprintf(stderr, "File %s: error reading 2D point coordinates, line %d\n", fname, nmatches + 1);
        exit(1);
      }
    }

    rewind(fp);
  }
  else{
    sscanf(buf, "%d", &nmatches);
  }

  *pts0=(double (*)[2])malloc(nmatches*sizeof(double[2]));
  *pts1=(double (*)[2])malloc(nmatches*sizeof(double[2]));
  if(!pts0 || !pts1){
    fprintf(stderr, "Memory allocation request failed in readMatching2DPoints()\n");
    exit(1);
  }

  /* read in points and store them */
  for(i=0; !feof(fp); i++){
    ncoords=fscanf(fp, "%lf%lf%lf%lf\n", (*pts0)[i], (*pts0)[i]+1, (*pts1)[i], (*pts1)[i]+1);
    if(ncoords==EOF) break;

    if(ncoords!=4){
      fprintf(stderr, "File %s: line %d contains only %d coordinates\n", fname, i + 1, ncoords);
      exit(1);
    }

    if(ferror(fp)){
      fprintf(stderr, "File %s: error reading 2D point coordinates, line %d\n", fname, i + 1);
      exit(1);
    }

  }
  fclose(fp);

  if(i!=nmatches){
    fprintf(stderr, "number of actuall points in file %s does not agree with that in first line (%d != %d)!\n",
                     fname, i, nmatches);
    exit(1);
  }

  return nmatches;
}

#define INL_PCENT 0.7
/****************************************/
int main(int argc, char *argv[])
{

std::cout << "Hello world!\n";
double (*pts0)[2], (*pts1)[2];
register int i;
int npts, donorm, noutl, *outidx=NULL;
char *matchesfile;
double H[NUM_HPARAMS], rms, rmeds;
int estAffine=0;

clock_t start_time, end_time;

  /* arguments parsing */
  if(argc!=2 && argc!=3){
    fprintf(stderr, "Usage: %s [-a] <matched points>\n", argv[0]);
    exit(1);
  }

  if(argc==3)
    if(!strcmp(argv[1], "-a")){
      estAffine=1;
      matchesfile=argv[2];
    }
    else{
      fprintf(stderr, "%s: unknown argument \"%s\" specified!\n", argv[0], argv[1]);
      exit(1);
    }
  else
    matchesfile=argv[1];

	std::vector<cv::Point2d> in1, in2;

  readPoints(matchesfile, &in1, &in2);
	std::cout << in1.size() << " is the size" << std::endl;
  npts=readMatchingPoint2d(in1, in2, &pts0, &pts1);
  npts=readMatching2DPoints(matchesfile, &pts0, &pts1);

#if 0
  for(i=0; i<npts; ++i){
    printf("%g %g  %g %g\n", pts0[i][0], pts0[i][1], pts1[i][0], pts1[i][1]);
  }
#endif

#ifdef NEED_OUTLIERS
  if((outidx=(int *)malloc(npts*sizeof(int)))==NULL){
    fprintf(stderr, "Memory allocation request failed in main()\n");
    exit(1);
  }
#endif /* NEED_OUTLIERS */

  donorm=1;

  fprintf(stdout, "%somography estimation using %d image matches\n", estAffine? "Affine h" : "H", npts);

  start_time=clock();
  if(!estAffine){
    int cstfunc;

    cstfunc=HOMEST_SYM_XFER_ERROR; // use the symmetric transfer error
    //cstfunc=HOMEST_XFER_ERROR; // use the transfer error in 2nd image
    //cstfunc=HOMEST_SAMPSON_ERROR; //use the Sampson error
    //cstfunc=HOMEST_REPR_ERROR; // use the reprojection error
    //cstfunc=HOMEST_NO_NLN_REFINE; // no refinement
    homest(pts0, pts1, npts, INL_PCENT, H, donorm, cstfunc, outidx, &noutl, 1);
  }
  else
    homestaff(pts0, pts1, npts, INL_PCENT, H, donorm, outidx, &noutl, 1);
  end_time=clock();

  fprintf(stdout, "\nEstimated %shomography [%d outliers, %.2lf%%]\n", estAffine? "affine " : "", noutl, (double)(100.0*noutl)/npts);
  for(i=0; i<NUM_HPARAMS; ++i){
    if(!(i%3)) fprintf(stdout, "\n");
    fprintf(stdout, "%.7g ", H[i]);
  }
  fprintf(stdout, "\n");
  fprintf(stdout, "\nElapsed time: %.2lf seconds, %.2lf msecs\n", ((double) (end_time - start_time)) / CLOCKS_PER_SEC,
                        ((double) (end_time - start_time)) / (CLOCKS_PER_SEC/1000.0));

  homest_RMS_RMedS(pts0, pts1, npts, H, &rms, &rmeds);
  fprintf(stdout, "\nHomography RMS and RMedS errors for input points: %g %g\n", rms, rmeds);
  fflush(stdout);

  { double q1, q2, q3;

  homest_quartiles(pts0, pts1, npts, H, &q1, &q2, &q3);
  fprintf(stdout, "\t25%%, 50%% and 75%% quartiles: %g %g %g\n", q1, q2, q3);
  fflush(stdout);
  }

#ifdef NEED_OUTLIERS
  fprintf(stdout, "Indices of the %d outlier pairs:\n", noutl);
  for(i=0; i<noutl; ++i)
    fprintf(stdout, "%d ", outidx[i]);
  fputc('\n', stdout);

  if(outidx) free(outidx);
#endif /* NEED_OUTLIERS */

  free(pts0);
  free(pts1);

  return 0;
}
