pipeline {
  agent {
    kubernetes {
      yaml """
kind: Pod
metadata:
  name: kaniko
spec:
  containers:
  - name: kaniko
    image: gcr.azk8s.cn/kaniko-project/executor:debug
    imagePullPolicy: Always
    command:
    - cat
    tty: true
    volumeMounts:
      - name: aliyun-registry
        mountPath: /kaniko/.docker
  volumes:
  - name: aliyun-registry
    projected:
      sources:
      - secret:
          name: aliyun-registry-secret 
          items:
            - key: .dockerconfigjson
              path: config.json
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