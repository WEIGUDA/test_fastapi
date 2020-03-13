pipeline {
  environment {
        REPOSITORY_NAME = 'test_fastapi'
  }
  agent {
    kubernetes {
      yaml: """
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
        - name: kaniko-cache
          mountPath: /cache
  volumes:
    - name: aliyun-registry
      projected:
        sources:
          - secret:
              name: aliyun-registry-secret
              items:
                - key: .dockerconfigjson
                  path: config.json
    - name: kaniko-cache
      persistentVolumeClaim:
        claimName: kaniko-cache
"""
    }
  }
  stages {
    stage('Build with Kaniko') {
      steps {
        container(name: 'kaniko') {
            sh '''
                /kaniko/executor --dockerfile ${env.WORKSPACE}/Dockerfile \
                --context ${env.WORKSPACE} \
                --cache --cache-dir \
                --destination registry.cn-shanghai.aliyuncs.com/weiguda/${REPOSITORY_NAME}:${GIT_COMMIT} \
                --destination registry.cn-shanghai.aliyuncs.com/weiguda/${REPOSITORY_NAME}:latest
            '''
        }
      }
    }
  }
}