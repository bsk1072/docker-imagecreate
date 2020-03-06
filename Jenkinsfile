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
            checkout scm
         }
      }
         stage ('build war') {
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
        stage('Publish Image') {
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
