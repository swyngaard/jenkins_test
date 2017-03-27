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
                sh 'sudo su - postgres -c "psql -c \'CREATE USER test_user WITH PASSWORD \\\'ndsecure1842\\\';\'"'
                sh 'sudo su - postgres -c "psql -c \'SELECT * FROM pg_user;\'"'
                echo 'We did it!'
            }
        }
    }
}
