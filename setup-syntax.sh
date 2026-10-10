
#!/bin/bash

# Add Node.js / NVM binaries to PATH
export PATH="/root/.nvm/versions/node/v22.23.2/bin:$PATH"

promptMsg="What is the directory name for the panel?:"
setupScript="$(realpath -- "$0")"

echo "$promptMsg"
read -r dirName

# Check for empty input or whitespace
if [[ -z "${dirName//[[:space:]]/}" ]]; then
    echo "No name was provided! To try again, run this script."
    echo "EXITING..."
    exit 1
fi

panelDir="/var/www/${dirName}"

# Check that the panel directory exists
if [[ ! -d "$panelDir" ]]; then
    echo "Error: Panel directory does not exist: $panelDir"
    exit 1
fi

# Check required directories
if [[ ! -d "$panelDir/resources/scripts" ]]; then
    echo "Error: Directory not found: $panelDir/resources/scripts"
    exit 1
fi

if [[ ! -d "$panelDir/node_modules/codemirror/mode/jsx" ]]; then
    echo "Error: Directory not found: $panelDir/node_modules/codemirror/mode/jsx"
    exit 1
fi

options=(
    "Pterodactyl"
    "Reviactyl"
    "Exit"
)

select option in "${options[@]}"; do
    case "$option" in
        "Pterodactyl")
            echo "Setting up Pterodactyl..."

            if
                curl -fsSL \
                    "https://raw.githubusercontent.com/yeetdesignsYD/Pterodactyl-Syntax-Addon/refs/heads/main/resources/scripts/modes.ts" \
                    -o "$panelDir/resources/scripts/modes.ts" &&
                curl -fsSL \
                    "https://raw.githubusercontent.com/yeetdesignsYD/Pterodactyl-Syntax-Addon/refs/heads/main/node_modules/codemirror/mode/jsx/jsx.js" \
                    -o "$panelDir/node_modules/codemirror/mode/jsx/jsx.js" &&
                cd "$panelDir" &&
                export NODE_OPTIONS=--openssl-legacy-provider &&
                yarn build:production
            then
                echo "Build completed successfully!"

                if rm -f -- "$setupScript"; then
                    echo "Setup script deleted."
                else
                    echo "Warning: Could not delete setup script."
                fi
            else
                echo "Setup failed! Check the errors above and try again."
            fi

            break
            ;;

        "Reviactyl")
            echo "Setting up Reviactyl..."

            if
                curl -fsSL \
                    "https://raw.githubusercontent.com/yeetdesignsYD/Pterodactyl-Syntax-Addon/refs/heads/main/resources/scripts/modes.ts" \
                    -o "$panelDir/resources/scripts/modes.ts" &&
                curl -fsSL \
                    "https://raw.githubusercontent.com/yeetdesignsYD/Pterodactyl-Syntax-Addon/refs/heads/main/node_modules/codemirror/mode/jsx/jsx.js" \
                    -o "$panelDir/node_modules/codemirror/mode/jsx/jsx.js" &&
                cd "$panelDir" &&
                pnpm run build
            then
                echo "Build completed successfully!"

                if rm -f -- "$setupScript"; then
                    echo "Setup script deleted."
                else
                    echo "Warning: Could not delete setup script."
                fi
            else
                echo "Setup failed! Check the errors above and try again."
            fi

            break
            ;;

        "Exit")
            echo "Canceling the setup!"
            exit 0
            ;;

        *)
            echo "Invalid option. Please select a valid number."
            ;;
    esac
done
