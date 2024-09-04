#!/bin/bash

# Масив URL для перевірки
websites=("https://google.com" "https://facebook.com" "https://twitter.com")

# Ім'я файлу для запису результатів
log_file="website_status.log"

# Очищення файлу логів перед новим запуском
> "$log_file"

# Перевірка кожного сайту у списку
for website in "${websites[@]}"; do
  # Використовуємо curl для надсилання HTTP запиту, перевіряючи статус 200
  status_code=$(curl -o /dev/null -s -w "%{http_code}" -L "$website")
  
  # Перевіряємо статус код і записуємо результат у лог файл
  if [ "$status_code" -eq 200 ]; then
    echo "$website is UP" >> "$log_file"
  else
    echo "$website is DOWN" >> "$log_file"
  fi
done

# Повідомлення про завершення та вивід назви файлу логів
echo "Перевірка завершена. Результати записані у файл $log_file."

