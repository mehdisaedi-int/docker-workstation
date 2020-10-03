XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth
touch $XAUTH
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
xhost +
# in docker-compose include the following
#      DISPLAY: $DISPLAY # for mac DISPLAY=docker.for.mac.host.internal:0 # --before running docker-compose and after running xhost +
#      XAUTHORITY: /tmp/.docker.xauth
#    volumes:
#      - /tmp/.X11-unix:/tmp/.X11-unix
#      - /tmp/.docker.xauth:/tmp/.docker.xauth

#after starting the container run
#docker exec -it -u developer unity bash