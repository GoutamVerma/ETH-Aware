# Configuring Remote Write in Prometheus for Grafana
Remote write is a Prometheus feature that allows you to send metrics data from Prometheus to a remote storage system, such as Grafana Cloud. This feature is useful if you want to use Grafana Cloud for long-term storage and analysis of your metrics data.

To configure remote write in Prometheus with Grafana Cloud, follow these steps:

## Step 1: Set Up a Remote Write Endpoint in Grafana Cloud
1. Log in to your Grafana Cloud account.
2. Click on the "Metrics" tab in the left-hand menu and select "Prometheus" from the list of data sources.
3. Click on the "Details" button in the Prometheus card to view the details of the data source.
4. Scroll down to the "Remote Write" section and click on the "Add Remote Write" button.
5. Enter a name for the remote write endpoint and the URL for the endpoint. This URL will be used to send metrics data from Prometheus to Grafana Cloud.
6. Enter your Grafana Cloud username and password or API key in the appropriate fields.
7. Click on the "Save" button to save the remote write endpoint.


## Step 2: Configure Remote Write in Prometheus
1. Open the Prometheus configuration file (prometheus.yml) in a text editor.
2. Add the following lines to the configuration file to enable remote write:
```
remote_write:
  - url: <remote-write-url>
    basic_auth:
      username: <username>
      password: <password>
```
3. Replace <remote-write-url>, <username>, and <password> with the corresponding values from your Grafana Cloud remote write endpoint.

4. Save the changes to the configuration file.

For more details on how to get grafana credentails please refer to this [article](https://grafana.com/docs/grafana-cloud/account-management/cloud-portal/).
