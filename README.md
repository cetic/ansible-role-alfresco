# Ansible Role: Alfresco

[![Build Status](https://travis-ci.org/cetic/ansible-role-alfresco.svg?branch=master)](https://travis-ci.org/cetic/ansible-role-alfresco)
[![Ansible Galaxy](https://img.shields.io/badge/galaxy-_cetic.alfresco-blue.svg)](https://galaxy.ansible.com/cetic/alfresco/)

Installs Alfresco Community on RHEL/CentOS servers and Ubuntu servers with [ansible](http://www.ansible.com/home).

This repository is a fork from https://github.com/libersoft/ansible-alfresco
The goal here is to provide a standalone alfresco role that can be added in your playbooks.

## Requirements

Requires `unzip` and `wget` to be installed on the server. 

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

### tools

	imagemagick_version: '6.5.4.7'

### alfresco

	alfresco_build: '00012'
	alfresco_version: '4.2.f'
	alfresco_version_url: '{{alfresco_version}}'
	alfresco_archive_folder: ''
	alfresco_user: 'alfresco'
	alfresco_group: 'alfresco'
	alfresco_user_home: '/opt/alfresco'
	alfresco_data_home: '/opt/alfresco'
	alfresco_log_home: '/var/log/alfresco'
	alfresco_uid: '501'
	
### alfresco db

	alfresco_db_host: '127.0.0.1'
	alfresco_ip: 'localhost'
	alfresco_db_name: 'alfresco'
	alfresco_db_user: 'alfresco'
	alfresco_db_password: 'alfresco'
	alfresco_db_ip: 'localhost'
	alfresco_default_database_url: 'jdbc:mysql://{{ alfresco_db_ip }}/alfresco?useUnicode=true&characterEncoding=UTF-8&useFastDateParsing=false'

### solr alfresco
	
	setup_solr: true
	ip_solr: 'localhost'
	solr_port: '8080'
	solr_version_url: 'alfresco-community-solr-{{alfresco_version}}'
	solr_version: solr
	solr_war: apache-solr-1.4.1.war
	
To install Solr with Alfresco, set 'setup_solr' to true.
	
### geerlingguy java

	java_home: '/lib/jvm/jre-1.8.0-openjdk'

## Dependencies

  - geerlingguy.java

## Example Playbook

```yaml
- hosts: alfresco
  roles:
    - role: geerlingguy.java
    - role: cetic.alfresco
      become: true
```

## Future improvements

*  Provide DB connection
*  Provide more recent version of Alfresco & Solr 
*  Linux support 
*  Separate Tomcat - Alfresco roles

Feel free to contribute.

## License

[Gnu General Public License 3.0](https://www.gnu.org/licenses/gpl.html)

## Credits
*   This is a fork from https://github.com/libersoft/ansible-alfresco
