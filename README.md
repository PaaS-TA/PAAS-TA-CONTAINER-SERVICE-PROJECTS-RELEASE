## PAAS-TA-CONTAINER-SERVICE-PROJECTS-RELEASE   

### Notices   
- Use PAAS-TA-CONTAINER-SERVICE-PROJECTS-RELEASE >= v.2.0.1    
  - PaaS-TA >= v.5.0.2    
  - service-deployment >= v5.0.2    
- Use PAAS-TA-CONTAINER-SERVICE-PROJECTS-RELEASE =< v.2.0.0     
  - PaaS-TA =< v.5.0.1    
  - service-deployment =< v5.0.1    

### PaaS-TA Container Service Projects Configuration   
- container-service-api :: N machine(s)   
- container-service-broker :: N machine(s)   
- container-service-common-api :: N machine(s)   
- container-service-dashboard :: 1 machine   
- haproxy :: 1 machine   
- mariadb :: 1 machine   
- private-image-repository :: 1 machine   
- container-jenkins-broker :: 1 manchne   

### Create PaaS-TA Container Service Projects   
- Download the latest PaaS-TA Container Service Projects Release   
  ```   
  $ git clone https://github.com/PaaS-TA/PAAS-TA-CONTAINER-SERVICE-PROJECTS-RELEASE.git   
  $ cd PAAS-TA-CONTAINER-SERVICE-PROJECTS-RELEASE   
  ```   
- Download & Copy "source files" into the src directory      
  ```   
  ## download source files   
  $ wget -O src.zip http://45.248.73.44/index.php/s/GjwtbxDdcMkEGq8/download   

  ## unzip download source files   
  $ unzip src.zip   
  $ mv paas-ta-container-service-release-src src   

  ## final src directory     
  src   
    ├── container-jenkins-broker   
    │   └── paas-ta-caas-jenkins-broker.jar   
    ├── container-service-api   
    │   └── paas-ta-caas-api.jar   
    ├── container-service-broker   
    │   ├── bosh    
    │   ├── credhub   
    │   ├── kubectl   
    │   └── paas-ta-caas-broker.jar   
    ├── container-service-common-api   
    │   └── paas-ta-caas-common-api.jar   
    ├── container-service-dashboard   
    │   └── paas-ta-caas-dashboard.war   
    ├── docker-images   
    │   ├── paasta-jenkins.tar.gz   
    │   └── paasta-registry.tar.gz   
    ├── haproxy   
    │   └── haproxy-1.6.5.tar.gz   
    ├── java   
    │   └── server-jre-8u121-linux-x64.tar.gz   
    ├── mariadb    
    │   └── mariadb-10.1.22-linux-x86_64.tar.gz   
    └── private-image-repository   
        ├── dbus_1.10.6-1ubuntu3_amd64.deb   
        ├── docker-registry_2.3.0_ds1-1_amd64.deb   
        ├── libcgmanager0_0.39-2ubuntu5_amd64.deb    
        ├── libdbus-1-3_1.10.6-1ubuntu3_amd64.deb   
        ├── libdrm2_2.4.67-1_amd64.deb   
        ├── libnih-dbus1_1.0.3-4.3ubuntu1_amd64.deb   
        ├── libplymouth4_0.9.2-3ubuntu13_amd64.deb    
        ├── libsystemd-login0_204-5ubuntu20.28_amd64.deb   
        ├── lsb-base_4.1+Debian11ubuntu7_all.deb   
        ├── mountall_2.54ubuntu1_amd64.deb    
        ├── plymouth_0.9.2-3ubuntu13_amd64.deb    
        └── upstart_1.13.2-0ubuntu21_amd64.deb    
  ```   
- Create PaaS-TA Container Service Projects   
  ```   
  ## <VERSION> :: release version (e.g. 2.0.1)      
  ## <RELEASE_TARBALL_PATH> :: release file path (e.g. /home/ubuntu/workspace/paasta-container-service-projects-release-<VERSION>.tgz)      
  $ bosh -e <bosh_name> create-release --name=paasta-container-service-projects-release --version=<VERSION> --tarball=<RELEASE_TARBALL_PATH> --force    
  ```   
### Deployment   
- https://github.com/PaaS-TA/service-deployment   
