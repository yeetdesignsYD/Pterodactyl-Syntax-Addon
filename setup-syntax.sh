
promptMsg="What is the directories name for the panel?:"
setupScript="./setup-syntax.sh"

echo $promptMsg

read dirName

if [ -z "$dirName" ]; then
echo "No name was provided! To try again run this script."

echo "EXITING..."
exit 0
fi

options=(
"Pterodactyl"
"Reviactyl"
"Exit"
)


select option in "${options[@]}"; do
case $option in 
     "Pterodactyl")
curl -fsSL https://raw.githubusercontent.com/yeetdesignsYD/Pterodactyl-Syntax-Addon/refs/heads/main/resources/scripts/modes.ts -o "/var/www/${dirName}/resources/scripts/modes.ts"
&& curl -fsSL https://raw.githubusercontent.com/yeetdesignsYD/Pterodactyl-Syntax-Addon/refs/heads/main/node_modules/codemirror/mode/jsx/jsx.js -o "/var/www/${dirName}/node_modules/codemirror/mode/jsx/jsx.js" 
&& cd "/var/www/${dirName}"
&& export NODE_OPTIONS=--openssl-legacy-provider 
&& yarn build:production
&& rm $setupScript
     ;;
     "Reviactyl")
       curl -fsSL https://raw.githubusercontent.com/yeetdesignsYD/Pterodactyl-Syntax-Addon/refs/heads/main/resources/scripts/modes.ts -o "/var/www/${dirName}/resources/scripts/modes.ts"
&& curl -fsSL https://raw.githubusercontent.com/yeetdesignsYD/Pterodactyl-Syntax-Addon/refs/heads/main/node_modules/codemirror/mode/jsx/jsx.js -o "/var/www/${dirName}/node_modules/codemirror/mode/jsx/jsx.js" 
&& cd "/var/www/${dirName}"
&& pnpm run build
&& rm $setupScript
     ;;
     "Exit")
    echo "Canceling the setup!"
    exit 0
    ;;
     esac
     done
