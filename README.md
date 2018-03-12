# Ansible Role: Alfresco

[![Build Status](https://travis-ci.org/cetic/ansible-role-alfresco.svg?branch=master)](https://travis-ci.org/cetic/ansible-role-alfresco)

Installs Alfresco Community on RHEL/CentOS servers with [ansible](http://www.ansible.com/home).

## Requirements

Requires `unzip` to be installed on the server. 

## Role Variables

Available variables are listed below, along with default values (see `defaults/main.yml`):

### tomcat
tomcat_version: '7.0.61'
java_opts: '-Xms512m -Xmx1024m -Xss768k -XX:NewSize=256m -server'
tomcat_dir: '{{ home }}/tomcat'
tomcat_port: '8080'
tomcat_port_ajp: '8009'
tomcat_port_https: '8443'
tomcat_port_shutdown: '8005'

### db
alfresco_db: 'mysql'
alfresco_db_host: 'localhost'
alfresco_db_name: 'alfresco'
alfresco_db_user: 'alfresco'
alfresco_db_password: 'alfresco'

### mysql
mysql_root_db_pass: 'root'
mysql_connector_version: '5.1.35'

### postgresql
postgresqlversion: '9.3'
postgresql_build: '1'

### tools
imagemagick_version: '6.5.4.7'

### alfresco
alfresco_build: '00012'
alfresco_version: '4.2.f'
alfresco_user: 'alfresco'
alfresco_group: 'alfresco'
alfresco_user_home: '/opt/alfresco'
alfresco_data_home: '/opt/alfresco'
alfresco_log_home: '/var/log/alfresco'
alfresco_uid: '501'
alfresco_indexing: 'lucene'

### solr
solr_host: 'localhost'
solr_port: '8080'

## Dependencies

  - geerlingguy.java

## Example Playbook

```yaml
- hosts: alfresco
  roles:
    - role: geerlingguy.java
    - role: cetic.ansible-role-alfresco
      become: true
```

### Vagrant


## Future improvements

*   Include Apache Solr
*   Apt-based distro compatibility
*   Some refactoring (conditionals, variables, tags, users)
*   Multi machine environment
*   SSL enabled version

Feel free to contribute.

## License

[Gnu General Public License 3.0](https://www.gnu.org/licenses/gpl.html)

## Credits
*   This a fork from https://github.com/libersoft/ansible-alfresco 
