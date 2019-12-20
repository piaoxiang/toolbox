#!/bin/bash

GPIO=$1
if [ -z "$GPIO" ]; then
  echo "Please input GPIO pin."
  exit 1
fi
GPIODIR=/sys/class/gpio/gpio$GPIO

OUTPUT_MODE=$2
if [ -z "$GPIO" ]; then
  OUTPUT_MODE=1
fi

echo "Configuring GPIO $GPIO mode $OUTPUT_MODE"

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
echo "Set value as $OUTPUT_MODE"
echo $OUTPUT_MODE > $GPIODIR/value
echo "New value: `cat $GPIODIR/value`"

# end of file
