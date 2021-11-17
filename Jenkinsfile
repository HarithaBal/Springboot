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
               withSonarQubeEnv(installationName: 'Jenkins-sonarqube- integration', credentialsId: 'Sonar-jenkin-integration') {
                sh 'mvn clean package sonar:sonar'
                }
            }
        }
    }
}
