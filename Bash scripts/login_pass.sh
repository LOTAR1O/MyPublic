#!/bin/bash

# Пользователь вводит логин
read -p "Введите логин: " user_login
# Пользователь вводит пароль
read -s -p "Введите пароль: " user_password

# Проводится проверка пароля
if [ "$password" = "pass123" ]; then
    echo ""
    echo "Вход выполнен"
else
    echo""
    echo "Введен неправильный пароль"
fi
