

create_course_directory(){
   SUBJECT=$1
    if [ ! -d "../../${SUBJECT}-homework/" ]
    then
    `mkdir ../../${SUBJECT}-homework/`
    fi
}

create_database(){
    `touch data.csv`
    echo ${SETUP_DATE} > "data.csv"
    for index in 0 1
    do
        echo ${index},${SUBJECTS[$index]},${DAYS[$index]},$no_of_weeks >> "data.csv"
    done
} 



create_homework_directory(){
 SUBJECT=$1
 WEEK=$2
 #for some reason arguments are not passing
 
 if [ ! -d "../../${SUBJECT}-homework/week-${WEEK}/" ]
 then
 `mkdir ../../${SUBJECT}-homework/week-${WEEK}/`
  echo "../../${SUBJECT}-homework/week-${WEEK}/ directory generated."
 fi
}


processing_for_no_of_weeks(){
    FIRST_SETUP_DATE="`awk -F, '{if(NR==1) print $0}' data.csv`"

    week_diff "${TODAY}" "${FIRST_SETUP_DATE}"
}

week_diff() {
    d1=$(date -d "$1" +%s)
    d2=$(date -d "$2" +%s)

    no_of_weeks=$(( (d1 - d2)/(86400*7) )) 
    echo $no_of_weeks
}

