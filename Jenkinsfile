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