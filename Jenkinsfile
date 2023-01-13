pipeline {
    agent { label 'linux'}
    options {
        skipDefaultCheckout(true)
    }

    parameters {
        string(name:'TEST_TF_SPACE', defaultValue:'staging', description:'terraform workspace')
    }

    stages {
        stage('clean workspace') {
            steps {
                cleanWs()
            }
        }
        stage('checkout') {
            steps {
                checkout scm
            }
        }
        stage('terraform') {
            environment { //拉取微软的远端存储密钥
                ARM_ACCESS_CREDS = credentials('azurestoragekey') 
            }

            steps {
                withCredentials([azureServicePrincipal(credentialsId: 'testAzure',
                                    subscriptionIdVariable: 'ARM_SUBSCRIPTION_ID',
                                    clientIdVariable: 'ARM_CLIENT_ID',
                                    clientSecretVariable: 'ARM_CLIENT_SECRET',
                                    tenantIdVariable: 'ARM_TENANT_ID')]) {
                    sh 'export ARM_ACCESS_KEY=$ARM_ACCESS_CREDS_PSW'             
                    sh 'chmod +x terraformmw'
                    sh './terraformmw'
                    sh 'terraform init -backend-config="./var/${params.TEST_TF_SPACE}"'
                    sh 'terraform apply -auto-approve -no-color -var-file="./var/${params.TEST_TF_SPACE}"'
                }
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}