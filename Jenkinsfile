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
            sh "/kaniko/executor --dockerfile ${env.WORKSPACE}/Dockerfile  --context ${env.WORKSPACE} --cache --destination registry.cn-shanghai.aliyuncs.com/weiguda/${JOB_NAME}:${GIT_COMMIT} --destination registry.cn-shanghai.aliyuncs.com/weiguda/${JOB_NAME}:latest"
        }
      }
    }
  }
}