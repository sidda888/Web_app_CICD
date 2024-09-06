pipeline{
    agent any

    environment {
        PATH = "$HOME/bin:$PATH"
    }


    stages {
  
       stage('Install AWS CLI') {
        steps{
            script {
                sh '''
                if ! command -v aws &> /dev/null
                then

                    echo "AWS CLI not found, Installing..."
                    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
                    unzip awscliv2.zip
                    ./aws/install --bin-dir ~/bin --install-dir ~/aws-cli --update
                    export PATH=~/bin:$PATH
                
                else
                    echo "AWS CLI is already installed"
                    echo $PATH
                fi

                '''
            }
        }
       }


        stage('Clone Repository'){
            steps{
                git branch: 'main', url: 'https://github.com/sidda888/Web_app_CICD.git'
            }
        }

        stage('Build'){
            steps {
                echo 'Building the web applicatoin...'
            }
        }

        stage('Deploy to AWS CodeDeploy') {
            steps{
                script {
                    withAWS(region: 'us-east-1', credentials:'aws-credentials-id') {
                       sh '''
                       aws deploy create-deployment \
                       --application-name CodeDeployApp \
                       --deployment-group-name CodeDeployGroup \
                       --github-location repository=sidda888/Web-app-CICD,commitId=master \
                       --region us-east-1
                       '''

                    }
                }
            }
        }

    }

    post {
        always {
            echo 'Pipeline execution complete!'
        }
    }
}