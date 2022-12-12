PS3="Please Enter your Options: "
function VaildInput {

    if ! [[ $1 =~ $IsNumber ]] ; then
        type="string"
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
function primaryKey {
    fieldNumber=`awk -v RS=';' "/pk/"'{print NR}' $1`
    pksValues=`sed '1d' $1|cut -d ";" -f $fieldNumber `
   
    for value in $pksValues
    do
        if ! [[ $2 =~ $IsNumber ]] ; 
        then
            # type="string"
            if [ $2 = $value ]
            then
                return 0
            fi
        else
            # type="int"
            if [[ $2 = $value ]]
            then
                return 0
            fi
        fi
    done
    return 1
}

    read -p "Please Enter your Table Name: " tableName
      # check tableName 
       if ! [ -z "$tableName" ]
        then 
         if ! [[ $tableName =~ $IsNumber ]] ; then
               
                echo -e "${green}Table Created Successfully" 
                echo -e "${Cyan}"
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
   ############################################
   
    read -p "Please Enter Update Name of Column : " colUpdate
    SearchNameColumn=`awk -F RS=';' "/$colUpdate/ "'{print NR}' $tableName 2>/dev/null`
        if ! [ -z "$colUpdate" ]
        then 
         if ! [[ $colUpdate =~ $IsNumber ]] ; then
               
                echo -e "${green}ColName Exist  Successfully ${colUpdate}" 
                echo -e "${Cyan}"
            else
                 echo -e "${red} Not Number...!Cant create Table with $colUpdate"
                 echo -e "${Cyan}"
                 exit
         fi
        else
           echo -e "${red} Empty value...! This is not accept Empty value "
           echo -e "${Cyan}"
           exit
   fi
#############################################################3
    read -p "Please Enter Update Old value of Column : " OLDVALUE
    if ! [ -z $OLDVALUE ]
    then
    echo -e "${green} Value Successfully ${OLDVALUE}"
    echo -e "${Cyan}"
    else
    echo -e "${red}Error Value please Enter Correct Value"
    echo -e "${Cyan}"
    break
     fi
    colType=`cut -d";" -f $OLDVALUE $tableName 2>/dev/null |cut -d":" -f 2|head -1`;
    ##############################################################
    read -p "please Enter New Value Update: " newValue
     if [[ $newValue ]]
    then
    echo -e "${green} Value Successfully ${newValue}"
    echo -e "${Cyan}"
    else
    echo -e "${red}Error Value"
    echo -e "${Cyan}"
    break
    fi
    ##########################################
    VaildInput $newValue $colType
   ##Call Function
    primaryKey $tableName $newValue
    #################################
    ## Column Condtion
     read -p "Please Enter Name Columns(Condition): " colName
         if ! [ -z "$colName" ]
        then 
         if ! [[ $colName =~ $IsNumber ]] ; then
                touch $tableName
                echo -e "${green}ColName Exist  Successfully" 
                echo -e "${Cyan}"
            else
                 echo -e "${red} Not Number...!Cant create Table with $colName"
                 echo -e "${Cyan}"
                 exit
         fi
        else
           echo -e "${red} Empty value...! This is not accept Empty value "
           echo -e "${Cyan}"
           exit
   fi
       ## Search Column exist or No
    fieldNumber=`awk -v RS=';' "/$colName/ "'{print NR}' $tableName`
    ##################################################################33



    read -p "Please Enter conditon value of Column : " value
    #line number
    searchResult=`cut -d ";" -f $fieldNumber $tableName 2>/dev/null |awk "/$value/"'{print NR}' `
   
    if [ -z $value ]
    then
    echo -e "${red}value not exist"
    echo -e "${Cyan}"
    break
    else
    echo -e "${green} value Exist successfully ${value}"
    echo -e "${Cyan}"
   fi
    ###############################
    updateNum=`awk -v RS=';' "/$colUpdate/ "'{print NR}' $tableName`
    oldValue=$(awk 'BEGIN{FS=";"} {
    if(NR=="'$searchResult'"){
         print $'$updateNum';     
         }
      }' $tableName)

    sed -i ''$searchResult's/'$oldValue'/'$newValue'/g' $tableName 
    ##########################################################3

