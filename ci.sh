rm -rf out

npm run build
npm run build:jar

cd out
unzip maxstash-theme.jar
cd ..

docker buildx build --platform linux/arm64/v8 . \
	-t maxmorhardt/maxstash-keycloak-theme:1.0.0 \
	-t maxmorhardt/maxstash-keycloak-theme:latest

docker push maxmorhardt/maxstash-keycloak-theme -a
