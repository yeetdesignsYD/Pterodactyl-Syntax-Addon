# Pterodactyl-Syntax-Addon
This will show you how to add JSX, TSX, and EJS syntax support

## Installation
[Stock Pterodactyl](https://pterodactyl.io):
```bash
curl -fsSL https://raw.githubusercontent.com/yeetdesignsYD/Pterodactyl-Syntax-Addon/refs/heads/main/resources/scripts/mode.ts -o /var/www/pterodactyl/resources/scripts/mode.ts 
&& curl -fsSL https://raw.githubusercontent.com/yeetdesignsYD/Pterodactyl-Syntax-Addon/refs/heads/main/node_modules/codemirror/mode/jsx/jsx.js -o /var/www/pterodactyl/node_modules/codemirror/mode/jsx/jsx.js 
&& cd /var/www/pterodactyl 
&& export NODE_OPTIONS=--openssl-legacy-provider 
&& yarn build:production
```
[Reviactyl](https://reviactyl.app):
```bash
curl -fsSL https://raw.githubusercontent.com/yeetdesignsYD/Pterodactyl-Syntax-Addon/refs/heads/main/resources/scripts/modes.ts -o /var/www/reviactyl/resources/scripts/modes.ts 
&& curl -fsSL https://raw.githubusercontent.com/yeetdesignsYD/Pterodactyl-Syntax-Addon/refs/heads/main/node_modules/codemirror/mode/jsx/jsx.js -o /var/www/reviactyl/node_modules/codemirror/mode/jsx/jsx.js 
&& cd /var/www/reviactyl 
&& pnpm run build
```

## Adding the language select mode
go to `/var/www/pterodactyl/resources/scripts/` and replace `mode.ts` with the `mode.ts` within <a href="/resources/scripts">`/resources/scripts/`</a>
## Adding the syntax mode
go to `/var/www/pterodactyl/node_modules/codemirror/mode/jsx` and replace `jsx.js` with the `jsx.js` within <a href="/node_modules/codemirror/mode/jsx">`/node_modules/codemirror/mode/jsx`</a>


## How to build with the changes?
For [Pterodactyl](https://pterodactyl.io)
You will need to run these commands.
```bash
export NODE_OPTIONS=--openssl-legacy-provider
```
and
```bash
yarn build:production
```

For [Reviactyl](https://reviactyl.app):
```bash
pnpm run build
```
