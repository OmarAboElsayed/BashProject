read -p "Enter Database name to Connect " dbname
if [ -n "$dbname" ]
       	then
		if [[ -d "./db/$dbname" ]]
    		then
			      cd ./db/${dbname} 
        		echo -e "${green}Database Connected Successfully" 
            ../../menu2.sh 
        		echo -e "${blue}"
    		else
        		echo -e "${red}There is no Database with name $dbname"
            echo -e "${blue}"
        		
    		fi
	else
		    echo -e "${red}There is no Database with name $dbname"
        echo -e "${blue}"

        	
	fi


