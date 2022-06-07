for DOCKER in $(sudo docker ps | awk '{print $1}' | grep -v CONTAINER)
do
	IP=$(sudo docker inspect -f "{{ .NetworkSettings.IPAddress }}")
	echo CONTAINER: $DOCKER IP: $IP
done
