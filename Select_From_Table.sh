read -p "Enter Database name to Select " tableName
if [ -n "$tableName" ]
       	then
		if [[ -f $tableName ]]
    		then
				    echo -e "${green}"
			      cat $tableName
        		echo -e "${green}Data Successfully" 
        		echo -e "${Cyan}"
    		else
        		echo -e "${red}There is no Table $tableName"
            echo -e "${blue}"
        		
    		fi
	else
		   echo -e "${red}There is no Table with name $tableName"
       echo -e "${blue}"
 fi