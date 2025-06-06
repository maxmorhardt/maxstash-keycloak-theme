pipeline {
	agent {
		kubernetes {
			inheritFrom 'default'
			defaultContainer 'buildpack'
		}
	}

	parameters {
		string(name: 'DOCKER_VERSION', defaultValue: params.DOCKER_VERSION ?: '0.0.1', description: 'Keycloak image version', trim: true)
	}

	environment { 
        GITHUB_URL = 'https://github.com/maxmorhardt/maxstash-keycloak-theme'
        APP_NAME = "maxstash-keycloak-theme"
	}

	stages {
		stage('Setup') {
			steps {
				script {
					checkout scmGit(
						branches: [[
							name: "$BRANCH_NAME"
						]],
						userRemoteConfigs: [[
							credentialsId: 'github',
							url: "$GITHUB_URL"
						]]
					)

					sh 'ls -lah'
					sh 'node -v'
				}
			}
		}

		stage('Node Build') {
			steps {
				script {
					sh 'npm install'
					sh 'npm run build'
					sh 'npm run build:jar'

					sh 'cd out && unzip maxstash-theme.jar'

					sh 'ls -lah'
					sh 'ls ./out -lah'
				}
			}
		}

		stage('Docker CI') {
			steps {
				container('dind') {
					script {
						withCredentials([usernamePassword(credentialsId: 'docker', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
							sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin'

							sh 'docker buildx build --platform linux/arm64/v8 . --tag $DOCKER_USERNAME/$APP_NAME:$DOCKER_VERSION --tag $DOCKER_USERNAME/$APP_NAME:latest'
							sh 'docker push $DOCKER_USERNAME/$APP_NAME --all-tags'
						}
					}
				}
			}
		}
	}
}