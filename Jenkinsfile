pipeline {
    agent { label 'linux'}
    options {
        skipDefaultCheckout(true)
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
                ARM_ACCESS_KEY = credentials('azurestoragekey') 
            }

            steps {
                withCredentials([azureServicePrincipal(credentialsId: 'testAzure',
                                    subscriptionIdVariable: 'ARM_SUBSCRIPTION_ID',
                                    clientIdVariable: 'ARM_CLIENT_ID',
                                    clientSecretVariable: 'ARM_CLIENT_SECRET',
                                    tenantIdVariable: 'ARM_TENANT_ID')]) {
                    sh 'chmod +x terraformmw'
                    sh './terraformmw apply -auto-approve -no-color'
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