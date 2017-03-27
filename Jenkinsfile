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
                sh 'su -c pwd'
                sh 'echo hello'
            }
        }
    }
}
