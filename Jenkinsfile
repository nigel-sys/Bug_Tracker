pipeline{
    agent any
    
    tools {
        terraform 'Devops_terraform'
    }
    
    stages{
         stage('Git Checkout'){
            steps {
                git branch: 'main', credentialsId: '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', url: 'https://github.com/nishantpani55/Bug_Tracker.git'
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