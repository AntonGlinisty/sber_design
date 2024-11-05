#!/usr/bin/env python3

import psycopg2
from config import host, user, password, dbname

from flask import Flask
app = Flask(__name__)

def Connect():
    connection = None
    try:
        # Подключаемся к БД
        connection = psycopg2.connect(
            host=host,
            user=user,
            password=password,
            dbname=dbname
        )
        connection.autocommit = True

        table_name = "Films"

        with connection.cursor() as cursor:

            try:
                cursor.execute(
                    f"SELECT * FROM {table_name}"
                )
    
            except psycopg2.errors.UndefinedTable:
                cursor.execute(
                    f"""CREATE TABLE IF NOT EXISTS {table_name} (
                        film_name   VARCHAR(255),
                        director    VARCHAR(255),
                        year        INT
                    )"""
                )

                cursor.execute(
                    f"""INSERT INTO {table_name} VALUES
                        ('The Prestige', 'Christopher Nolan', 2006),
                        ('The Sixth Sense', 'M. Night Shyamalan', 1999),
                        ('Lucky Number Slevin', 'Paul McGuigan', 2006)
                    """
                )

                cursor.execute(
                    f"SELECT * FROM {table_name}"
                )

            films = cursor.fetchall()

            html = """
            <!DOCTYPE html>
            <html>
            <body>
                <h1>Список фильмов:</h1>
                <ul>
            """
                
            for item in films:
                html += f"<li>{item}</li>"
                
            html += """
                </ul>
            </body>
            </html>
            """

            return html
    
    except Exception as exeption:
        print(exeption)

    finally:
        if connection:
            connection.close()


@app.route("/")
def hello():
    return Connect()

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)