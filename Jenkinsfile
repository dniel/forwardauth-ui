#!/usr/bin/env groovy

// See https://github.com/capralifecycle/jenkins-pipeline-library
@Library('cals@sonarcloud') _ // TODO: Remove branch override

buildConfig {
  dockerNode {
    checkout scm

    def img = docker.build('builder')
    img.inside {
      stage('Install dependencies') {
        sh 'npm ci'
      }

      stage('Lint') {
        sh 'npm run lint'
      }

      stage('Run normal tests') {
        sh 'npm test'
      }

      analyzeSonarCloudForNodejs([
        'sonar.organization': 'capraconsulting',
        'sonar.projectKey': 'capraconsulting_webapp-baseline',
      ])

      stage('Generate build') {
        sh 'npm run build'
      }

      stage('Run e2e tests') {
        sh 'npm run test:e2e:jenkins'
      }
    }
  }
}
