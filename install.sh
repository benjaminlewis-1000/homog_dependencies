sudo apt-get install liblapack-dev --yes
sudo apt-get install libblas-dev checkinstall --yes
sudo apt-get install libblas-doc checkinstall --yes
sudo apt-get install liblapacke-dev checkinstall --yes
sudo apt-get install liblapack-doc checkinstall --yes
sudo apt-get install f2c --yes

# make levmar-2.6

sudo cp levmar.h /usr/local/include

sudo add-apt-repository --yes ppa:xqms/opencv-nonfree
sudo apt-get update
sudo apt-get install libopencv-nonfree-dev --yes

sudo cp liblevmar.a /usr/local/lib

# Make homest

sudo cp libhomest.a /usr/local/lib/
sudo cp homest-1.4/ /usr/local/include/ -r

# Now install database interface 

sudo apt-get install ros-indigo-sql-database --yes
sudo apt-get install pgadmin3 --yes
sudo apt-get install postgresql --yes
