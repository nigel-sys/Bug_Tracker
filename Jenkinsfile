pipeline{
    agent any
    
    tools {
        terraform 'Terraform'
    }
    
    stages{
         stage('Git Checkout'){
            steps {
                git branch: 'main', credentialsId: '60c696b5-f4bf-46d0-9c3d-c1d939676612', url: 'https://github.com/nigel-sys/Bug_Tracker.git'
            }
        }
        stage('Terraform Init'){
            steps{
                sh 'terraform init'
            }
        }
        
        stage('Terraform plan'){
            steps{
                sh 'terraform plan'
            }
        }
    }
}