pipeline {
    agent any
    environment {
       // Define environment variables for Azure credentials
        ARM_SUBSCRIPTION_ID = "3d193e7b-bd4f-4cb1-becb-e31d4d51e3aa"
        ARM_TENANT_ID = "87fa2b03-576c-440b-93a5-b22dbb2e0c6d"
        ARM_CLIENT_ID = "7d605a47-2fd4-434b-9dbc-13b4b86dfca0"
        ARM_CLIENT_SECRET = "y5C8Q~CY4PP4m2LWo~-aY2wiegfSr0Gj_GDmdac5"
    }
    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out code from Git'
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/git01h/terraform-repo.git']])
               
            }
        }
        stage('Terraform init') {
            steps {
                script {
                    sh 'terraform init'
                }
            }
        }
        stage('terraform validate') {
            steps {
                script {
                    sh 'terraform validate'
                }
            }
        }    
        stage('Terraform Plan') {
            steps {
                script {
                    sh 'terraform plan'
                }
            }
        }
        // stage('Terraform Apply') {
        //     steps {
        //         script {
        //             sh 'terraform apply --auto-approve'
        //         }
        //     }
        // }
        // stage('terraform destroy') {
        //     steps {
        //         script {
        //             sh 'terraform destroy --auto-approve'
        //         }
        //     }
        // }
    }
}



