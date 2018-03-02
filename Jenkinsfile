#!groovy

def kubectlTest() {
    // Test that kubectl can correctly communication with the Kubernetes API
    echo "running kubectl test"
    sh "kubectl get nodes"
}

def helmInstall() {
    // Test that helm can correctly communication with the Kubernetes API
    echo "running helm test"
  	sh 'helm init'
  	sh 'helm install --name myemp myemp/'
}

def helmUpgrade() {
    // Test that helm can correctly communication with the Kubernetes API
  	sh 'helm upgrade myemp myemp/'
    sh 'helm history myemp'
}

node {
    def app

    stage('Clone repository') {
        // Let's make sure we have the repository cloned to our workspace

        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        /*app = docker.build("ernesen/mea-icp-demo")*/
	       app = docker.build("${env.IMAGE_BUILD}")
    }

    stage('Test image') {
        // Ideally, we would run a test framework against our image.

        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }

    stage('Deploy Helm') {
      sh '''
        #!/bin/sh

        checkhelm=`helm ls --all myemp | wc -l`

        if [ $checkhelm -eq 0 ]; then
          #sh 'helm init'
          sh 'helm install --name myemp ./myemp'
        else
          sh 'helm upgrade myemp ./myemp'
          sh 'helm history myemp'
        fi
      '''
    }

}
