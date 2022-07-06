pipeline { 
    environment { 
        registryCredential = 'dockerhub' 
	registry = 'https://hub.docker.com/repository/docker/9870050478/spring-petclinic'
    }
    agent any
    stages { 
        stage('Cloning our Git') { 
            steps { 
                git 'https://github.com/RahulKumar1119/springboot-petclinic-docker.git' 
            }
        } 
    
    	stage('Building our image') { 
            steps { 
                script { 
                    dockerImage = docker.build registry + ":$BUILD_NUMBER" 
                }

            } 

        }
	}
}
