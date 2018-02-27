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
            steps {
                parallel (
                a: {
                    echo 'Testing..'
                    sh 'date'
                },
                b: {
                    echo 'Parallel Jobs'
                    sh 'date'
                }

                )
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
