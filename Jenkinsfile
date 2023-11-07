pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git(
                    branch: 'main',
                    url: 'https://github.com/git01h/terraform-repo.git',
                    credentialsId: 'git_credentials'
                )
            }
        }

        stage('Azure Login') {
           steps {
               script {
                   // Load Azure credentials from Jenkins credentials
                   withCredentials([azureServicePrincipal(credentialsId: 'AppService_Principal', varAzureSubscriptionId: '3d193e7b-bd4f-4cb1-becb-e31d4d51e3aa', varAzureTenantId: '87fa2b03-576c-440b-93a5-b22dbb2e0c6d', varAzureClientSecret: 'BGo8Q~bbMICd6C2XGFIyRkgwVrQUsEfkC3Uswdnh', varAzureClientId: '24e73939-f71e-41ec-97d9-de9032b8df92')]) {
                       // Login to Azure
                       sh "az login --service-principal -u '24e73939-f71e-41ec-97d9-de9032b8df92',-p 'BGo8Q~bbMICd6C2XGFIyRkgwVrQUsEfkC3Uswdnh',--tenant '87fa2b03-576c-440b-93a5-b22dbb2e0c6d' "
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


