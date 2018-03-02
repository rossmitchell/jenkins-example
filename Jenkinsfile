pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'nodeBuilder/provisionTestServer.sh 2'
                echo 'Building..'
            }
        }
        stage('Test') {
            parallel {
                stage('Run First Test') {
                    agent {
                        label 'testMachine'
                    }
                    steps {
                        sh 'touch testFile'
                        sh 'sleep 2'
                        echo "Running the first Test Suite"
                        sh 'date'
                    }
                }
                stage('Run Second Test') {
                    agent {
                        label 'testMachine'
                    }
                    steps {
                        sh 'date'
                        sh 'whoami'
                        echo "Running the second test suite"
                        sh 'pwd'
                        sh 'ls -lah'
                    }
                }
                stage('Can move the content into the webroot') {
                    agent {
                        label 'testMachine'
                    }
                    steps {
                        sh "$WORKSPACE/runTest.sh"
                        sh 'wget -O $WORKSPACE/output www.magento2.dev'
                        sh 'cat $WORKSPACE/output'
                    }
                }
                stage('Really should be some where else') {
                    agent {
                        label 'testMachine'
                    }
                    steps {
                        echo 'Please let this work'
                        sh 'sleep 60'
                        sh 'hostname'
                        echo 'Done'
                    }
                }
                stage('Really should be some where else 3') {
                    agent {
                        label 'testMachine'
                    }
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
