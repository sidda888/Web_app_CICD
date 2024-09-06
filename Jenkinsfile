pipeline{
    agent any

    


    stages {
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
                        awsCodeDeploy application: 'CodeDeployApp',
                                      deploymentGroup: 'CodeDeployGroup',
                                      revisionType: 'Github',
                                      gitHubLocation: [repository: 'sidda888/Web-app-CICD', commitId: 'master']
                                       
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