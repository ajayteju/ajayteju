pipeline {
  environment {
    imagename = "ajaychaudhari/ajayteju"
    registryCredential = 'git'
    dockerImage = 'tomcat01'
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git([url: 'https://github.com/ajaychaudhari/ajayteju.git', branch: 'master', credentialsId: 'f9153e19-b4f6-48b9-a773-e55a74cd294f'])

      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build imagename
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker tag $imagename:latest $imagename:01"  
//	sh "docker rmi $imagename:latest"

      }
    }
  }
}
