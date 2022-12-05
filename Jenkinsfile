pipeline{
    agent any
    
    stages{
         stage('Git Checkout'){
            steps {
                git branch: 'main', credentialsId: '60c696b5-f4bf-46d0-9c3d-c1d939676612', url: 'https://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@github.com/nigel-sys/Bug_Tracker.git'
            }
        }

        stage('Deploy App'){
            steps{
                sshagent(credentials:['20deaad4-5467-4c99-94ff-6af5713db7ba']){

                    sh'''

                    ssh -o StrictHostKeyChecking=no  ubuntu@63.35.234.55 "sudo rm -rf Bug_Tracker;git  clone https://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@github.com/nigel-sys/Bug_Tracker.git;"

                    '''
                }
            }
        }
        stage('Setup virtual environment'){
            steps{
                sshagent(credentials:['20deaad4-5467-4c99-94ff-6af5713db7ba']){

                    sh'''

                    ssh -o StrictHostKeyChecking=no  ubuntu@63.35.234.55 "cd Bug_Tracker; sh BugRnTenv.sh; source BugRnTenv/bin/activate; pip3 install -r /home/ubuntu/Bug_Tracker/requirements.txt;"

                    '''
                }
            }
        }
        stage('Build App'){
            steps{
                sshagent(credentials:['20deaad4-5467-4c99-94ff-6af5713db7ba']){

                    sh'''

                    ssh -o StrictHostKeyChecking=no  ubuntu@63.35.234.55 "cd Bug_Tracker/BugRnT; sh makemigrations.sh"

                    '''
                }
            }
        }
        stage('Restart Server'){
            steps{
                sshagent(credentials:['20deaad4-5467-4c99-94ff-6af5713db7ba']){

                    sh'''

                    ssh -o StrictHostKeyChecking=no  ubuntu@63.35.234.55 "sh restartServer.sh;"

                    '''
                }
            }
        }
    }
}