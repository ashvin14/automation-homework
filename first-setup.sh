#! /bin/bash
source utilities.sh

SETUP_DATE=`date +"%d %b"`
WEEK=1


for param in $@
 do 
    SUBJECTS+=($param)
    echo "at what day ${param} is scheduled? [e.g Mon, Tue,...]"
    read day
    DAYS+=($day)

#   create directory of subject
    create_course_directory $param
done


create_database 







