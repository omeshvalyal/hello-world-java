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
                def repoPath = "${WORKSPACE}/${folderName}"
                
                // Check if the folder already exists
                if (fileExists(repoPath)) {
                    error "Folder '${folderName}' already exists."
                } else {
                    // Create the folder
                    sh "mkdir ${folderName}"
                    
                    // Commit and push the folder to the repository
                    sh """
                        cd ${WORKSPACE}
                        git add ${folderName}
                        git commit -m "Add ${folderName}"
                        git push origin ${branchName}
                    """
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
