pipeline{
    agent any
    
    tools {
        terraform 'DevOpsSec_Terraform'
    }
    
    stages{
         stage('Git Checkout'){
            steps {
                git branch: 'main', credentialsId: 'github', url: 'https://github.com/nigel-sys/Bug_Tracker.git'
            }
        }
        stage('Terraform Init'){
            steps{
                sh 'terraform init'
            }
        }
        
        stage('Terraform apply'){
            steps{
                sh 'terraform apply --auto-approve'
            }
        }
    }
}