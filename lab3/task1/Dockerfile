FROM postgres:latest

RUN apt-get update && apt-get install python3 -y \
    && apt-get install vim -y && apt-get install python3-psycopg2 -y

COPY ./app /app
WORKDIR /app

CMD [ "postgres" ]