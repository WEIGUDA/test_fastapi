pipeline {
  environment {
        REPOSITORY_NAME = 'test_fastapi'
  }
  agent {
    kubernetes {
      yamlFile 'JenkinsPod.yaml'
    }
  }
  stages {
    stage('Build with Kaniko') {
      steps {
        container(name: 'kaniko') {
            sh "/kaniko/executor \
            --dockerfile ${env.WORKSPACE}/Dockerfile \
            --context ${env.WORKSPACE} \
            --cache=true \
            --destination registry.cn-shanghai.aliyuncs.com/weiguda/${REPOSITORY_NAME}:latest \
            --destination registry.cn-shanghai.aliyuncs.com/weiguda/${REPOSITORY_NAME}:${GIT_COMMIT}"
        }
      }
    }
  }
}