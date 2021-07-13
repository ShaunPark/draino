node {
     def app

     stage('Clone repository') {
         /* Let's make sure we have the repository cloned to our workspace */

         checkout scm
     }

     stage('Build image') {
         /* This builds the actual image; synonymous to
         * docker build on the command line */

         app = docker.build("coolage/draino", "--no-cache .")
     }

    //  stage('Test image') {
    //      app.inside {
    //          sh 'echo '
    //      }
    //  }

     stage('Push image') {
         /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
         docker.withRegistry('https://registry.hub.docker.com', 'docker hub') {
             app.push("${env.BUILD_NUMBER}")
             app.push("latest")
         }
     }

    // stage('Kubernetes deploy') {

    //         kubernetesDeploy configs: "deploy.yaml"
    //         sh "kubectl --kubeconfig=/home/ubuntu/.kube/config rollout restart coolage/node-mon"
    // }
 }