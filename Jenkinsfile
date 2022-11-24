pipeline{
    agent any
    
    tools {
        terraform 'terraform-1008'
    }
    
    stages{
        stage('Git Checkout'){
            steps {
                git branch: 'main', credentialsId: '', url: 'https://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@github.com/nigel-sys/Bug_Tracker.git'
            }
        }
        
        stage('Terraform Init'){
            steps{
                sh label: '',script: 'terraform init'
            }
        }
        
        stage('Terraform apply'){
            steps{
                echo "Terraform action from the parameter is --->${action}"
                sh label: '',script: 'terraform ${action} --auto-approve'
            }
        }
    }
}