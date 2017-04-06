pipeline {
    agent {
        dockerfile {
            additionalBuildArgs '--build-arg JENKINS_UID=${env.UID} --build-arg JENKINS_GID=${env.GID}'
        }
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
                sh 'whoami'
                sh 'id'
                echo 'We did it!'
            }
        }
    }
}
