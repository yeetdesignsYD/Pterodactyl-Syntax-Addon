# Pterodactyl-Syntax-Addon
This will show you how to add JSX, TSX, and EJS syntax support

## Adding the language select mode
go to `/var/www/pterodactyl/resources/scripts/` and replace `mode.ts` with the `mode.ts` within this respository

## Adding the syntax mode
go to `/var/www/pterodactyl/node_modules/codemirror/mode/jsx` and replace `jsx.js` with the `jsx.js` within this respository


then follow the [docs](https://pterodactyl.io/panel/1.0/updating.html) to build the panel
