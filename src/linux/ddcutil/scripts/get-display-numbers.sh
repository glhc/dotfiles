# for specifying in the "-d" flag
sudo ddcutil detect -t \
  | grep -i display |awk '{print $2}' \
  | paste -sd " "
