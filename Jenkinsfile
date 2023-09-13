node {
    // Define parameters
    def repoURL = 'git@github.com:omeshvalyal/hello-world-java.git'
    def branchName = 'main'
    def folderName = 'new_folder'

    // Checkout the repository
    stage('Checkout') {
       git credentialsId: 'github', url: 'git@github.com:omeshvalyal/hello-world-java.git'
       // checkout([$class: 'GitSCM', branches: [[name: branchName]], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: repoURL]]])
    }

    // Create the folder
    stage('Create Folder') {
        steps {
            script {
                def targetPath = "/var/lib/jenkins"
                def fodlerName = "snypr-db-v2-cloned"
                if (!fileExists(targetPath + "/" + folderName)) {
                    echo "Fodler foes not exists. Creating..."
                    sh "mkdir -p $targetPath/$folderName"
                    echo "Folder created successfully."
                }
                else {
                    echo "Folder already exists"
                }
            }
        }
    }
    // Post-build actions
    post {
        success {
            echo "Folder creation and push to repository successful."
        }
        failure {
            error "Folder creation or push to repository failed. Check the logs for details."
        }
    }
}
