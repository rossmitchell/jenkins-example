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
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
