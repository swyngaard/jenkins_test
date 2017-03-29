pipeline {
    agent {
        docker.build("jenkins:16.04", "-f Dockerfile --build-arg JENKINS_UID=111 --build-arg JENKINS_GID")
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
                sudo -u postgres psql -c "CREATE USER test_user WITH PASSWORD 'ndsecure1842';"
                sudo -u postgres psql -c "CREATE DATABASE test_db OWNER test_user;"
                sudo -u postgres psql -c "SELECT * FROM pg_database;"
                """

                echo 'We did it!'
            }
        }
    }
}
