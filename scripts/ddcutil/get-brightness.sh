DISPLAYS=`sudo ddcutil detect -t \
  |grep -i display |awk '{print $2}' \
  |paste -sd " "`

for DISPLAY in $DISPLAYS; do

  BRIGHTNESS=`sudo ddcutil -d $DISPLAY getvcp 10 -t |awk '{print $4}'`
  echo "The current brightness of Display $(echo $DISPLAY): $(echo $BRIGHTNESS)"

done
