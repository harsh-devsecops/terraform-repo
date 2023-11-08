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

        // stage('Azure Login') {
        //     steps {
        //         script {
        //             echo 'Logging in to Azure'
        //             // Login to Azure
        //             withCredentials([azureServicePrincipal(credentialsId: 'AppService_Principal', varAzureSubscriptionId:'3d193e7b-bd4f-4cb1-becb-e31d4d51e3aa' , varAzureTenantId:'87fa2b03-576c-440b-93a5-b22dbb2e0c6d', varAzureClientSecret:'BGo8Q~bbMICd6C2XGFIyRkgwVrQUsEfkC3Uswdnh', varAzureClientId:'24e73939-f71e-41ec-97d9-de9032b8df92' )]) {
                    
        //             }
        //         }
        //     }
        // }

        stage('Terraform init') {
            steps {
                script {
                    sh 'terraform init'
                }
            }
        }
        // stage('terraform validate') {
        //     steps {
        //         script {
        //             sh 'terraform validate'
        //         }
        //     }
        // }    
        // stage('Terraform Plan') {
        //     steps {
        //         script {
        //             sh 'terraform plan'
        //         }
        //     }
        // }
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



