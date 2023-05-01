pipeline {
    agent any
	
	  tools
    {
       maven "maven"
    }
	

	
	stages{
		stage('remove images')
		{
			steps{
				sh """
		  docker ps -a \
		    | awk '{ print \$1,\$2 }' \
		    | grep mohanaarush/samplewebapp* \
		    | awk '{print \$1 }' \
		    | xargs -I {} docker rm -f {}
			  """
			}
		}
		
 stage('checkout') {
	 
           steps {
             
                git branch: 'master', url: 'https://github.com/Aarushmohan/CI-CD-using-Docker.git'
             
          }
        }
		
 
	stage('Execute Maven') {
           steps {
             
                sh 'mvn package'             
          }
        }

	  
		
    

  stage('Docker Build and Tag') {
           steps {
		   
             sh 'docker build -t samplewebapp:latest .'
	     sh 'docker tag samplewebapp mohanaarush/samplewebapp:latest'
	   
          }
	   }
        
		
		
     
  stage('Publish image to Docker Hub') {
          
	  steps{
		  
        withDockerRegistry([ credentialsId: "dockerhub", url: "" ]) {
         sh 'docker push mohanaarush/samplewebapp:latest'
	}
	
        
		  }
          }
        
	
		
	stage('Push Docker Images to Nexus Registry'){
		steps{
			sh 'docker login -u admin -p admin123 10.12.124.82:9000'
			sh 'docker tag samplewebapp:latest 10.12.124.82:9000/db'
			sh 'docker push 10.12.124.82:9000/db'
		}
	}
	

      stage('Run Docker container on Jenkins Agent') {
             
            steps 
			{
                sh "docker run -d -p 8003:8080 mohanaarush/samplewebapp"
            }
        }
	 
	
	 
	
 }
}
