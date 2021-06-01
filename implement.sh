docker rm -f $(docker ps -q)

docker-compose up -d

sleep 4

IP_NGINX_CONTAINER=http://$(docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' as02-docker)
echo "\nIP NGNIX CONTAINER: $IP_NGINX_CONTAINER"

docker ps -f status=running -f name=as02-docker

curl --url "http://localhost" | grep nginx.com

echo "\n\nCURL REMOTE FROM CONTAINER NGINX TO CONTAINER MYSQL"
docker exec -it as02-docker mysql -uroot -ppassword123! -h as02-docker-data

