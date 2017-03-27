pipeline {
    agent {
        dockerfile true
    }
    stages {
        stage('build') {
            steps {
                echo 'Starting services'
                sh 'sudo service ssh start'
                sh 'sudo service postgresql start'
            }
        }
        stage('test') {
            steps {
                echo 'Running tests'
                sh """#!/bin/bash -ex
                    sudo su - postgres -c "psql -c 'CREATE USER test_user;'"
                """
                sh 'sudo su - postgres -c "psql -c \'SELECT * FROM pg_user;\'"'
                echo 'We did it!'
            }
        }
    }
}
