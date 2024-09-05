#!/usr/bin/env bash
set -x
set -e

repoRoot=$(realpath "$(dirname "$0")")

cd "$repoRoot"

## sh "./run.sh '${component}'" 


COMPONENT="$1"
if [[ -z "$COMPONENT" ]]; then
    echo "COMPONENT is not set"
    exit 1
fi



case "$COMPONENT" in
elastic)
    ansible-playbook -i environments/localhost/ deploy-elastic.yml --connection=local -v
    ;;
kibana)
    ansible-playbook -i environments/localhost/ --vault-password-file=~/.secrets/tass-ansible-vault deploy-kibana.yml --connection=local
    ;;
configurator)
    ansible-playbook -i environments/localhost/ --vault-password-file=~/.secrets/tass-ansible-vault deploy-configurator.yml --connection=local 
    ;;
heartbeat)
    ansible-playbook -i environments/localhost/ --vault-password-file=~/.secrets/tass-ansible-vault deploy-heartbeat.yml --connection=local 
    ;;
metricbeat)
    ansible-playbook -i environments/localhost/ --vault-password-file=~/.secrets/tass-ansible-vault deploy-metricbeat.yml --connection=local 
    ;;
filebeat)
    ansible-playbook -i environments/localhost/ --vault-password-file=~/.secrets/tass-ansible-vault deploy-filebeat.yml --connection=local 
    ;;
auditbeat)
    ansible-playbook -i environments/localhost/ --vault-password-file=~/.secrets/tass-ansible-vault deploy-auditbeat.yml --connection=local 
    ;;                         
kafka)
    ansible-playbook -i environments/localhost/ --vault-password-file=~/.secrets/tass-ansible-vault deploy-kafka.yml --connection=local 
    ;;
kafka-ui)
    ansible-playbook -i environments/localhost/ --vault-password-file=~/.secrets/tass-ansible-vault deploy-kafka-ui.yml --connection=local 
    ;;    
prometheus)
    ansible-playbook -i environments/localhost/ --vault-password-file=~/.secrets/tass-ansible-vault deploy-prometheus.yml --connection=local 
    ;;
grafana)
    ansible-playbook -i environments/localhost/ --vault-password-file=~/.secrets/tass-ansible-vault deploy-grafana.yml --connection=local 
    ;;
zabbix)
    ansible-playbook -i environments/localhost/ --vault-password-file=~/.secrets/tass-ansible-vault deploy-zabbix.yml --connection=local 
    ;;
checkmk)
    ansible-playbook -i environments/localhost/ --vault-password-file=~/.secrets/tass-ansible-vault deploy-checkmk.yml --connection=local 
    ;;
jenkins)
    ansible-playbook -i environments/localhost/ --vault-password-file=~/.secrets/tass-ansible-vault deploy-jenkins.yml --connection=local 
    ;;             
*) ;;
esac
