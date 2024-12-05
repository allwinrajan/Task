pipeline {
    agent any

    stages {
        stage('Push Source Code') {
            steps {
                script {
                    def containerName = 'webapp'
                    def targetDir = '/usr/local/apache2/htdocs'
                    
                    sh """
                        docker cp ./index.html ${containerName}:${targetDir}/index.html
                    """
                }
            }
        }
    }
}
