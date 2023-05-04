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

# Start Prometheus and Node Exporter
cd prometheus-2.44.0-rc.1.linux-amd64 
./prometheus &
cd ..
sleep 10
./node_exporter-1.5.0.linux-amd64/node_exporter &

echo "Prometheus and Node Exporter have been started."
