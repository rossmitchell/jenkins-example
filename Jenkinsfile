pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'whoami'
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
                    agent {
                         label: container
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
}
