#!/bin/bash

# Обработчик прерывания
trap 'echo "Операция прервана."; exit 1' INT

# Максимальное кол-во попыток ввода пароля
max_attempts=3
# Счетчик попыток, ввода начинается с нуля.
attempts=0

# Запрашивает ввод логина у пользователя
read -p "Введите логин: " user_login

#  Основной цикл проверки
while [ $attempts -lt $max_attempts ]; do
    read -s -p "Введите пароль: " user_password
    echo # Перенос строки после скрытого ввода

    # Проверка на пустой пароль
    if [ -z "$user_password" ]; then
      echo "Пароль не может быть пустым."
      continue
    fi

    # Проверка на соответствие введенного пароля.
    if [ "$user_password" = "pass123" ]; then
      printf "Вход выполнен.\n"
      unset user_password # Очистка переменной
      exit 0 # Вход выполнен успешно
    else
      attempts=$((attempts++))
      remaining=$((max_attempts - attempts))
      if [ $remaining -gt 0 ]; then
        echo "Введен неправильный пароль. Осталось попыток: $remaining"
      else
        echo "Превышено число попыток. Доступ запрещен."
        unset user_password # Очистка переменной
        exit 1 # Ошибка
      fi
    fi
done

# ver. 3.1
# Улучшена очистка переменных.
# Оптимизировано увеличение счётчика.
# Улучшен вывод сообщений.