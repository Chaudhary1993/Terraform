node{
  stage ('cloning git repo'){
    checkout scm
  }
  stage ('terraform init'){
    sh 'terraform init'
  }
  stage ('terraform plan'){
    if ("${step}"=="plan"){
    withCredentials([string(credentialsId: 'aws-key', variable: 'key'), string(credentialsId: 'aws-sec', variable: 'sec')]) {
       sh 'terraform plan -var AWS_REGION="${aws_region}" -var AMI_ID="${ami_id}" -var AWS_ACCESS_KEY="${key}" -var AWS_SECRET_KEY="${sec}"'
        }
    }
  }

  stage ('terraform apply'){
    if ("${step}"=="apply"){
     withCredentials([string(credentialsId: 'aws-key', variable: 'key'), string(credentialsId: 'aws-sec', variable: 'sec')]) {
       sh 'terraform apply -var AWS_REGION="${aws_region}" -var AMI_ID="${ami_id}" -var AWS_ACCESS_KEY="${key}" -var AWS_SECRET_KEY="${sec}" -auto-approve'
        }
    }
  }

  stage ('terraform destroy'){
    if ("${step}"=="destroy"){
     withCredentials([string(credentialsId: 'aws-key', variable: 'key'), string(credentialsId: 'aws-sec', variable: 'sec')]) {
       sh 'ls -lrt -a'
       sh 'terraform destroy -var AWS_ACCESS_KEY="${key}" -var AWS_SECRET_KEY="${sec}" -auto-approve'
        }
      }
  }
}