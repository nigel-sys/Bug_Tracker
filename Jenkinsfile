pipeline{
    agent any
    
    tools {
        terraform 'terraform-1008'
    }
    
    stages{
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