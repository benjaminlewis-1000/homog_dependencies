#! /bin/bash

pg_dump ESM_KEYFRAMES > databases/esm.db
pg_dump FIND_MATCH_KEYFRAMES > databases/findMatch.db
pg_dump FIND_ONLY_KEYFRAMES > databases/findOnly.db
