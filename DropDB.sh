read -p "Enter Database name to Deleted " dbname
if [ -n "$dbname" ]
       	then
		if [[ -d "./db/$dbname" ]]
    		then
			      rm -r ./db/$dbname &>/dev/null
        		echo -e "${green}Database Deleted Successfully" 
        		echo -e "${blue}"
    		else
        		echo -e "${red}There is no Database with name $dbname"
            echo -e "${blue}"
        		
    		fi
	else
		echo -e "${red}There is no Database with name $dbname"
     echo -e "${blue}"

        	
	fi

                        
 
 