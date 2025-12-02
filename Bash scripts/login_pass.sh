#!/bin/bash

# Пользователь вводит логин.
read -p "Введите логин: " user_login

# Переменная определяющая макс. кол-во попыток ввода пароля
max_attempts=3
# Переменная - счетчик.
attempts=0

#  Основной цикл проверки
while [ $attempts -lt $max_attempts ]; do
    read -s -p "Введите пароль: " user_password
    echo"" # Перенос строки после скрытого ввода

    if [ "$user_password" = "pass123" ]; then
        echo"" "Вход выполнен." # Перенос строки после скрытого ввода
        exit 0 # Вход выполнен успешно
    else
        # Переменная-счетчик и переменная остатка попыток
        attempts=$((attempts += 1))
        remaining=$((max_attempts - attempts))
        if [ $remaining -gt 0 ]; then
            echo "Введен неправильный пароль. Осталось попыток: $remaining"
        else
            echo "Превышено число попыток. Доступ запрещен."
            exit 1 # Ошибка
        fi
    fi
done