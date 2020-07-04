pipeline {
  agent {

    docker {
      image 'maven:3-jdk-11'
    }

  }

  stages {

    stage('Git') {
      steps {
        git 'https://github.com/natalya-limareva/boxfuse-sample-java-war-hello.git'
      }
    }

    stage('Build war') {
      steps {
        sh 'mvn package'
        sh 'mkdir /opt/temp'
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
        sh 'docker login -u 17021993 -p 17021993Nv'
        sh 'docker pull 17021993/mywebapp:1.0'
      }
    }
  }
}

