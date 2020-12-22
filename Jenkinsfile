pipeline { 
    environment { 
        registry = "sanskar1504/chatbot" 
        registryCredential = 'dockerhub_id' 
        dockerImage = '' 
    }
    agent any 
    stages { 
        stage('Cloning our Git') { 
            steps { 
                git 'https://github.com/sanskar1504/Chatbot.git' 
                echo "Cloned"

            }
        } 
		stage('Email Notification'){
            steps{
                mail bcc: '', body: 'Hey', cc: '', from: '', replyTo: '', subject: 'Jenkins Job', to: 'sanskar.agrawal@st.niituniversity.in'
            }
           
        }
        stage('Building our image') { 
            steps { 
                script { 
                    dockerImage = docker.build registry + ":$BUILD_NUMBER" 
                }
                echo "Image Build"
            } 
        }
        stage('Deploy our image') { 
            steps { 
                script { 
                    docker.withRegistry( 'http://registry.hub.docker.com/', registryCredential ) { 
                        dockerImage.push() 
                    }
                echo "Image Deployed"
                } 
            }
        } 
        
        stage('Cleaning up') { 
            steps { 
                sh "docker rmi $registry:$BUILD_NUMBER" 
                echo "Cleanup complete"
            }
        } 
        
    }
}
