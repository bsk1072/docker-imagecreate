pipeline {
   agent {
       label 'master' 
   }
  environment {
    registry = "docker_hub_account/bsk1072"
    registryCredential = 'bsk1072'
    customImage = ''
  }
   stages {
      stage('checkout stage') {
         steps {
            // Get some code from a GitHub repository
            git 'https://github.com/bsk1072/docker-imagecreate.git'
         }
      }
         stage ('build stage') {
             steps {
            // Run Maven on a Unix agent.
            sh "mvn install"                 
             }
         }
         
        stage('Build image') {
            steps {
                echo 'Starting to build docker image'

                script {
                    customImage = docker.build("bsk1072/demoimage:${env.BUILD_ID}")
                    //customImage.push()
                }
            }
        }
        stage('Deploy Image') {
          steps{
            script {
              docker.withRegistry( '', registryCredential ) {
                customImage.push()
              }
            }
          }
        }
   }
}
