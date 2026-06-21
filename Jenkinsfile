pipeline {
    agent any

    environment {
        IMAGE_NAME = "sergeygav/hello-world"
    }

    stages {

        

        stage('Build Application') {
            steps {
                sh 'python3 --version'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${IMAGE_NAME}:latest ."
            }
        }

        stage('Tag Image') {
            steps {
                sh "docker tag ${IMAGE_NAME}:latest ${IMAGE_NAME}:${BUILD_NUMBER}"
            }
        }

        stage('Push Image') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'docker_credentials',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {

                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'

                    sh "docker push ${IMAGE_NAME}:latest"
                    sh "docker push ${IMAGE_NAME}:${BUILD_NUMBER}"
                }
            }
        }
    }
}