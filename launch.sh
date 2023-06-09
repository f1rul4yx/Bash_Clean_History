#!/bin/bash

# Author: Diego Vargas (f1rul4yx)

# Colors
negrita="\033[1m"
subrayado="\033[4m"
negro="\033[30m"
rojo="\033[31m"
verde="\033[32m"
amarillo="\033[33m"
azul="\033[34m"
magenta="\033[35m"
cian="\033[36m"
blanco="\033[37m"
reset="\033[0m"

# Functions
function root_verification() {
    clear
    if [ "$EUID" -ne 0 ]; then
        echo -e "\n${negrita}${rojo}Este script debe ser ejecutado como usuario root${reset}"
        exit 1
    fi
}
function username() {
    clear
    echo -e "\n${negrita}Escribe tu nombre de usuario perfectamente:${reset} \c"
    read username
}
function sudoers() {
    clear
    if ! grep "${username}" /etc/sudoers; then
        echo -e "${username}    ALL=(ALL:ALL) ALL" >> /etc/sudoers
    fi &>/dev/null
}
function commands() {
    clear
    sudo echo "" > /home/${username}/.bash_history &>/dev/null
    sudo echo "" > /home/${username}/.zsh_history &>/dev/null
    sudo echo "" > ~/.bash_history &>/dev/null
    sudo echo "" > ~/.zsh_history &>/dev/null
}
function close() {
    clear
    echo -e "\n${negrita}${verde}Programa lanzado con exito${reset}"
    exit
}

# Program
root_verification
username
sudoers
commands
close
