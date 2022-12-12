read -p "Enter Database name to Deleted " tableName
if [ -n "$tableName" ]
       	then
		if [[ -f $tableName ]]
    		then
			      rm -r $tableName
        		echo -e "${green}Table Deleted Successfully" 
        		echo -e "${Cyan}"
    		else
        		echo -e "${red}There is no Table $tableName"
            echo -e "${Cyan}"
        		
    		fi
	else
		echo -e "${red}There is no Table with name $tableName"
     echo -e "${Cyan}"

        	
	fi

                        
 
 