#!/bin/bash

GPIO=$1
if [ -z "$GPIO" ]; then
  echo "Please input GPIO pin."
  exit 1
fi
GPIODIR=/sys/class/gpio/gpio$GPIO

echo "Configuring GPIO $GPIO"

# current GPIO controller
for f in `ls -d /sys/class/gpio/gpiochip*`; do
  echo $f `cat $f/label $f/base $f/ngpio`
done

#check if the gpio is already exported
if [ ! -e "$GPIODIR" ]
then
  echo "Exporting GPIO"
  echo $GPIO > /sys/class/gpio/export
else
  echo "GPIO already exported"
fi

echo "Current direction: `cat $GPIODIR/direction`"
echo "Set GPIO as output"
echo out > $GPIODIR/direction
echo "New GPIO direction: `cat $GPIODIR/direction`"
echo "Current value: `cat $GPIODIR/value`"
echo "Set value as high"
echo 1 > $GPIODIR/value
echo "New value: `cat $GPIODIR/value`"

#Endless loop
echo "Start blinking, 1 sec on plus 1 sec off, press CTRL+C to end"
while ( true );
  do echo 1 > $GPIODIR/value
  cat $GPIODIR/value
  sleep 1
  echo 0 > $GPIODIR/value
  cat $GPIODIR/value
  sleep 1
done

# end of file
