#! /bin/bash
. utilities.sh 
#needs no. of weeks as argument ./generate_homework.sh [WEEKS]

#from setup date calculate weeks 
#and create that number of homework folders

CURRENT_DAY=`date +"%a"`
#if its day create homework folder for that course
    #read from data file
    while IFS="," read INDEX SUBJECT DAY 
    do
       if [ $CURRENT_DAY == $DAY ]
       then
         create_homework_directory $SUBJECT "$1"
       fi
    done < data.csv
    #compare the day field with current day
        #if yes create directory for that subject
