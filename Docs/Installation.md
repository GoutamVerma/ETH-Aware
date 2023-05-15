## ETH-Aware Installation Guide

1. Clone the ETH-Aware repository:

    ```
    $ git clone https://github.com/GoutamVerma/ETH-Aware.git
    ```

2. Navigate to the ETH-Aware directory:

    ```
    $ cd ETH-Aware
    ```

3. Give executable permission to the `script.sh` file:

    ```
    $ chmod +x script.sh
    ```

4. Run the installation script:

    ```
    $ ./script.sh
    ```

    During the installation process, the script will ask for the following information:
    - Which Ethereum client you are using (Nethermind, Geth, Besu, Erigon or Other)
    - Your Grafana Cloud credentials for remote_write (username, URL, and key)

    You can find the `/api/prom/push` URL, username, and password for your metrics endpoint by clicking on "Details" in the Prometheus card of the Cloud Portal.

5. Importing Dashboards in Grafana Cloud:

    To import an ETH-Aware dashboard in your Grafana Cloud instance, follow the steps below:

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