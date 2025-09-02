pipeline {
    agent any

    tools {
        maven 'maven'
    }

    stages {
        stage('Compile and Clean') { 
            steps {
                bat 'mvn compile'
            }
        }
       
        stage('JUnit5 Test') { 
            steps {
                bat 'mvn test'
            }
        }

        stage('Jacoco Coverage Report') {
            steps {
                echo 'Test Coverage'
            }
        }

        stage('SonarQube') {
            steps {
                echo 'Sonar Code Scanning'
            }   
        }

        stage('Maven Build') { 
            steps {
                bat 'mvn clean install -DskipTests'
            }
        }

        stage('Docker Test') { 
            steps {
                bat 'docker ps'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t vn-sim-backend .'
            }
        }

        stage('Docker Deploy') {
            steps {
                // Stop old container if exists
                bat 'docker rm -f vn-sim || exit 0'
                // Run new container
                bat 'docker run -d --name vn-sim -p 8086:8086 vn-sim-backend'
            }
        }
    }
}
