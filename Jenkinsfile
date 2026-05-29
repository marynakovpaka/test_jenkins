pipeline {
    agent any

    stages {
        stage('Install'){
            steps {
                echo 'Встановлення залежностей'
                sh 'pip install -r requirements.txt'
            }
        }
        stage('Testing') {
            steps {
                echo 'Run tests'
                sh 'pytest --junitxml=report.xml'

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