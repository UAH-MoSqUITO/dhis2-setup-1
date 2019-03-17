
# Virtual machine setup

## Vagrant preparation

1.  Initialize `Vagrantfile`

    ```
    vagrant init bento/ubuntu-18.04
    ```

2.  Connect to VM

    ```
    vagrant ssh
    ```

3.  Change to setup directory

    ```
    cd /vagrant
    ```

## AWS EC2 preparation

1.  TODO Document EC2 VM creation

2.  Copy files to VM

    ```
    rsync -ai scripts ubuntu@$vm_public_ip:./
    ```

3.  Connect to VM

    ```
    ssh ubuntu@$vm_public_ip
    ```


# Server setup

## System preparation

1.  Setup system

    ```
    bash scripts/1-setup-system.bash
    ```
