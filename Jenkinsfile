pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                sh 'python hello.py'
                sh 'python3 --version'
            }
        }
    }
}
