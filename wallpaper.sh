#!/bin/bash

# Путь к файлам обоев
light_wallpaper="Users/mykytatishkin/Downloads/WALLP/day.jpg"
dark_wallpaper="Users/mykytatishkin//Downloads/WALLP/night.jpg"

# Функция для изменения обоев
change_wallpaper() {
    # Определяем, включена ли темная тема
    if [[ $(defaults read -g AppleInterfaceStyle) == "Dark" ]]; then
        osascript -e "tell application \"System Events\" to set picture of every desktop to \"$dark_wallpaper\""
    else
        osascript -e "tell application \"System Events\" to set picture of every desktop to \"$light_wallpaper\""
    fi
}

# Запускаем функцию изменения обоев при каждом запуске скрипта
change_wallpaper

# Запускаем функцию изменения обоев через равные интервалы времени
while true; do
    sleep 5m # Интервал времени в минутах
    change_wallpaper
done