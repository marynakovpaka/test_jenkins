pipeline {
    agent {
        docker {
            image 'python:3.11-slim'
        }
    }

    stages {
        stage('Install') {
            steps {
                sh 'apt-get update && apt-get install -y python3-pip'
                sh 'pip3 install pytest pytest-junitxml'
            }
        }
        stage('Testing') {
            steps {
                sh 'pytest --junitxml=report.xml -v'
            }
        }
    }

    post {
        success {
            echo '✅ Тести пройшли успішно!'
        }
        failure {
            echo '❌ Тести не пройшли!'
        }
        always {
            junit 'report.xml'
        }
    }
}
