pipeline {
    agent {
        dockerfile true
    }
    stages {
        stage('build') {
            steps {
                echo "UID ${env.UID} GID ${env.GID}"
                echo 'Starting services'
            }
        }
        stage('test') {
            steps {
                echo 'Running tests'
                echo 'We did it!'
            }
        }
    }
}
