pipeline {
    agent any

    parameters {
        choice(
            name: 'LANGUAGE',
            choices: ['JAVA', 'PYTHON', 'C', 'ALL'],
            description: 'Choose language to run'
        )
    }

    stages {
        stage('Checkout code') {
            steps {
      
                checkout([$class: 'GitSCM', 
                          branches: [[name: '*/main']], 
                          userRemoteConfigs: [[url: 'git@github.com:beetime/School-Project.git',
                                               credentialsId: 'github-ssh']]])
            }
        }

        stage('Run selected file') {
            steps {
                script {
                    echo "User selected: ${params.LANGUAGE}"

                    if (params.LANGUAGE == 'ALL') {
                        sh 'cat JAVA PYTHON C'
                    } else {
                        sh "cat ${params.LANGUAGE}"
                    }
                }
            }
        }
    }

    post {
        always {
            emailext(
                subject: "Jenkins Build Result: ${env.JOB_NAME} #${env.BUILD_NUMBER}",
                body: "Pipeline finished!\nUser selected language: ${params.LANGUAGE}\nCheck console output: ${env.BUILD_URL}",
                to: "maya@example.com"
            )
        }
    }
}
