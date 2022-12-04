pipeline{
    agent any
    
    tools {
        terraform 'Terraform'
    }
    
    stages{
         stage('Git Checkout'){
            steps {
                git branch: 'main', credentialsId: '60c696b5-f4bf-46d0-9c3d-c1d939676612', url: 'https://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@github.com/nigel-sys/Bug_Tracker.git'
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
        stage('Deploy App init'){
            steps{
                sshagent(credentials:['20deaad4-5467-4c99-94ff-6af5713db7ba']){

                    sh'''

                    ssh -o StrictHostKeyChecking=no  ubuntu@3.250.106.119 "sudo rm -rf Bug_Tracker;git  clone https://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@github.com/nigel-sys/Bug_Tracker.git;ls"

                    '''
                }
            }
        }
        stage('virtual environment init'){
            steps{
                sshagent(credentials:['20deaad4-5467-4c99-94ff-6af5713db7ba']){

                    sh'''

                    ssh -o StrictHostKeyChecking=no  ubuntu@3.250.106.119 "cd Bug_Tracker; sh venvsetup.sh; cd ~; source BugRnTenv/bin/activate; pip3 install -r /home/ubuntu/Bug_Tracker/requirements.txt"

                    '''
                }
            }
        }
        stage('Build App'){
            steps{
                sshagent(credentials:['20deaad4-5467-4c99-94ff-6af5713db7ba']){

                    sh'''

                    ssh -o StrictHostKeyChecking=no  ubuntu@3.250.106.119 "source BugRnTenv/bin/activate; cd Bug_Tracker/BugRnT; sh build.sh"

                    '''
                }
            }
        }
    }
}