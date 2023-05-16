# EthAware
![logo](https://user-images.githubusercontent.com/66783850/230303630-294be86b-5e90-4a3a-bcfa-9b5b06648d42.png)

ETH Aware is monitoring tool designed to monitor a Ethreum node(including Nethermind, Geth, Besu, Erigon) using Grafana and Prometheus. It includes a pre-configured yml files for Prometheus and JSON format Grafana dashboards.

# Getting Started
## Prerequisites
- Linux system with Bash shell.
- Access to a Grafana Cloud account.

## Installing ETH Aware
1.  Clone the ETH-Aware repository:
```
    $ git clone https://github.com/GoutamVerma/ETH-Aware.git
```
2. Navigate to the ETH-Aware directory:
```
    $ cd ETH-Aware
```
3. Give executable permission to a script file "script.sh"
```
    $ chmod +x intallation.sh
```
4. Run the installation script:
```
    $ ./intallation.sh
```

This script will ask you for the following information:

- Which Ethereum client you are using (Nethermind, Geth, Besu, Erigon or Other)
- Your Grafana Cloud credentials for remote_write (username, URL, and key)

You can find the `/api/prom/push` URL, username, and password for your metrics endpoint by clicking on Details in the Prometheus card of the [Cloud Portal](https://grafana.com/docs/grafana-cloud/cloud-portal/). After providing this information, the script will start the Prometheus, Node_exporter in background and set up the remote_write for Prometheus.


## Importing Dashboards in Grafana Cloud
To use an ETH-Aware dashboard in your Grafana Cloud instance, follow these steps:

1. Log in to your Grafana Cloud account.

2. Click on the "+" button in the left-hand menu and select "Import".

3. Select the desired dashboard from the Dashboards directory of the ETH-Aware repository:

   - `nethermind.json` for Nethermind
   - `geth.json` for Geth
   - `besu.json` for Besu
   - `erigon.json` for Erigon
   - `system-usage.json` for system usage (common for all Ethereum clients)
4. On the "Import Dashboard" page, select the Prometheus data source that you want to use.

5. Click "Import" to import the dashboard into your Grafana Cloud instance.

6. Customize the dashboard as needed. You can add or remove panels, change the display options, and more.

## Demo Video


https://github.com/GoutamVerma/ETH-Aware/assets/66783850/8e88c73b-f1f3-4f2a-af6d-e481a86ad051



## Troubleshoot

This bash script are assuming that your Ethereum client are already exposing their metrics to their default port: 
- Nethermind : https://localhost:9091/metrics
- Geth : https://localhost:6060/debug/metrics/prometheus
- Besu : https://localhost:9545/metrics
- Erigon : https://localhost:6060/debug/metrics/prometheus

## Directory Structure 
```
    ETH-Aware/
    ├── Dashboards/
    │   ├── besu.json
    │   ├── erigon.json
    │   ├── geth.json
    │   ├── nethermind.json
    │   └── system-usage.json
    ├── Docs/
    │   ├── Import-dashboards.md
    │   ├── Installation.md
    │   ├── add-ethereum-client.md
    │   ├── remote-write.md
    │   └── README.md
    ├── Monitor/
    │   ├── Besu/
    │   │   └── prometheus.yml
    │   ├── Erigon/
    │   │   └── prometheus.yml
    │   ├── Geth/
    │   │   └── prometheus.yml
    │   ├── Nethermind/
    │   │   └── prometheus.yml
    │   └── Other/
    │       └── prometheus.yml
    ├── Snapshots
    ├── License.txt
    ├── README.md
    └── installation.sh
```
## Features
This monitoring tool provides the following features:
- Real-time monitoring of Nethermind node performance and system metrics.
- Customizable dashboards to Ethereum node performance data.
- Alerting and notification capabilities to monitor for critical issues.

## Usage
- Once you have imported an ETH-Aware dashboard, it will automatically collect metrics from your Ethereum client and display them in Grafana Cloud. You can access your dashboard at any time by logging into your Grafana Cloud account.

- If you want to remove a dashboard, you can click on the gear icon in the top-right corner of the dashboard and select "Delete".


## Contributing

If you'd like to contribute to the development of this monitoring tool, please feel free to submit pull requests or open issues on the repository. We welcome contributions from the community or individuals!

## License
This project is licensed under the MIT License - see the [LICENSE](https://github.com/GoutamVerma/ETH-India-Fellowship-3.0/blob/main/License.txt) file for details.
