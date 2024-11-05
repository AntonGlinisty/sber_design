image_name=glinisty/lab3_task1
container_name=lab3

docker stop $container_name
docker rm $container_name
docker rmi $image_name

docker build -t $image_name ./
docker run -d -p 5000:5000 -e POSTGRES_PASSWORD=postgres --name=$container_name $image_name
