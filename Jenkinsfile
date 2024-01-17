pipeline {
    agent any

    tools {
        maven 'local_maven'
    }

stages{
        stage('Build'){
            steps {
                sh 'mvn clean package'
            }
            post {
                success {
                    echo 'Archiving the artifacts'
                    archiveArtifacts artifacts: '*/target/.war'
                }
            }
        }

        stage ('Deployments'){
            parallel{
                stage ("Deploy to Staging"){
                    steps {
                        deploy adapters: [tomcat8(credentialsId: 'h', path: '', url: 'http://localhost:9090/')], contextPath: null, war: '**/*.war'

                    }
                }
            }
        }
    }
}