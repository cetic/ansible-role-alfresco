# Ansible Role: Alfresco

[![Build Status](https://travis-ci.org/cetic/ansible-role-alfresco.svg?branch=master)](https://travis-ci.org/cetic/ansible-role-alfresco)
[![Ansible Galaxy](https://img.shields.io/badge/galaxy-_cetic.alfresco-blue.svg)](https://galaxy.ansible.com/cetic/alfresco/)

Installs Alfresco Community on RHEL/CentOS 7 with [ansible](http://www.ansible.com/home).

The goal is to provide a standalone alfresco role that can be added into your playbooks.

The ansible role allows you to install, for the moment, the version 4.2 or 5.2 of Alfresco.

## Requirements

You can use these ansible roles to set up a mysql or a postgresql database:
* https://github.com/geerlingguy/ansible-role-mysql
* https://github.com/geerlingguy/ansible-role-postgresql

## Role Variables for Alfresco 4.2

Available variables are listed below, along with default values (see `defaults/main.yml`):

### tomcat

	tomcat_version: '8.5.31'
	tomcat_port: '8080'
	tomcat_port_ajp: '8009'
	tomcat_port_https: '8443'
	tomcat_port_shutdown: '8005'
	tomcat_group: 'alfresco'
	tomcat_user: 'alfresco'
	tomcat_user_home: '/opt/alfresco/tomcat'
	
You can set variables related to tomcat here.

### tools

	imagemagick_version: '6.5.4.7'
	
You can set the version of imagemagick by passing it in here.

### alfresco

You can set variables related to alfresco here.

	alfresco_build: '00012'
	alfresco_version: '4.2.f'
	alfresco_version_url: '{{alfresco_version}}'
	alfresco_archive_folder: ''
	alfresco_user: 'alfresco'
	alfresco_group: 'alfresco'
	java_opts: '-Xms512m -Xmx1024m -Xss768k -XX:NewSize=256m -server'
	
The user and group under which Alfresco will run.	
	
	alfresco_user_home: '/opt/alfresco'
	alfresco_data_home: '/opt/alfresco'
    alfresco_uid: '501'
	
The directories where Alfresco will be installed.
	
	alfresco_log_home: '/var/log/alfresco'
	
The directory for the logs of Alfresco.
	
### alfresco db

	alfresco_db_host: '127.0.0.1'
	alfresco_ip: 'localhost'
	alfresco_db_name: 'alfresco'
	alfresco_db_user: 'alfresco'
	alfresco_db_password: 'alfresco'
	alfresco_db_ip: 'localhost'
	alfresco_db_driver: 'com.mysql.jdbc.Driver'
	alfresco_default_database_url: 'jdbc:mysql://{{ alfresco_db_ip }}/alfresco?useUnicode=true&characterEncoding=UTF-8&useFastDateParsing=false'

You can set variables related to the installed database. It needs to create a user/password and a database.

### mysql-java-connector

setup_mysql_java_connector: true
mysql_connector_version: '5.1.35'

In the case where you use a mysql database, you need to install the mysql connector for java by passing `setup_mysql_java_connector` to true.
	
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
	
## Role Variables for Alfresco 5.2

Available variables for Alfresco 5.2 are listed below:

### alfresco

You can set these variables to have an Alfresco 5.2.

	alfresco_build: '00028'
	alfresco_version: '201707'	
	alfresco_version_url: 'distribution-201707'
	alfresco_archive_folder: '/alfresco-community-distribution-201707'
	alfresco_user: 'alfresco'
	alfresco_group: 'alfresco'	
	alfresco_user_home: '/opt/alfresco'
	alfresco_data_home: '/opt/alfresco'
    alfresco_uid: '501'
	alfresco_log_home: '/var/log/alfresco'

### solr alfresco
	
	setup_solr: true
	ip_solr: 'localhost'
	solr_port: '8080'
	solr_version_url: alfresco-solr4-5.2.g
	solr_version: solr4
	solr_war: solr4.war

### Share Alfresco Service

	setup_shared_alfresco: true

## Role Variables for Plugin Blob Storage Azure 
See https://github.com/EisenVault/ev-alfresco-azure-adapter for more informations.

	setup_azure_blob_storage: true
	azure_ssh_key: #yourkey
	azure_container_name: #yourcontainername
	azure_storage_account: #yourstorageaccount
	
## Dependencies

  - geerlingguy.java
  - cetic.tomcat

## Example Playbook

```yaml
- hosts: alfresco
  become: true
  vars:
    tomcat_group: 'alfresco'
    tomcat_user: 'alfresco'
    tomcat_user_home: '/opt/alfresco/tomcat' 
    mysql_databases:
      - name: alfresco
    mysql_users:
      - name: alfresco
        password: alfresco
        priv: "alfresco.*:ALL" 
  roles:
    - role: geerlingguy.java
    - role: geerlingguy.mysql
    - role: cetic.tomcat
    - role: cetic.alfresco
```

## Tests

### testing locally with [Vagrant](https://www.vagrantup.com/)

You can test this ansible role by using `vagrant`. See the Vagrantfile.

### testing with Travis

See the playbook used for Travis CI tests (tests/test.yml).

## Future improvements

*  Provide more recent/different versions of Alfresco & Solr 
*  More OS plateforms support 

Feel free to contribute.

## License

[Gnu General Public License 3.0](https://www.gnu.org/licenses/gpl.html)

## Credits
This repository was initially a fork from https://github.com/libersoft/ansible-alfresco
