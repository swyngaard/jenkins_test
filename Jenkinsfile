pipeline {
    agent {
        dockerfile true
    }
    stages {
        stage('build') {
            steps {
                echo 'Testing'
                sh 'virtualenv -p /usr/bin/python3 jenkins_test'
                sh '. jenkins_test/bin/activate'
                sh 'pip3 install requests'
            }
        }
        stage('test') {
            steps {
                sh 'python3 hello.py'
            }
        }
    }
}
