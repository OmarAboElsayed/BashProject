PS3="Please Enter your Options: "
echo -e "${Cyan}"
options=("Create Table" "List Tables" "Drop Table" "Insert Into Table" "Select From Table" "Update Table" "Back")

select i in "${options[@]}"
do 
    case $REPLY in 
        1) ../../createTb.sh;;
        2)  echo -e "${green}" 
            ls .
            echo -e "${Cyan}" 
             ;;
        3) ../../DropTable.sh;;
        4) ../../Insert_Into_Table.sh;;
        5) ../../Select_From_Table.sh;;
        6) ../../UpdateTable.sh;;
        7) break
           ./menu1.sh
           
           ;;
        
          
    
         
     
           
        *)
           echo -e "${red}invalid option $REPLY"
           echo -e "${Cyan}"
           
           
           ;;
    esac

done
