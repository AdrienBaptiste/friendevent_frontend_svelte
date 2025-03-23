pipeline {
    agent any  // Utilise n'importe quel agent disponible

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/AdrienBaptiste/friendevent_frontend_svelte.git'
            }
        }

        stage('Install dependencies') {
            steps {
                sh 'npm install' // Installe les dépendances
            }
        }

        stage('Build') {
            steps {
                sh 'npm run build' // Construit le projet
            }
        }

        stage('Test') {
            steps {
                sh 'npm test' // Exécute les tests
            }
        }
    }
}
