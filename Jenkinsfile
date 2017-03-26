pipeline {
    agent {
        dockerfile true
    }
    stages {
        stage('build') {
            steps {
                echo 'Testing'
            }
        }
        stage('test') {
            steps {
                sh 'echo steps_stage'
                sh 'sudo test'
                sh 'echo hello'
            }
        }
    }
}
