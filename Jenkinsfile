pipeline {
  agent any
  stages {
      stage('git checkout'){
          steps{
              git branch: 'main', url: 'https://github.com/kushalsamota/bharat.git'
          }
      }
      stage('terraform init command is running'){
          steps{
              sh 'terraform init'
          }
      }
      stage('terraform plan command is running'){
          steps{
              sh 'terraform plan'
          }
      }
      stage('terraform apply command is running'){
          steps{
              sh 'terraform destroy --auto-approve'
          }
      }
  }
}
