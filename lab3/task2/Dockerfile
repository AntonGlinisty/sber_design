FROM postgres:latest

RUN apt-get update && apt-get install python3 -y \
    && apt-get install vim -y \
    && apt-get install python3-flask -y \
    && apt-get install python3-psycopg2 -y

EXPOSE 5000

COPY ./app /app
WORKDIR /app

CMD [ "python3", "main.py" ]
