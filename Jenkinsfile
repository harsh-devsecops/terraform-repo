pipeline {
    agent any

    environment {
        TERRAFORM_HOME = tool 'Terraform'
        AZURE_CREDENTIALS_ID = AppService_Principal
    }

    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], userRemoteConfigs: [[url: 'https://github.com/git01h/terraform-repo.git']]])
            }
        }

        stage('Azure Login') {
            steps {
                script {
                    withCredentials([azureServicePrincipal(credentialsId:AppService_Principal , usePassword: true)]) {
                        sh "az login --service-principal -u 24e73939-f71e-41ec-97d9-de9032b8df92 -p BGo8Q~bbMICd6C2XGFIyRkgwVrQUsEfkC3Uswdnh--tenant 87fa2b03-576c-440b-93a5-b22dbb2e0c6d"
                    }
                }
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    sh "${TERRAFORM_HOME}/terraform init"
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    sh "${TERRAFORM_HOME}/terraform plan"
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    sh "${TERRAFORM_HOME}/terraform apply -auto-approve"
                }
            }
        }

        stage('Terraform Destroy') {
            steps {
                script {
                    sh "${TERRAFORM_HOME}/terraform destroy -auto-approve"
                }
            }
        }
    }

    post {
        always {
            // Clean up or post-processing steps can be added here
            script {
                withCredentials([azureServicePrincipal(credentialsId: AppService_Principal, usePassword: true)]) {
                    sh "az logout"
                }
            }
        }
    }
}


