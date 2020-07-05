pipeline {
  agent none

  stages {
//
  //  stage('Build war') { 
    //  agent {
      //  docker {
        //  image 'maven:3-jdk-11'
        //}
      //}
      //steps {
 //       git 'https://github.com/natalya-limareva/boxfuse-sample-java-war-hello.git'
   //     sh 'ls -la'        
     //   sh 'mvn package'
     //   sh 'ls ./target/*.war'
      //  sh 'cp ./target/*.war /tmp'
       // sh 'ls /tmp'
        
     // }
    //}

   // stage('Make docker image') {
    //  agent any
     // steps {
      //  sh 'docker login -u 17021993 -p 17021993Nv'
      //  sh 'docker build --tag=17021993/mywebapp:1.0 .'
       // sh 'docker push 17021993/mywebapp:1.0'

      //}
    //}

    stage('Run docker on prod-VM') {
      agent any
      steps {
        //заранее нужно ключ прокинуть!!!
        sh 'ssh-keyscan -H 10.128.0.17 >> ~/.ssh/known_hosts'
        sh 'ssh root@10.128.0.17'
        sh 'docker login -u 17021993 -p 17021993Nv'
        sh 'docker pull 17021993/mywebapp:1.0'
      }
    }
  }
}

