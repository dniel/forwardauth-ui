#!/usr/bin/env groovy

// See https://github.com/capralifecycle/jenkins-pipeline-library
@Library('cals@sonarcloud') _ // TODO: Remove branch override

buildConfig {
  dockerNode {
    checkout scm

    insideToolImage('node:12-alpine') {
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
    }

    def img = docker.image('circleci/node:12-browsers')
    img.pull() // Ensure latest.
    img.inside {
      stage('Run e2e tests') {
        sh 'npm run test:e2e:jenkins'
      }
    }
  }
}
