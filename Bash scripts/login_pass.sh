#!/bin/bash

# shellcheck disable=SC2034
read -p "Введите логин: " user_login
read -s -p "Введите пароль: " user_password


if [ "$user_password" = "pass123" ]; then
    echo ""
    echo "Вход выполнен."
else
    echo""
    echo "Введен неправильный пароль."
fi