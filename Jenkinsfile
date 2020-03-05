pipeline {
   agent {
       label 'docker' 
       
   }
   stages {
      stage('checkout stage') {
         steps {
            // Get some code from a GitHub repository
            checkout scm
         }
      }
         stage ('build stage') {
             steps {
            // Run Maven on a Unix agent.
            sh "mvn -Dmaven.test.failure.ignore=true clean package"                 
             }
         }
   }
         post {
            // If Maven was able to run the tests, even if some of the test
            // failed, record the test results and archive the jar file.
            success {
               junit '**/target/surefire-reports/TEST-*.xml'
               archiveArtifacts 'target/*.jar'
            }
         }
}