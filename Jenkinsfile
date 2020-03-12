pipeline {
  agent {
    kubernetes {
      yaml """
kind: Pod
metadata:
  name: kaniko
spec:
  imagePullSecrets:
  - name: aliyun-registry-secret
  containers:
  - name: kaniko
    image: gcr.azk8s.cn/kaniko-project/executor:debug
    imagePullPolicy: Always
    command:
    - cat
    tty: true
  - name: ubuntu
    image: ubuntu:18.04
    imagePullPolicy: Always
    command:
    - cat
    tty: true
"""
    }
  }
  stages {
    // stage('Build with Kaniko') {
    //   steps {
    //     git 'https://github.com/prabhatsharma/sample-microservice'
    //     container(name: 'kaniko') {
    //         sh '''
    //         /kaniko/executor --dockerfile `pwd`/Dockerfile --context `pwd`
    //         '''
    //     }
    //   }
    // }
     stage('Test') {
      steps {
        container(name: 'ubuntu') {
            sh '''
            echo "hello from step test"
            '''
        }
      }
    }
  }
}