pipeline {
    agent any

    stages {
        stage('Test') {
            agent {
                docker {
                    image 'python:3.11-slim'
                    reuseNode true
                }
            }
            steps {
                sh 'pip install --no-cache-dir -r requirements.txt'
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
            junit allowEmptyResults: true, testResults: 'report.xml'
        }
    }
}
