#!/usr/bin/env groovy

pipeline {
    agent any

    environment {
        ZONE = 'fss'
        APPLICATION_NAME = 'syfopdfgen'
        DOCKER_SLUG = 'syfo'
        KUBECONFIG="kubeconfig"

        FASIT_ENVIRONMENT = 'q1'
    }

    stages {
        stage('initialize') {
            environment {
                APPLICATION_NAME = "${env.GITHUB_NAME}"
                DEPLOY_TO="production"
            }
            steps {
                init action: 'default'
                script {
                    env.APPLICATION_VERSION=env.COMMIT_HASH_SHORT
                }
            }
        }
        stage('push docker image') {
            steps {
                dockerUtils action: 'createPushImage'
            }
        }
        stage('deploy to preprod') {
            stage("deploy to preprod FSS") {
                steps {
                    deployApp action: 'kubectlDeploy', cluster: 'preprod-fss'
                }
            }
        }
        stage('deploy to production') {
            when { environment name: 'DEPLOY_TO', value: 'production' }
            stage("deploy to prod FSS") {
                steps {
                    deployApp action: 'kubectlDeploy', cluster: 'prod-fss'
                }
            }
        }
        stage('tag git release') {
            when { environment name: "DEPLOY_TO", value: 'production' }
            steps {
                githubStatus action: 'tagRelease', applicationName: "${env.GITHUB_NAME}"
            }
        }
    }
    post {
        always {
            postProcess action: 'always', applicationName: "${env.GITHUB_NAME}"
        }
        success {
            postProcess action: 'success', applicationName: "${env.GITHUB_NAME}"
        }
        failure {
            postProcess action: 'failure', applicationName: "${env.GITHUB_NAME}"
        }
    }
}
