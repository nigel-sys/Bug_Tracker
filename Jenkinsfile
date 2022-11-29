pipeline{
    agent any
    
    tools {
        terraform 'Terraform'
    }
    
    stages{
         stage('Git Checkout'){
            steps {
                git branch: 'main', credentialsId: 'cc5a7687-7a06-445d-b0f9-b919b08183b9', url: 'https://github.com/nigel-sys/Bug_Tracker.git'
            }
        }
        stage('Terraform Init'){
            steps{
                sh 'Terraform init'
            }
        }
        
        stage('Terraform apply'){
            steps{
                sh 'Terraform apply'
            }
        }
    }
}