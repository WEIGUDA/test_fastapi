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
"""
    }
  }
  stages {
    stage('Build with Kaniko') {
      steps {
        container(name: 'kaniko') {
            sh "ls -alh ${pwd}"
            sh "/kaniko/executor --dockerfile ${pwd}/Dockerfile --context ${pwd} --no-push"
        }
      }
    }
  }
}