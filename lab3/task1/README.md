##### Приложение представляет собой flask сервер. Сервер работает на порту 5000 и на корневой ручке выдает "SELECT *" из таблицы films БД postgres.

##### Запуск контейнера:
```
docker run --rm -d -p 5000:5000 -e POSTGRES_PASSWORD=postgres --name={{container_name}} glinisty/lab3_task1
```

##### Запуск flask сервера:
```
docker exec -it {{container_name}} python3 main.py
```

##### Вводим в браузере URL "http://localhost:5000/" и смотрим результат.