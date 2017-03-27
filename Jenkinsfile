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
                sh """#!/bin/bash -ex
                echo steps_stage
                sudo test
                sh echo hello
                """
            }
        }
    }
}
