#!/bin/bash

read -p "Введите логин: " login
read -s -p "Введите пароль: " password


if [ "$password" = "pass123" ]; then
    echo ""
    echo "Вход выполнен"
else
    echo""
    echo "Введен неправильный пароль"
fi

# ver. 1.0 - Простой скрипт для проверки логина и пароля.