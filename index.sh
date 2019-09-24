#! /bin/bash
source ./utilities.sh
#scheduler /index script

#it will run the scripts
#it shall update week field in data.csv
TODAY=`date +"%d %b"`



# main entry script so inputs to be passed via this
# first time only
if [ ! -f "data.csv" ] && [ ! -d "../../*-homework" ]
then
    echo "Name of one of the course in this semester: "
    read SUB1
    echo "Name of the other course: "
    read SUB2

    bash first-setup.sh "${SUB1}" "${SUB2}" 
    processing_for_no_of_weeks

    # preprocesssing and generating homeworks automatically. it will not run always, just one time.
    # for testing 
    WEEK_INDEX=1
    while [ $WEEK_INDEX -lt $no_of_weeks ]
    do
      create_homework_directory "${SUB1}" "${WEEK_INDEX}"
      create_homework_directory "${SUB2}" "${WEEK_INDEX}"
      WEEK_INDEX=$(( $WEEK_INDEX + 1 ))
    done

fi

# #it shall trigger scripts everyday
# processing_for_no_of_weeks

# print `awk '{print $1 $4}' data.csv`>> data.csv





