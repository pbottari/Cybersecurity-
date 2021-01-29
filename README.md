# Cybersecurity-
This repository show case the projects completed during the GWU Cybersecurity Bootcamp 

## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

https://drive.google.com/file/d/1kfgzOVGMEWRD0PP4yj7M36xL5awFmCn1/view?usp=sharing

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the playbook file may be used to install only certain pieces of it, such as Filebeat.
  - /etc/ansible/install_elk.yml 
  - /etc.ansible/files/filebeat-config.yml
  - /etc/ansible/files/metricbeat-config.yml
  - /etc/ansible/filebeat-playbook.yml
  - /etc/ansible/metricbeat-playbook.yml

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.

A loadbalancer ensures performance and balances traffic across multiple servers. It also add resiliency by rerouting live traffic from one server to another if a server falls prey to DDoS attacks or otherwise becomes unavailable 
A jumpbox or bastion serves as a specific point of access for the user to connect to other servers, it can secured, monitored and it also allows IT admins to access and manage devices in a separate security zoom. 

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the log and system traffic.

Filebeat monitors the log files or locations that you specify, collects log events, and forwards them either to Elasticsearch or Logstash for indexing.
Metricbeat collects metrics from the operating system and from services running on the server. It then takes the metrics and statistics that it collects and ships them to the output that you specify, such as Elasticsearch or Logstash.

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name                 | Function             | IP Address  | Operating System |
|----------------------|----------------------|-------------|------------------|
| Jump-Box-Provisioner | Gateway              | 10.1.0.5    | Linux            |
| Web-1                | Web Server           | 10.1.0.4    | Linux            |
| Web-2                | Web Server           | 10.1.0.6    | Linux            |
| Web-3                | Web Server           | 10.1.0.7    | Linux            |
| Elk-1                | ElasticSearch Stack  | 10.0.0.4    | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the load balance can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- whitelisted IP addresses: 40.88.37.106

Machines within the network can only be accessed by ssh connection from the jumpbox gateway.
- Jump-Box-Provisioner: Private IP 10.1.0.5
                        Public IP  52.149.214.56

A summary of the access policies in place can be found in the table below.

| Name                | Publicly Accessible | Allowed IP Addresses  
|---------------------|---------------------|------------------------|
| Jump-Box-Provisioner| yes, ssh-22         | 52.149.214.56          |
| Web-1               | no                  | 10.1.0.4               |
| Web-2               | no                  | 10.1.0.6               |
| Web-3               | no                  | 10.1.0.7               |
| Elk-1               | yes, Kibana, 5601   | 23.100.33.208          |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because system installation and update can be streamlined, and processes become more replicable. 

The playbook implements the following tasks:

- Configure Elk VM with Docker
- Install docker.io, python3-pip and docker python pp module
- Increase virtual memory
- Download and launch docker elk container
- Enable service docker on boot

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![TODO: Update the path with the name of your screenshot of docker ps output](Images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
Jump Box (10.0.0.5)
Web-1    (10.1.0.4)
Web-2    (10.1.0.6)
Web-3    (10.1.0.7)

We have installed the Filebeat and Metricbeat on the following machines: Web-1, Web-2, Web-3

These Beats allow us to collect the following information from each machine:

- Filebeat monitors the log files or locations that you specify, collects log events, and forwards them either to Elasticsearch or Logstash for indexing.
- Metricbeat periodically collects metrics from the operating system and from services running on the server. It takes the metrics and statistics that it collects and ships them to outputs such as Elasticsearch or Logstash.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the install_elk.yml file to /etc/ansible/ directory
- Update the hosts file to include your new elk VM bny adding the line 10.0.0.4 ansible_pythin_interpreter=/usr/bin/python3 under the [elk] section. 
- Run the playbook, and navigate to http://[your_elk_server_ip]:5601/app/kibana to check that the installation worked as expected.


- _Which file is the playbook? Where do you copy it? /etc/ansible/install_elk.yml
- _Which file do you update to make Ansible run the playbook on a specific machine? The hosts file on /etc/ansible 
-  How do I specify which machine to install the ELK server on versus which to install Filebeat on? modify the host file by adding the IP of the machine the elk server will be installed ude [elk]  and the same to the machines filebeat will be installed under [webservers]
- _Which URL do you navigate to in order to check that the ELK server is running? http://[your_elk_server_ip]:5601/app/kibana


Installing Filebeat:

Download the filebeat configuration template with the following command: curl https://gist.githubusercontent.com/slape/5cc350109583af6cbe577bbcc0710c93/raw/eca603b72586fbe148c11f9c87bf96a63cb25760/Filebeat > /etc/ansible/files/filebeat-config.yml
Edit lines #1106 and #1806 by replacing the IP address with the IP address of your ELK machine.
Save the file in  /etc/ansible/files/filebeat-config.yml.
Creat a filebeat playbook and save at /etc/ansible/filebeat-playbookl.yml
Run the playbook by running the command: ansible-playbook /etc/ansible/filebeat_playbook.yml
After the playbook completes, follow the steps below to confirm that the ELK stack is receiving logs from your DVWA machines
	Navigate back to the Filebeat installation page on the ELK server GUI.
	On the same page, scroll to Step 5: Module Status and click Check Data.
	Scroll to the bottom of the page and click Verify Incoming Data.
You should begin seeing information such as the following:


Installing Metricbeat:

Download the metribeat configuration template with the following command: curl -----
Edit lines #96 by replacing the IP address with the IP address of your ELK machine.
Save the file in  /etc/ansible/files/metricbeat-config.yml.
Creat a metric playbook and save at /etc/ansible/metricbeat-playbookl.yml
Run the playbook by running the command: ansible-playbook /etc/ansible/metricbeat_playbook.yml
After the playbook completes, follow the steps below to confirm that the ELK stack is receiving logs from your DVWA machines
	Navigate back to the metricbeat installation page on the ELK server GUI.
	On the same page, scroll to Step 5: Module Status and click Check Data.
	Scroll to the bottom of the page and click Verify Incoming Data.
You should begin seeing information such as the following:




