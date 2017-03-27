node {
    stage("Main build") {

        checkout scm

        docker.build('jenkins/16.04')

        docker.image('jenkins/16.04').inside {

            stage("Easy") {
                sh "echo Testing"
            }

            stage("Hard") {
                sh "sudo test"
            }

            stage("After") {
                echo "Made it!"
            }
        }
    }
}
