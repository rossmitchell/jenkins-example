pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'env'
                echo "$JENKINS_URL"
                sh 'stop-here'
                sh 'nodeBuilder/provisionTestServer.sh 2'
                echo 'Building..'
            }
        }
        stage('Test') {
            parallel {
                stage('Run First Test') {
                    steps {
                        sh 'touch testFile'
                        sh 'sleep 2'
                        echo "Running the first Test Suite"
                        sh 'date'
                    }
                }
                stage('Run Second Test') {
                    steps {
                        sh 'date'
                        echo "Running the second test suite"
                        sh 'pwd'
                        sh 'ls -lah'
                    }
                }
                stage('Run Test on different Machine?') {
                    steps {
                        echo 'Should be somewhere else'
                        sh 'sleep 5'
                        echo 'done'
                    }
                }
                stage('Really should be some where else') {
                    steps {
                        echo 'Please let this work'
                        sh 'sleep 60'
                        sh 'hostname'
                        echo 'Done'
                    }
                }
                stage('Really should be some where else 2') {
                    steps {
                        echo 'Please let this work'
                        sh 'sleep 60'
                        sh 'hostname'
                        echo 'Done'
                    }
                }
                stage('Really should be some where else 3') {
                    steps {
                        echo 'Please let this work'
                        sh 'sleep 60'
                        sh 'hostname'
                        echo 'Done'
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
    post {
        always {
            echo "Remove the servers that have been created"
            sh 'nodeBuilder/destroyTestServers.sh'
        }
    }
}
