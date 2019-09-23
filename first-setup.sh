#! /bin/bash

SETUP_DATE=`date +"%a"`
WEEK=1


create_course_directory(){
    SUBJECT=$1
    if [ ! -d "../../${SUBJECT}-homework/" ]
    then
    `mkdir ../../${SUBJECT}-homework/`
    fi
}

create_database(){
    for i in 0 1
    do
        `touch data.csv`
       echo ${i},${SUBJECTS[$i]},${DAYS[$i]},${WEEK} >> "data.csv"
    done
} 


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







