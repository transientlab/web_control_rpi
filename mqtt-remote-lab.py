import subprocess
from time import sleep

broker_url = 'f30aecedfa9d4b97a6d732678e116680.s2.eu.hivemq.cloud'
broker_port = 8883
broker_user = 'kr315'
broker_pass = 'zzx00cvv'
in_msg_channel = '/cmd/in'
out_msg_channel = '/cmd/out'
msg_count = 1

retreive = f'mosquitto_sub -h {broker_url} -p {broker_port} -u {broker_user} -P {broker_pass} -t {in_msg_channel} -C {msg_count}'
msg = subprocess.check_output(retreive, shell=True, timeout=30).decode('utf-8').strip()
print(msg)

sleep(1)
response = subprocess.check_output(msg, shell=True, timeout=10).decode('utf-8').strip()
print(response)

sleep(1)
respond = f'mosquitto_pub -h {broker_url} -p {broker_port} -u {broker_user} -P {broker_pass} -t {out_msg_channel} -m "{response}"'
out = subprocess.check_output(respond, shell=True, timeout=10)
print(out)
