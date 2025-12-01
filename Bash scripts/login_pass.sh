#!/bin/bash

# Заправшивает ввод пользовтаелем логина.
read -p "Введите логин: " user_login

# Максимальное кол-во попыток ввода пароля
max_attempts=3
# Счетчик попыток ввода начианается с нуля.
attempts=0

#  Основной цикл проверки
while [ $attempts -lt $max_attempts ]; do
    read -s -p "Введите пароль: " user_password
    echo # Перенос строки после скрытого ввода

    if [ "$user_password" = "pass123" ]; then
        echo"" "Вход выполнен."
        exit 0 # Вход выполнен успешно
    else
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