#!/bin/bash

# Create a directory for monitoring
mkdir monitor 
cd monitor

#Download curl
sudo apt install curl

if [ ! -d "prometheus-2.44.0-rc.1.linux-amd64" ]; then
   curl -LO https://github.com/prometheus/prometheus/releases/download/v2.44.0-rc.1/prometheus-2.44.0-rc.1.linux-amd64.tar.gz
   tar xvfz prometheus-2.44.0-rc.1.linux-amd64.tar.gz
   rm -rf prometheus-2.44.0-rc.1.linux-amd64.tar.gz
fi

# Download Node Exporter if it doesn't exist
if [ ! -d "node_exporter-1.5.0.linux-amd64" ]; then
   curl -LO https://github.com/prometheus/node_exporter/releases/download/v1.5.0/node_exporter-1.5.0.linux-amd64.tar.gz
   tar xvfz node_exporter-1.5.0.linux-amd64.tar.gz
   rm -rf node_exporter-1.5.0.linux-amd64.tar.gz
fi

echo "Which Ethereum client are you using?"
echo "1. Nethermind"
echo "2. Geth"
echo "3. Besu"
echo "4. Erigon"

read -p "Enter your choice: " client_choice

if [ $client_choice == 1 ]; then
  client_name="Nethermind"
elif [ $client_choice == 2 ]; then
  client_name="Geth"
elif [ $client_choice == 3 ]; then
  client_name="Besu"
elif [ $client_choice == 4 ]; then
  client_name="Erigon"
else
  echo "Invalid choice"
  exit 1
fi

read -p "Do you want to provide custom config details? (y/n): " custom_choice


if [[ $custom_choice == "y" || $custom_choice == "Y" ]]; then
  read -p "Enter metrics path (default is /metrics): " metrics_path
  if [[ -z "$metrics_path" ]]; then
  metrics_path="/metrics"
  fi
  read -p "Enter metrics address : " metrics_address
  read -p "Enter remote write URL: " remote_write_url
  read -p "Enter remote write username: " remote_write_username
  read -p "Enter remote write password: " remote_write_password
  cd ..
  cat ./Monitor/Other/prometheus.yml | sed "s/\${metrics_path}/$metrics_path/g;s/\${metrics_address}/$metrics_address/g;s/\${remote_write_url}/$remote_write_url/g;s/\${remote_write_username}/$remote_write_username/g;s/\${remote_write_password}/$remote_write_password/g" > ./monitor/prometheus-2.44.0-rc.1.linux-amd64/prometheus.yml

elif [[ $custom_choice == "n" || $custom_choice == "N" ]]; then
  read -p "Enter remote write URL: " remote_write_url
  read -p "Enter remote write username: " remote_write_username
  read -p "Enter remote write password: " remote_write_password
  cd ..
  cat ./Monitor/$client_name/prometheus.yml | sed "s/\${remote_write_url}/$remote_write_url/g;s/\${remote_write_username}/$remote_write_username/g;s/\${remote_write_password}/$remote_write_password/g" > ./monitor/prometheus-2.44.0-rc.1.linux-amd64/prometheus.yml
fi

sleep 5
# Start Prometheus and Node Exporter
cd monitor/prometheus-2.44.0-rc.1.linux-amd64 
./prometheus &
cd ..
./node_exporter-1.5.0.linux-amd64/node_exporter &

echo "Prometheus and Node Exporter have been started."
