node {
  #def mvnHome = tool 'Maven3' 
  
    stage ('checkout') {
       checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/RahulKumar1119/springboot-petclinic-docker/']]])  
    }
    
    #stage ('Build') {
    #        sh './mvnw package'           
    #    }
        
    stage ('Docker Build') {
         // Build and push image with Jenkins' docker-plugin
            withDockerRegistry([credentialsId: "dockerhub", url: "https://index.docker.io/v1/"]) {
            image = docker.build("9870050478/springboot-petclinic", ".")
            image.push()    
            }
        }
        
    stage ('Docker run') {

        image.run("-p 8086:8080 --rm --name springboot-petclinic ")

    }    
        
    stage ('K8S Deploy') {
       
                kubernetesDeploy(
                    configs: 'k8s/spring-lb.yaml',
                    kubeconfigId: 'K8S',
                    enableConfigSubstitution: true
                    )               
    }
} 
