pipeline {
    agent any

    environment {
        TERRAFORM_HOME = tool 'Terraform'
    }

    stages {
        stage('Checkout') {
            steps {
                
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], userRemoteConfigs: [[url: 'https://github.com/git01h/terraform-repo.git']]])
            }
        }

        stage('Terraform Init') {
            steps {
                // Initialize Terraform
                script {
                    sh "${TERRAFORM_HOME}/terraform init"
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                // Run Terraform plan
                script {
                    sh "${TERRAFORM_HOME}/terraform plan"
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                // Apply Terraform changes
                script {
                    sh "${TERRAFORM_HOME}/terraform apply -auto-approve"
                }
            }
        }

        stage('Terraform Destroy') {
            steps {
                // Destroy Terraform resources (optional, use with caution)
                script {
                    sh "${TERRAFORM_HOME}/terraform destroy -auto-approve"
                }
            }
        }
    }

    post {
        always {
            // Clean up or post-processing steps can be added here
        }
    }
}
