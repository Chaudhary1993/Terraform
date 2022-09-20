pipeline {
  agent any
  options {
    skipDefaultCheckout(true)
  }
  stages{
    stage('clean workspace') {
      steps {
        cleanWs()
      }
    }
    stage('checkout') {
      steps {
        checkout scm
      }
    }
    stage('terraform init') {
      steps {
        sh 'terraform init'
      }
    }
    stage('terraform apply') {
      steps {
       withCredentials([string(credentialsId: 'aws-key', variable: 'key'), string(credentialsId: 'aws-sec', variable: 'sec')]) {
          sh 'terraform apply -var AWS_REGION="${aws_region}" -var AMI_ID="${ami_id}" -var AWS_ACCESS_KEY="$key" -var AWS_SECRET_KEY="$sec" -auto-approve -no-color'
        }
      }
    }
    stage('terraform destroy') {
      steps {
       withCredentials([string(credentialsId: 'aws-key', variable: 'key'), string(credentialsId: 'aws-sec', variable: 'sec')]) {
          sh 'terraform destroy -var AWS_ACCESS_KEY="$key" -var AWS_SECRET_KEY="$sec"'
        }
      }
    }
  }
  post {
    always {
      cleanWs()
    }
  }
}
