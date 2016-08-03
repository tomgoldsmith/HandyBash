#!/bin/bash

###########
# Options #
###########

#Set Folder to Clear
DLFOLDER=~/Downloads

# Set the number of days you would like files to be moved after
MVDATE=10

# Set the number of days after the files are moved to the old dir that that are deleted
DELDATE=5

############################################################################################

echo "Finding files that are more than $MVDATE old and moving to $DLFOLDER/old..."
echo "------------"

#Find files older than 10 days & move to old
find $DLFOLDER -maxdepth 1 -mtime +$MVDATE -type f -exec mv {} $DLFOLDER/old \;

#Find directories older than 10 days & move to old
find $DLFOLDER -maxdepth 1 -mtime +$MVDATE -type d -exec mv {} $DLFOLDER/old \;

echo "Removing files in /Download/old that have not been acccessed in the last $DELDATE days..."
echo "------------"

#Delete contents of old if not accessed in last 5 days
find $DLFOLDER/old -atime +$DELDATE -delete

echo "Clean up complete!"