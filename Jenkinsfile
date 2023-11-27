pipeline {
    agent any
    options {
  ansiColor('css')
}
    environment {
       // Define environment variables for Azure credentials
        ARM_SUBSCRIPTION_ID = credentials('SUBSCRIPTION_ID')
        ARM_TENANT_ID = credentials('TENANT_ID')
        ARM_CLIENT_ID = credentials('CLIENT_ID')
        ARM_CLIENT_SECRET = credentials('CLIENT_SECRET')
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
	when {
		
			expression{choice =='Plan'||'Apply'||'Destroy' && return currentBuild.resultIsBetterOrEqualTo('SUCCESS')}
	}
            steps {
                script {
                    sh 'terraform plan -out=plan.out'
                }
			}
        }
	
      stage(' Terraform Apply') {
	when{
		
			expression{choice == 'Apply' && return currentBuild.resultIsBetterOrEqualTo('SUCCESS')}
		}
    steps{
        script {
		input "Please approve to proceed with Apply"
            // Run Terraform apply using the saved plan file
            sh 'terraform apply "plan.out"'
        }
    }
}
        stage('terraform destroy') {
		when{
		
			expression{choice =='Destroy' && return currentBuild.resultIsBetterOrEqualTo('SUCCESS')}
		} 
            steps {
                script {
			input "Please approve to proceed with Destroy"
                    sh 'terraform destroy --auto-approve'
                }
		    stage('Terraform Import') {
		    when{
			expression{choice =='Import' && return currentBuild.resultIsBetterOrEqualTo('SUCCESS')}
		}
            steps {
                script {
                    sh "terraform import ${params.Arguments}"
                }
            }
        }
            }
        }
    }
}
    






