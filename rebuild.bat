@echo off
nvm use 8.17.0
cd /d "%~dp0"

echo === Cleaning cache ===
if exist dist rmdir /s /q dist
if exist .output rmdir /s /q .output
if exist public\app\style.css del /q public\app\style.css
if exist node_modules rmdir /s /q node_modules

echo === Installing dependencies ===
call yarn install

echo === Building frontend assets ===
call npx gulp

echo === Running yarn run dist ===
call yarn run dist

echo === Done ===
nvm use 22.14.0
pause
