pipeline {

    agent any
    tools{
        maven 'maven3.8'
    }
    environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhubpwd')
	}
        stages{
            stage('Build Maven'){
                steps{
                    checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/olawalebako/devops-auto']]])
                    sh 'mvn clean install'
                }
            }
            stage('Build Docker Image'){
                steps{
                    script{
                        sh 'docker build -t afeeztyler98/devops-auto .'
                        }
                    }
                }
            stage('login to DockerHub'){
                steps {
				    sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			    }
            }
            stage('Push to Dockerhub'){
			    steps {
				sh 'docker push afeeztyler98/devops-auto'
			    }
		    }
        }
}