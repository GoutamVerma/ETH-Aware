# Ethereum Node Monitoring Tool
This monitoring tool is designed to monitor a Nethermind node using Grafana, Prometheus, and Grafana Agent. It includes a pre-built system usage metrics dashboard in JSON format and configuration files for Grafana Agent and Prometheus.

## Ethereum Node Monitoring Tool
The Nethermind Node Monitoring Tool is a collection of open-source software that can be used to monitor the performance and health of a Nethermind node. This tool includes:

- Grafana: A popular open-source dashboard and visualization platform.
- Prometheus: A powerful open-source monitoring and alerting toolkit.
- Grafana Agent: A lightweight agent that collects metrics and sends them to Prometheus.

## Features
This monitoring tool provides the following features:
- Real-time monitoring of Nethermind node performance and system metrics.
- Customizable dashboards to visualize node performance data.
- Alerting and notification capabilities to monitor for critical issues.

## Getting Started
To use the Nethermind Node Monitoring Tool, follow these steps:

1. Clone the repository to your local machine:
```bash
https://github.com/GoutamVerma/ETH-India-Fellowship-3.0.git
```
2. Install Grafana and Prometheus on your server. You can follow the installation instructions on their respective websites:
    
    -   [Grafana Installation Guide](https://grafana.com/docs/grafana/latest/setup-grafana/installation/)
    -   [Prometheus Installation Guide](https://prometheus.io/docs/prometheus/latest/installation/)

3. Configure Grafana Agent and Prometheus using the configuration files included in this repository. You can find them in the config directory.

4. Start Grafana, Prometheus, and Grafana Agent:
```bash
# Start Grafana
sudo systemctl start grafana-server

# Start Prometheus
./prometheus --config.file=prometheus.yml

# Start Grafana Agent
./grafana-agent --config.file=grafana-agent.yml
```
5. Import the system usage metrics dashboard into Grafana. You can find the dashboard in the dashboards directory. To import the dashboard, follow these steps:
    
    -   In Grafana, click the "+" icon in the left-hand menu and select "Import".
    -   In the "Import" screen, click the "Upload .json File" button and select the `system-usage-metrics.json` file.
    -   Review the dashboard settings and click "Import".

6. Customize the dashboard to fit your needs. You can add additional panels or modify the existing ones to display the metrics that are most important to you.

## Contributing

If you'd like to contribute to the development of this monitoring tool, please feel free to submit pull requests or open issues on the repository. We welcome contributions from the community!

## License
This project is licensed under the MIT License - see the [LICENSE]() file for details.