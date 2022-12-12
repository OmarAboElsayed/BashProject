   read -p "Please Enter your Database " Namedb
        if [ -d ./db/${Namedb}  ]
        then
            echo -e "${red}Database aready Exists"
            echo -e "${blue}"
        else
            mkdir db 2>/dev/null
            mkdir ./db/${Namedb}
            echo -e "${green}Created Database ${Namedb}"
            echo -e "${blue}"
        fi

 
