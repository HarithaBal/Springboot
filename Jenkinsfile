pipeline {
    agent any 
    stages {
        stage('Build') { 
            steps {
                sh "mvn clean package" 
            }
        }
       stage('Building image') {
      steps{
        script {
            docker.withRegistry( 'https://registry.hub.docker.com/', 'Jenkins-Docker-Integration' ){
             myImage = docker.build ("springboot:latest")
            }
        }
      }
   }
    }
}
