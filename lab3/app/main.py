#!/usr/bin/env python3
import psycopg2
from config import host, user, password, dbname

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

            cursor.execute(
                f"SELECT * FROM {table_name}"
            )
            
            print(cursor.fetchall())
    
    except Exception as exeption:
        print(exeption)

    finally:
        if connection:
            connection.close()

Connect()