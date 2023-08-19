pipeline {
    agent any

    parameters {
        string(name: 'action', defaultValue: 'apply', description: 'Terraform Action (apply, destroy, etc.)')
    }

    stages {
        stage('checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/arunlalp/jenkins-terraform']])
            }
        }
        stage('checkov') {
            steps {
                script {
                    def checkovResult = sh(script: 'checkov -d . --external-checks-dir custom_checks --check CUSTOM_AWS_*', returnStatus: true)
                    if (checkovResult != 0) {
                        error('Checkov analysis failed. Aborting pipeline.')
                    }
                }
            }
        }
        stage('init'){
            steps{
                sh 'terraform init -reconfigure'
            }
        }
        stage('plan'){
            steps{
                sh 'terraform plan'
            }
        }
        stage('action') {
            steps {
                echo "Terraform action is --> ${params.action}"
                sh "terraform ${params.action} --auto-approve"
            }
        }
    }
}
