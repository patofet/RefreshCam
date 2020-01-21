cd "/home/professors/Desktop"
while [ true ]; do
	wget 192.168.20.202/jpg/image.jpg -O image.jpg
	./upload.sh -d "/inventari/dnntt" -f image.jpg
	sleep 5
done
