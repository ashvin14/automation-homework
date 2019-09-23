#! /bin/bash


#from setup date calculate weeks 
#and create that number of homework folders

create_homework_directory(){
 SUBJECT=$1
 WEEK=$2
 #for some reason arguments are not passing
 echo "generating directories ...$@"
 if [ ! -d "../../${SUBJECT}-homework/week-${WEEK}/" ]
 then
 `mkdir ../../${SUBJECT}-homework/week-${WEEK}/`
  echo "../../${SUBJECT}-homework/week-${WEEK}/ directory generated."
 fi
}

CURRENT_DAY=`date +"%a"`
#if its day create homework folder for that course
    #read from data file
    while IFS="," read INDEX SUBJECT DAY WEEK
    do
       if [ $CURRENT_DAY == $DAY ]
       then
         create_homework_directory $SUBJECT "${WEEK}"
       fi
    done < data.csv
    #compare the day field with current day
        #if yes create directory for that subject
