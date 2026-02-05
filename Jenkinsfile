pipeline {
    agent any

    parameters {
        choice(
            name: 'LANGUAGE',
            choices: ['JAVA', 'PYTHON', 'C', 'ALL'],
            description: 'Choose language'
        )
    }

    stages {
        stage('Print Selection') {
            steps {
                script {
                    if (params.LANGUAGE == 'ALL') {
                        sh 'cat JAVA'
                        sh 'cat PYTHON'
                        sh 'cat C'
                    } else {
                        sh "cat ${params.LANGUAGE}"
                    }
                }
            }
        }
    }
}
