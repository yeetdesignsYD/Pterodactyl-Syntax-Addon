

read -p "What is the directories name for the panel?:" dirName

options=(
"Pterodactyl"
"Reviactyl"
"Exit"
)


select option in "${options[@]}"; do
case $option in 
     "Pterodactyl")

     ;;
     "Reviactyl")

     ;;
     "Exit")
    echo "Canceling the setup!"
    exit 0
    ;;
     esac
     done
