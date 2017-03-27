pipeline {
    agent {
        dockerfile true
    }
    stages {
        stage('build') {
            steps {
                echo 'Testing'
                sh 'sudo service ssh start'
                sh 'sudo service postgresql start'
            }
        }
        stage('test') {
            steps {
                sh """#!/bin/bash -ex
                echo steps_stage
                sh echo hello
                """
                sh 'sudo su - postgres -c "psql -c \"CREATE USER test_user;\""'
                sh 'sudo su - postgres -c "psql -c \"SELECT * FROM pg_user;\""'
                echo 'We did it!'
            }
        }
    }
}
