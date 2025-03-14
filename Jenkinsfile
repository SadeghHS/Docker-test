pipeline {
    agent any
    environment {
        IMAGE_NAME = "sadeghhs/my-docker-image"
        TAG = "v1"
    }
    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/SadeghHS/Docker-test.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh "docker build -t $IMAGE_NAME:$TAG ."
            }
        }
        stage('Push Docker Image') {
            steps {
                withDockerRegistry([ credentialsId: 'docker-hub-credentials', url: '' ]) {
                    sh "docker push $IMAGE_NAME:$TAG"
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                sh "kubectl apply -f k8s/deployment.yaml"
                sh "kubectl apply -f k8s/service.yaml"
            }
        }
    }
}
