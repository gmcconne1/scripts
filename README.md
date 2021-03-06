## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![TODO: Update the path with the name of your diagram](Diagrams/Elk_Stack.jpg)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the yaml file may be used to install only certain pieces of it, such as Filebeat.

[install-dvwa.yml](https://github.com/gmcconne1/scripts/blob/main/Ansible/DVWA/install-dvwa.yml)
[install-elk.yml](https://github.com/gmcconne1/scripts/blob/main/Ansible/ELK/install-elk.yml)
[filebeat-playbook.yml](https://github.com/gmcconne1/scripts/blob/main/Ansible/Filebeat/filebeat-playbook.yml)
[metricbeat-playbook.yml](https://github.com/gmcconne1/scripts/blob/main/Ansible/Metricbeat/metricbeat-playbook.yml)

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
- _TODO: What aspect of security do load balancers protect? What is the advantage of a jump box?_
Load balancers help protect against DDOS attacks by providing redundancy and fault tolerance. They also serve as a gateway address that outside sources have to access which
then forwards traffic to the machines behind it. This helps reduce the attack surface. 
The advantage of a jump box is that it provides a secure way to provide access in different security zones. It provides one means of access that can be
secured, monitored, and audited. 

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the data and system logs.
- Filebeat collects data about the file system.
- Metricbeat collects machine metrics, like uptime.

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name      | Function   | IP Address | Operating System |
|-----------|------------|------------|------------------|
| Jump Box  | Gateway    | 10.0.0.5   | Linux            |
| Web-1     | Web Server | 10.0.0.6   | Linux            |
| Web-2     | Web Server | 10.0.0.7   | Linux            |
| Web-3     | Web Server | 10.0.0.9   | Linux            |
| ElkServer | Elk Stack  | 10.1.0.4   | Linux            |
### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- User external IP address

Machines within the network can only be accessed by SSH.
- _TODO: Which machine did you allow to access your ELK VM? What was its IP address?_
JumpBox can access the ELK VM. Its IP address is 10.0.0.5.  

A summary of the access policies in place can be found in the table below.

| Name           | Publicly Accessible | Allowed IP Addresses                |
|----------------|---------------------|-------------------------------------|
| JumpBox-Access | No                  | 10.0.0.6 10.0.0.7 10.0.0.9 10.1.0.4 |
| Elk-Access     | Yes                 | User external IP address            |
| SSH            | Yes                 | User external IP address            |
| Port_80        | Yes                 | User external IP address            | 

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
there is a greatly reduced chance of human error and the ability to deploy many simultaneous machines at once if desired.

The playbook implements the following tasks:
- _TODO: In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc._
- install Docker
- install python3 
- install Docker module
- set to use more memory
- download and launch docker elk container including setting ports and enabling on boot

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![TODO: Update the path with the name of your screenshot of docker ps output](Images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
Web-1 10.0.0.6
Web-2 10.0.0.7
Web-3 10.0.0.9

We have installed the following Beats on these machines:
Filebeat
Metricbeat

These Beats allow us to collect the following information from each machine:
- _TODO: In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc._
Filebeat collects information about the file system and sends the log files to Logstash and Elasticsearch. In this case it will be used to collect Apache server
and MySQL database logs from the DVWA instances.

Metricbeat collects metrics from the OS and from services running on the DVWA instances and sends them to Elasticsearch or Logstash.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the install-elk.yml file to /etc/ansible/roles/install-elk.yml.
- Update the hosts file to include [elk] and 10.1.04 ansible_python_interpreter=/usr/bin/python3
- Run the playbook, and navigate to http://ElkStackExternalIP:5601/app/kibana to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- _Which file is the playbook? Where do you copy it?_
 Copy the install-elk.yml file to /etc/ansible/roles/install-elk.yml.
- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_
Update the hosts file. The option under [elk] will have the ELK server installed versus [web servers] which will have filebeat installed.
- _Which URL do you navigate to in order to check that the ELK server is running?

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
