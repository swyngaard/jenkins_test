pipeline {
    agent {
        dockerfile {
            additionalBuildArgs " --build-arg JENKINS_UID=${env.TEST_UID} --build-arg JENKINS_GID=${env.TEST_GID} "
        }
    }
    stages {
        stage('build') {
            steps {
                echo "UID ${env.TEST_UID} GID ${env.TEST_GID}"
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
