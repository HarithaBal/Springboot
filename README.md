# Integrate Jenkins with SonarQube 
1. Install SonarQube ,Maven and Jenkins in Same Server With Java Version 11

Install SonarQube :
     Refferals : https://www.youtube.com/watch?v=eKdHTADjQEY
 https://www.coachdevops.com/2021/01/install-sonarqube-8-on-ubuntu-how-to.html        
          
                     	  
    1 sudo apt-get update && sudo apt-get install default-jdk -y
    2  sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
    3  sudo wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | sudo apt-key add -
    4  sudo apt-get -y install postgresql postgresql-contrib
    5  sudo systemctl start postgresql
    6  sudo systemctl enable postgresql
    7  createuser sonar
    8  sudo unzip sonarqube*.zip -d /opt
    9  cd /opt
    10  ls
    11  cd
    12  sudo vi /etc/systemd/system/sonar.service
    13  sudo vi /etc/sysctl.conf
    14  sudo vi /etc/security/limits.conf
    15  sudo sysctl -p
    16  sudo apt update
    17  sudo systemctl start sonar
  
Install Jenkins :


        1 wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
        2 sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
        3 sudo apt-get update
        4 sudo apt-get install jenkins
        5 sudo systemctl status jenkins
        
Install Maven :


        1 cd /opt/
        2 sudo wget https://dlcdn.apache.org/maven/maven-3/3.8.3/binaries/apache-maven-3.8.3-bin.tar.gz
        3 sudo tar -xf apache-maven-3.8.3-bin.tar.gz
        4 sudo mv apache-maven-3.8.3/ apache-maven/
        5 sudo update-alternatives --install /usr/bin/mvn maven /opt/apache-maven/bin/mvn 1001

        Configuring Apache Maven Environment
               ------------------

        1 cd /etc/profile.d/
        2 sudo nano maven.sh
           # Apache Maven Environment Variables
           # MAVEN_HOME for Maven 1 - M2_HOME for Maven 2
           export JAVA_HOME=/usr/lib/jvm/openjdk-11   
           export M2_HOME=/opt/apache-maven
           export MAVEN_HOME=/opt/apache-maven
           export PATH=${M2_HOME}/bin:${PATH}
       3 sudo chmod +x maven.sh
       4 sudo source maven.sh
       
       
Inorder to test maven 
Go to maven official site => use=> 5min project 	
 5 mvn --version
 6 cd
 7 mkdir mvn
 8 cd mvn
 9 mvn archetype:generate -DgroupId=com.mycompany.app -DartifactId=my-app -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.4 -DinteractiveMode=false
 10 cd my-app
 11 ls 
 12 nano pom.xml 
 13 mvn package
     
After this login to jenkins => manage pluggin => sonar scanner
    Then go to Global Tool configuration => SonarQubeScanner =>Add SonarQubeScanner=> add sonarQubeScannerName => Add SONAR_RUNNER_HOME =>/opt/sonarqube/bin =>apply and save
    Then Configure System => SonarQubeServers => Give SonarQube name ,Server URL and Server authentication Token => Apply and Save
    Get Server Authentication Token from SonarQube MyAccount=> Security => Generate Token
    Then Add gitfile in pipeline and done :)
    
     
  
   
