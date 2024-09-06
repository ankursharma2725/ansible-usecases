# Ansible Role kibana-docker

The role deploys kibana as a systemd-managed docker container. 

## Role Variables

These vars are not defined in `defaults/main.yml` but required:
* `kibana_role.conf_dir` target host path to kibana config
* `kibana_role.basepath` path for kibana under root site URL
* `kibana_role.user` path for kibana under root site URL
* `kibana_role.labels` labels array for kibana container

## Dependencies

`std_container`

## Example Playbook

* xpack version

  ```yaml
  - name: kibana
    hosts: frontend
    vars:
      kibana_role.image_name: "<xpack-image>"
      kibana_role.image_tag: "6.3.1"
      kibana_role.id: "docker_demo"
      kibana_role.conf_dir: "/opt/projects/{{ kibana_role.id }}/kibana"
      kibana_role.basepath: "/docker/demo/kibana"
      kibana_role.user: "kibanaserver"
      kibana_role.yml_template: "kibana.yml"
    roles:
    - kibana-docker
   ```

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
