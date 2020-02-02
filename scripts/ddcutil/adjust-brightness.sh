# Increase the brightness of display 3 by 25%
# for specifying in the "-d" flag

# Get a space-separated list of display numbers
DISPLAYS=`sudo ddcutil detect -t \
  |grep -i display |awk '{print $2}' \
  |paste -sd " "`

# iterate over each display
for DISPLAY in $DISPLAYS; do
  sudo ddcutil -d $DISPLAY setvcp 10 "$1"
done


