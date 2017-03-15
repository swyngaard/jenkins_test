pipeline {
    agent {
        dockerfile true
    }
    stages {
        stage('build') {
            steps {
                sh 'sudo apt-get -y update'
                sh 'sudo apt-get -y install python3 python3-pip virtualenv'
                sh '''
                    virtualenv -p /usr/bin/python3 jenkins_test
                    source jenkins_test/bin/activate
                    pip3 install requests
                   '''
            }
        }
        stage('test') {
            steps {
                sh 'python3 hello.py'
            }
        }
    }
}
