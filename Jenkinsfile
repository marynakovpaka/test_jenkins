pipeline {
    agent {
        docker {
            image 'python:3.11-slim'
        }
    }

    stages {
        stage('Install') {
            steps {
                echo 'Встановлення залежностей'
                sh 'apt-get update && apt-get install -y python3-pip'
                sh 'pip3 install pytest pytest-junitxml'
            }
        }
        stage('Testing') {
            steps {
                echo 'Запуск тестів'
                sh 'pytest --junitxml=report.xml -v'
            }
        }
    }

    post {
        always {
            echo 'Генерація та обробка звіту'
            junit 'report.xml'
        }
        failure {
            echo 'Тести не пройшли. Перевірте логи'
        }
    }
}
