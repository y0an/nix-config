#/bin/bash

# $scindex: The Pulseaudio index of the current default sound card
scindex=$(pacmd list-sinks | awk '$1 == "*" && $2 == "index:" {print $3}')
# $cards: A list of card Pulseaudio indexes
cards=$(pacmd list-sinks | sed 's|*||' | awk '$1 == "index:" {print $2}')
PICKNEXTCARD=1 # Is true when the previous card is default
count=0 # count of number of iterations
for CARD in $cards; do
  if [ $CARD == $scindex ]; then # Choose the next card as default
    curindex=$count+1
  fi
  count=$((count+1))
done
nextscdesc=$(pacmd list-sinks | awk '$1 == "device.description" {print substr($0,5+length($1 $2))}' \
                         | sed 's|"||g' | awk -F"," 'NR==v1{print$0}' v1=$((curindex)))
echo "$nextscdesc" 
