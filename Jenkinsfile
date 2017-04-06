pipeline {
    agent {
        dockerfile {
            additionalBuildArgs "--build-arg JENKINS_UID=111 --build-arg JENKINS_GID=118"
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
