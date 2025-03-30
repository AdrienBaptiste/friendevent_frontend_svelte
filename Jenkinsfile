pipeline {
    agent { label 'node' }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/AdrienBaptiste/friendevent_frontend_svelte.git'
            }
        }
        stage('Install dependencies') {
            steps {
                sh 'npm install'
            }
        }
        stage('Run tests') {
            steps {
                sh 'npm test'
            }
        }
    }
}
