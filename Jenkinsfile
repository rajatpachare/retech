node {
    stage ('git') 
    {
    
    git 'https://github.com/rajatpachare/retech.git'
    
    }
    
    stage ('Build')
    {
    
    sh 'docker build -t kube .'
    sh 'docker tag kube:latest 255645000496.dkr.ecr.ap-south-1.amazonaws.com/kube:latest'
    sh 'aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 255645000496.dkr.ecr.ap-south-1.amazonaws.com'
    sh 'docker push 255645000496.dkr.ecr.ap-south-1.amazonaws.com/kube:latest'
        
    }
    stage ('depoly')
    {
        
    sh 'ssh -o StrictHostKeyChecking=no root@18.237.223.145 /root/kube-deploy/kubernetes/kube.sh'
    sh 'docker rmi 255645000496.dkr.ecr.ap-south-1.amazonaws.com/kube kube'    
    }
}
