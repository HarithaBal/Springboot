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
               withSonarQubeEnv(installationName: 'Jenkins-Sonar-Integration', credentialsId: 'Jenkins-Sonar-Integration') {
                sh 'mvn clean package sonar:sonar'
                }
            }
        }
    }
}
