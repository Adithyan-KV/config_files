#!/bin/sh

list_available_displays(){
    #parse xrandr output to get names of all displays
    xrandr|grep "connected"|awk '{print$1}'
}

count_displays(){
    #count the number of display names using \n as seperator
    list_available_displays|wc|awk '{print$1}'
}

DISPLAY_COUNT=$(count_displays)
echo $DISPLAY_COUNT' displays found'

#If there is more than one display available turn off the laptop
#inbuilt display and set another display as primary
LAPTOP_DISPLAY=$(list_available_displays|awk 'FNR == 1 {print}')
if [ $DISPLAY_COUNT -ge 2 ]
    SECOND_DISPLAY=$(list_available_displays|awk 'FNR == 2 {print}')
then
    echo 'Setting external display '$SECOND_DISPLAY' as primary...'
    xrandr --output $SECOND_DISPLAY --primary
    echo 'turning off laptop display '$LAPTOP_DISPLAY'...'
    xrandr --output $LAPTOP_DISPLAY --off --output $SECOND_DISPLAY --auto
else
    xrandr --output $LAPTOP_DISPLAY --auto
fi
