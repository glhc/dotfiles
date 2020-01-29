echo 'The current brightness of display 1:'
sudo ddcutil -d 1 getvcp 10 -t |awk '{print $4}'

echo 'The max brightness of display 1:'
sudo ddcutil -d 1 getvcp 10 -t |awk '{print $5}'
