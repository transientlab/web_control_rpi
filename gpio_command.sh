GPIO_PATH=/sys/class/gpio

pin_export()
{
    if [ ! -e $GPIO_PATH/gpio$1 ]; then
    echo $1 > $GPIO_PATH/export
    fi
}

pin_conf_output()
{
  sudo echo "out" > $GPIO_PATH/gpio$1/direction
}

pin_conf_input()
{
  echo "out" > $GPIO_PATH/gpio$1/direction
}

pin_state_get()
{
    if grep -q 0 $GPIO_PATH/gpio$1/value
    then return 0
    else return 1 
    fi 
}

pin_state_set_on()
{
  echo "1" > $GPIO_PATH/gpio$1/value
}

pin_state_set_off()
{
  echo "0" > $GPIO_PATH/gpio$1/value
}

pin_state_toggle()
{
    if pin_state_get "$1" == 0; then
    pin_state_set_on "$1"
    else
    pin_state_set_off "$1"
    fi
}

pins_configure_all()
{
  # relay 1
  pin_export "2"
  pin_conf_output "2"
  sleep 0.1
  # relay 2
  pin_export "3"
  pin_conf_output "3"
  sleep 0.1
  # relay 3
  pin_export "14"
  pin_conf_output "14"
  sleep 0.1
  # relay 4
  pin_export "15"
  pin_conf_output "15"
  sleep 0.1
  # relay 5
  pin_export "17"
  pin_conf_output "17"
  sleep 0.1
  # relay 6
  pin_export "27"
  pin_conf_output "27"
  sleep 0.1
  # relay 7
  pin_export "22"
  pin_conf_output "22"
  sleep 0.1
  # relay 8
  pin_export "23"
  pin_conf_output "23"
  sleep 0.1
}

pin_test_output() {
    pin_state_set_off "$1"
    sleep 0.2
    pin_state_toggle "$1"
    sleep 0.2
    pin_state_toggle "$1"
    sleep 0.2
}

while getopts n:1:2: flag
do
    case "${flag}" in
        n) number=${OPTARG};;
        1) var1=${OPTARG};;
        2) var2=${OPTARG};;
    esac
done


pins_configure_all
pin_test_output 2 0.1
pin_test_output 3  0.1
pin_test_output 14 0.1
pin_test_output 15 0.1
pin_test_output 17 0.1
pin_test_output 27 0.1
pin_test_output 22 0.1
pin_test_output 23 0.1