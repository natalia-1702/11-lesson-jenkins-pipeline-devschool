pipeline {
  agent {

    docker {
      image 'maven:3-jdk-11'
    }

  }

  stages {

    stage('Build war') {
      steps {
        git 'https://github.com/natalya-limareva/boxfuse-sample-java-war-hello.git'
        sh 'ls -la'        
        //sh 'cd boxfuse-sample-java-war-hello && mvn package'
        sh 'mvn package'
        sh 'sudo mkdir /opt/temp'
        sh 'ls ./target/*.war'
        sh 'cp ./target/*.war /opt/temp'
      }
    }

    stage('Make docker image') {
      steps {
        sh 'docker login -u 17021993 -p 17021993Nv'
        sh 'docker build --tag=17021993/mywebapp:1.0 .'
        sh 'docker push 17021993/mywebapp:1.0'

      }
    }

    stage('Run docker on prod-VM') {
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

