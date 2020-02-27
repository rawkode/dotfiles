#!/usr/bin/env sh
read -s -p "Enter  Encryption Password: " encryption_password_1
echo
read -s -p "Repeat Encryption Password: " encryption_password_2
echo

if [ "${encryption_password_1}" != "${encryption_password_2}" ]; then
    echo "Passwords didn't match. Start again."
    exit 1
fi

read -s -p "Enter  Root Password: " root_password_1
echo
read -s -p "Repeat Root Password: " root_password_2
echo

if [ "${root_password_1}" != "${root_password_2}" ]; then
    echo "Passwords didn't match. Start again."
    exit 1
fi

read -s -p "Enter  User Password: " user_password_1
echo
read -s -p "Repeat User Password: " user_password_2
echo

if [ "${root_password_1}" != "${root_password_2}" ]; then
    echo "Passwords didn't match. Start again."
    exit 1
fi

read -s -p "Enter  WiFi Password: " wifi_password
echo

export encryption_password_1
export encryption_password_2
export root_password_1
export root_password_2
export user_password_1
export user_password_2
export wifi_password
export pacman_mirror="https://mirrors.kernel.org/archlinux/\\\$repo/os/\\\$arch"

envsubst < alis.default.conf > alis.conf

curl -o alis.sh https://raw.githubusercontent.com/picodotdev/alis/master/alis.sh
bash alis.sh
