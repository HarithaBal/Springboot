pipeline {
    agent any 
    stages {
        stage('Build') { 
            steps {
                sh "mvn clean"
            }
        }
        stage('Test') { 
            steps {
               sh "mvn test"
            }
        }
        stage('Deploy') { 
            steps {
                sh "mvn package"
            }
        }
        stage ('Scan and Build Jar File') {
            steps {
               withSonarQubeEnv(installationName: 'Production SonarQubeScanner', credentialsId: 'Jenkins-sonarqube- integration') {
                sh 'mvn clean package sonar:sonar'
                }
            }
        }
    }
}
