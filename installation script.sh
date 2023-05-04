#!/bin/bash

# Create a directory for monitoring
mkdir monitor 
cd monitor

#Download curl
sudo apt install curl

# Download Node Exporter if it doesn't exist
if [ ! -d "prometheus-2.44.0-rc.1.linux-amd64" ]; then
   curl -LO https://github.com/prometheus/prometheus/releases/download/v2.44.0-rc.1/prometheus-2.44.0-rc.1.linux-amd64.tar.gz
   tar xvfz prometheus-2.44.0-rc.1.linux-amd64.tar.gz
   rm -rf prometheus-2.44.0-rc.1.linux-amd64.tar.gz
fi


if [ ! -d "node_exporter-1.5.0.linux-amd64" ]; then
   curl -LO https://github.com/prometheus/node_exporter/releases/download/v1.5.0/node_exporter-1.5.0.linux-amd64.tar.gz
   tar xvfz node_exporter-1.5.0.linux-amd64.tar.gz
   rm -rf node_exporter-1.5.0.linux-amd64.tar.gz
fi

echo "Which Ethereum client are you using?"
echo "1. Nethermind"
echo "2. Geth"
echo "3. Other"

read -p "Enter your choice: " choice

if [ $choice -eq 1 ]
then
  echo "You selected Nethermind"
  # Prompt user for remote write URL, username, and password
  read -p "Enter remote write URL: " remote_write_url
  read -p "Enter username for remote write: " remote_write_username
  read -s -p "Enter password for remote write: " remote_write_password
  echo ""
  # Create Prometheus configuration file
  cat > ./prometheus-2.44.0-rc.1.linux-amd64/prometheus.yml <<EOF
# my global config
global:
  scrape_interval: 15s # Set the scrape interval to every 15 seconds. Default is every 1 minute.
  evaluation_interval: 15s # Evaluate rules every 15 seconds. The default is every 1 minute.
scrape_configs:
  - job_name: "node"
    static_configs:
      - targets: ["localhost:9100"]

  - job_name: 'pushgateway'
    honor_labels: true
    static_configs:
    - targets: ['localhost:9091']
    
remote_write:
- url: ${remote_write_url}
  basic_auth:
    username: ${remote_write_username}
    password: ${remote_write_password}
EOF
elif [ $choice -eq 2 ]
then
  echo "You selected Geth"
  # Prompt user for remote write URL, username, and password
  read -p "Enter remote write URL: " remote_write_url
  read -p "Enter username for remote write: " remote_write_username
  read -s -p "Enter password for remote write: " remote_write_password
  echo ""
  # Create Prometheus configuration file
  cat > ./prometheus-2.44.0-rc.1.linux-amd64/prometheus.yml <<EOF
# my global config
global:
  scrape_interval: 15s # Set the scrape interval to every 15 seconds. Default is every 1 minute.
  evaluation_interval: 15s # Evaluate rules every 15 seconds. The default is every 1 minute.
scrape_configs:
  - job_name: "node"
    static_configs:
      - targets: ["localhost:9100"]

  - job_name: 'pushgateway'
    honor_labels: true
    static_configs:
    - targets: ['localhost:9091']
    
remote_write:
- url: ${remote_write_url}
  basic_auth:
    username: ${remote_write_username}
    password: ${remote_write_password}
EOF
elif [ $choice -eq 3 ]
then
  echo "You selected Other"
  # Prompt user for remote write URL, username, and password
  read -p "Enter remote write URL: " remote_write_url
  read -p "Enter username for remote write: " remote_write_username
  read -s -p "Enter password for remote write: " remote_write_password
  echo ""
  # Create Prometheus configuration file
  cat > ./prometheus-2.44.0-rc.1.linux-amd64/prometheus.yml <<EOF
# my global config
global:
  scrape_interval: 15s # Set the scrape interval to every 15 seconds. Default is every 1 minute.
  evaluation_interval: 15s # Evaluate rules every 15 seconds. The default is every 1 minute.
scrape_configs:
  - job_name: "node"
    static_configs:
      - targets: ["localhost:9100"]
    
remote_write:
- url: ${remote_write_url}
  basic_auth:
    username: ${remote_write_username}
    password: ${remote_write_password}
EOF
else
  echo "Invalid choice"
  exit
fi

# Start Prometheus and Node Exporter
cd prometheus-2.44.0-rc.1.linux-amd64 
./prometheus &
cd ..
sleep 10
./node_exporter-1.5.0.linux-amd64/node_exporter &

echo "Prometheus and Node Exporter have been started."
