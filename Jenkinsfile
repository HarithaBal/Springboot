pipeline {
    agent any 
    stages {
        stage('Build') { 
            steps {
                sh "mvn clean package" 
            }
        }
        stage("build & SonarQube analysis") {
            agent any
            steps {
              withSonarQubeEnv('Jenkins-Sonar-Integration') {
                sh 'mvn clean package sonar:sonar'
              }
            }
          }
          stage("Quality Gate") {
            steps {
              timeout(time: 1, unit: 'HOURS') {
                waitForQualityGate abortPipeline: true
              }
            }
          }
        stage('Stage Artifacts'){
   steps {
     script {
	    /* Define the Artifactory Server details */
        def server = Artifactory.server 'Jenkins-Jfrog-Integration'
        def uploadSpec = """{
            "files": [{
            "pattern": "target/my-app-1.0-SNAPSHOT.jar",
            "target": "Demo"
            }]
        }"""
        /* Upload the war to  Artifactory repo */
        server.upload(uploadSpec)
          }
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
