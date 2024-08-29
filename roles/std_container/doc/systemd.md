## Environment variables for std_container ansible role
Enviroment variables are written to a systemd service file.
Beware of variable substitution of systemd specifiers, compare 
[specifier documentation](https://www.freedesktop.org/software/systemd/man/systemd.unit.html#Specifiers).

Beware:
The specifier %H in the systemd service file will be substituted with the hostname of the host.

## Restart std_containers with systemd
Define restarting of service on failure 
[Systemd documentation](https://www.freedesktop.org/software/systemd/man/systemd.service.html#Restart=). To refrain from restarting systemd service indefinitely (by default) one needs to define StartLimit* parameter. See example below and following [serverfault article](https://serverfault.com/questions/736624/systemd-service-automatic-restart-after-startlimitinterval)

### Rate limit number of restarts

* Configure service start rate limiting: [Systemd Documentation](https://www.freedesktop.org/software/systemd/man/systemd.unit.html#StartLimitIntervalSec=interval)
  * `Restart` defines when to restart (always, on-failure, ...)
  * `RestartSec` defines how many seconds to wait before restarting
  * Configure unit start rate limiting. Units which are started more than n times (`StartLimitBurst`) within an time interval in seconds (`StartLimitInterval`) are not permitted to start any more. Default is `0` (unlimited).
  * Following constraint needs to be met otherwise the unit will still start unlimited: 
  `StartLimitInterval > StartLimitBurst * RestartSec`
* Disable rate limiting: `sc_restart_count: 0`

### Example systemd service
Given example will restart three times and then timeout
```
# /etc/systemd/system/fail.service
[Unit]
Description=failing service
After=docker.service
Requires=docker.service

[Service]
TimeoutStartSec=0
Restart=on-failure
RestartSec=10
StartLimitInterval=40
StartLimitBurst=3
ExecStart=/usr/local/bin/fail.sh

[Install]
WantedBy=multi-user.target
```

* Example script to test failing service
```
root@foobar:/etc/systemd/system# cat /usr/local/bin/fail.sh 
#!/bin/sh
sleep 1
exit 1
```
