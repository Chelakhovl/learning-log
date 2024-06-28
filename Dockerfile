# Використовуємо офіційний образ Python 3.10 як базовий
FROM python:3.10

# Встановлюємо робочу директорію в контейнері
WORKDIR /app

# Копіюємо файл вимог у робочу директорію
COPY requirements.txt .

# Встановлюємо залежності з файлу requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Копіюємо весь проект у робочу директорію
COPY . .

# Виконуємо команду для міграції бази даних (створення таблиць)
RUN python manage.py migrate

# Вказуємо команду для запуску сервера Gunicorn
CMD ["gunicorn", "--chdir", "learning_log", "--bind", ":8000", "learning_log.wsgi:application"]

