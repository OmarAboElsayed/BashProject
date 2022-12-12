PS3="Please Enter your Options: "

function validInput {

    if ! [[ $1 =~ $IsNumber ]] ; then
        type="string" $colNum 
    else
        type="int"
    fi
    if [[ "$type" == "$2" ]]
    then
        return 1
    else
        return 0
    fi
}
read -p "Please Enter Your Table Name: " tableName
    # check tableName 


   if ! [ -z "$tableName" ]
        then 
         if ! [[ $tableName =~ $IsNumber ]] ; 
            then
                   if ! [ -f $tableName ]
                       then
                       touch $tableName
                       echo -e "${green}Tablename Created Successfully" 
                       echo -e "${Cyan}"
                       else
                       echo  -e "${red}Table already exist"
                       echo -e "${Cyan}" 
                       exit
                   fi
            else
             echo -e "${red} Not Number...!Cant create Table with $tableName"
             echo -e "${Cyan}"
             exit
         fi
        else
     echo -e "${red} Empty value...! This is not accapt Empty value "
     echo -e "${Cyan}"
     exit
   fi

    #######################################
  read -p "Please Enter Your number of Columns " colNum
    validInput $colNum "int"
    if  ! [[ $colNum =~ $IsNumber ]]
    then
    echo -e "${red} Not number please Enter number"
    echo -e "${Cyan}"
    exit
    else 
    echo -e "${green} Number of Columns Successfully $colNum"
    echo -e "${Cyan}"

    fi
    typeset -i i=0
    columns=""
    while [ $i -lt $colNum ] 
    do
        read -p "Enter column Name " colName
        ######################
        ##check columnName
    
         if [[ $colName =~ [A-za-z] ]] || [[ $colName =~ [A-Z] ]] || [[ $colName =~ [a-z] ]] ; 
            then
            echo -e "${green}colName is Created"
            echo -e "${Cyan}"
          else
          echo -e "${red} Error"
          echo -e "${Cyan}"
         exit
         fi
  ########################################
        echo "Select column type"
        select type in "int" "string"
        do
            colType=$type
            if [[ $type ]]
            then 
            echo -e "${green} Successfully"
            echo -e "${Cyan}"
            break
            else
            echo
            echo -e "${red} invalid type"
            echo -e "${Cyan}"
            fi
        done
        # read colType
        if [ -z $pk ]
        then
            echo "IS This primary key or No"
            select answer in "yes" "no"
            do 
                case $REPLY in 
                1) 
                    pk=$colName
                    colName+="[pk]"
                    break;;
                2)  break;;
                *) echo "Please Select from yes or no " ;;
                esac
            done
        fi
        columns+="$colName:$colType;"
        i+=1
        echo -e "${green} Created Table Successfully "
        echo -e "${Cyan}"
    done
    echo $columns>>$tableName;
    exit