PS3="Please Enter your Options: "
function VaildInput {

    if ! [[ $1 =~ $IsNumber ]] ; then
        type="string"
      
        echo -e "${Cyan}"
    else
        type="int"
        
          echo -e "${Cyan}"
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
    IsNumber='^[0-9]+$'
    for value in $pksValues
    do
        if ! [[ $2 =~ $IsNumber ]] ; 
        then
          

            if [ $2 = $value ]
            then
          
                return 0
            fi
        else
        
            if [ $2 = $value ]
            then
               
                return 0
            fi
        fi
    done
    return 1
}
function insertIntoTable {
    typeset -i i=1;
    colName=`cut -d";" -f $i $1|cut -d":" -f 1|head -1`;
    colType=`cut -d";" -f $i $1|cut -d":" -f 2|head -1`;
    field='';
    while [[ -n $colName ]]
    do
   read -p "Enter Value of $colName " value
       VaildInput $value $colType
        if [[ $? = 1 ]]
        then
            field+="$value;"
            echo -e "${green}Succeed ...! Value"
            echo -e "${Cyan}"
          
        else
            echo -e  "${red}Somthing Wrong! please Enter Correctly Value"
            echo -e "${Cyan}"
            break;
            
        fi
         primaryKey $1 $value
        i+=1;
        colName=`cut -d";" -f $i $1|cut -d":" -f 1|head -1`; 
        colType=`cut -d";" -f $i $1|cut -d":" -f 2|head -1`;
    done
     echo ":${field} : " >>$1
  
}
################### Offer table options ################
   table=`ls`;
    echo "Please Select Table To Insert Into :"
    select table in $table;
    do
        if [[ -f $table ]]
        then insertIntoTable $table;
         break
        elif  [[ -n $table ]]
        then
        echo -e "${red} No Data"
        echo -e "${Cyan}" 
        else
            echo -e "${red}Please Enter From This Options (Number Exist)."
            echo -e "${Cyan}"
        fi
        i+=1
    done

