# Adding Ethereum Client to Monitoring Tool
This document describes the steps to add a new Ethereum client to our monitoring tool. Before proceeding with the following steps, ensure that you have the necessary access and permissions to install and configure software on the machine.

## Prerequisites
To add an Ethereum client to our monitoring tool, you need the following:

- JSON dashboard for the Ethereum client
- Prometheus configuration file for the Ethereum client

## Step 1: Expose Metrics
The first step to adding an Ethereum client to our monitoring tool is to expose metrics on a desired address. Every Ethereum client has a default address over which they expose metrics (e.g `localhost:portno/metrics`). Users can easily find this address by visiting the Ethereum client's official website.

## Step 2: Create Folder and Prometheus Configuration File
Once you have the Ethereum node metrics over an address, you can create a separate folder in the monitoring tool's directory for the Ethereum client. Name the folder with the Ethereum client's name (e.g., Besu, Nethermind).

In this folder, put a default Prometheus configuration file for the Ethereum client. The configuration file should look something like this:
```
# my global config
global:
  scrape_interval: 15s # Set the scrape interval to every 15 seconds. Default is every 1 minute.
  evaluation_interval: 15s # Evaluate rules every 15 seconds. The default is every 1 minute.
scrape_configs:
  - job_name: "node"
    static_configs:
      - targets: ["localhost:9100"]

  - job_name: "geth"
    static_configs:
      - targets: ["localhost:6060"]
    metrics_path: "/debug/metrics/prometheus"

# Replace the remote_write(url,username and password) with your credentials    
remote_write:
- url: ${remote_write_url}
  basic_auth:
    username: ${remote_write_username}
    password: ${remote_write_password}
```
This is just an example, and you should create the Prometheus configuration file according to your specific Ethereum client. Save this file as prometheus.yml in the newly created folder.

## Step 3: Update Installation Script
After adding the dashboard, creating the directory, and adding the Prometheus configuration file, update the installation script (installation.sh) to include the new Ethereum client.

1. Add your Ethereum client's name to the menu list. For example:
bash
```
    echo "Which Ethereum client are you using?"
    echo "1. Nethermind"
    echo "2. Geth"
    echo "3. Besu"
    echo "4. Erigon"
    echo "5. {new_client_name}"
```
2. Assign the value of the client_name variable in the if-else statement. For example:
```
    if [ $client_choice == 1 ]; then
    client_name="Nethermind"
    elif [ $client_choice == 2 ]; then
    client_name="Geth"
    elif [ $client_choice == 3 ]; then
    client_name="Besu"
    elif [ $client_choice == 4 ]; then
    client_name="Erigon"
    elif [ $client_choice == 5 ]; then
    client_name="new_client_name"
    else
    echo "Invalid choice"
    exit 1
    fi
```
## Step 4: Design Dashboard
Once you're done with metrics and prometheus.yml, metrics will be available in grafana(in case of remote-write). Now you can design the dashboards according to your needs. You can refer to official docs for [dashboard designing](https://grafana.com/docs/grafana/latest/dashboards/build-dashboards/create-dashboard/). 

## Conclusion
Once you have completed the above steps, you will have successfully added a new Ethereum client to our monitoring tool. You can now monitor your Ethereum client's metrics using our tool. If you encounter any issues during the process, please refer to our troubleshooting guide or contact our support team.