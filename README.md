# Ethereum Node Monitoring Tool
This monitoring tool is designed to monitor a Nethermind node using Grafana, Prometheus, and Grafana Agent. It includes a pre-built system usage metrics dashboard in JSON format and configuration files for Grafana Agent and Prometheus.

## Ethereum Node Monitoring Tool
The Nethermind Node Monitoring Tool is a collection of open-source software that can be used to monitor the performance and health of a Nethermind node. This tool includes:

- Grafana: A popular open-source dashboard and visualization platform.
- Prometheus: A powerful open-source monitoring and alerting toolkit.
- Node Exporter: Node Exporter is a Prometheus exporter that collects hardware and operating system metrics from a target system.
- Alertmanager : Alertmanager is a component of the Prometheus monitoring system that manages and sends alerts from Prometheus to various external systems, such as email, PagerDuty, or Slack.

## Features
This monitoring tool provides the following features:
- Real-time monitoring of Nethermind node performance and system metrics.
- Customizable dashboards to visualize node performance data.
- Alerting and notification capabilities to monitor for critical issues.

## Getting Started
To use this Monitoring Tool, there are two approch :
- Using Source Code
- Using docker (Recommended)

### Using Docker 
1. Clone the repository to your local machine:
```bash
    $ git clone https://github.com/GoutamVerma/ETH-India-Fellowship-3.0.git
```

2. Switch to docker branch and run the following commands
```bash
    $ git switch monitor/docker
    $ docker-compose up -d
    $ docker run -it --network host nethermind/n nethermind:alpine --Metrics.Enabled true
```
3. Check all the tool by visiting the below URLs.
    - Prometheus     https://localhost:9090
    - Grafana        https://localhost:3000
    - Node exporter  https://localhost:9100
    - Alertmanager   https://localhost:9093

### Using Source
1. Clone the repository to your local machine:
```bash
    $ git clone https://github.com/GoutamVerma/ETH-India-Fellowship-3.0.git
```
2. Install Grafana,Prometheus, Alertmanager and Node exporter on your server. You can follow the installation instructions on their respective websites:
    -   [Grafana Installation Guide](https://grafana.com/docs/grafana/latest/setup-grafana/installation/)
    -   [Prometheus Installation Guide](https://prometheus.io/docs/prometheus/latest/installation/)
    -   [Alertmanager Guide](https://prometheus.io/docs/alerting/latest/alertmanager/)
    -   [Node Exporter Guide](https://prometheus.io/docs/guides/node-exporter/)

3. Configure prometheus, node exporter and alertmanager files using the configuration files included in `monitor/config` branch. You can find them in the monitoring directory.

4. Start Grafana, Prometheus, node exporter and alertmanager:
```bash
    # Start Grafana
    $ sudo systemctl start grafana-server

    # Start alertmanager
    $ sudo systemctl start alertmanager

    # Start node exporter
    $ sudo systemctl start node_exporter

    # Start prometheus
    $ sudo systemctl start prometheus

```
5. Check all the tool by visiting the below URLs.
    - Prometheus     https://localhost:9090
    - Grafana        https://localhost:3000
    - Node exporter  https://localhost:9100
    - Alertmanager   https://localhost:9093 


6. Import the system usage metrics dashboard into Grafana. You can find the dashboard in the dashboards directory. To import the dashboard, follow these steps:
    
    -   In Grafana, click the "+" icon in the left-hand menu and select "Import".
    -   In the "Import" screen, click the "Upload .json File" button and select the `system-usage-metrics.json` file.
    -   Review the dashboard settings and click "Import".

6. Customize the dashboard to fit your needs. You can add additional panels or modify the existing ones to display the metrics that are most important to you.

## Contributing

If you'd like to contribute to the development of this monitoring tool, please feel free to submit pull requests or open issues on the repository. We welcome contributions from the community!

## License
This project is licensed under the MIT License - see the [LICENSE](https://github.com/GoutamVerma/ETH-India-Fellowship-3.0/blob/main/License.txt) file for details.
