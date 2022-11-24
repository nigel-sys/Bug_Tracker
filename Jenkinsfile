pipeline{
    agent any
    
    tools {
        terraform 'Devops_terraform'
    }
    
    stages{
         stage('Git Checkout'){
            steps {
                git branch: 'main', credentialsId: '822701be-50f9-486a-b0e1-e561793c4d03', url: 'https://github.com/nishantpani55/Bug_Tracker.git'
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