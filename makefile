include /home/jcardona1983/code/jcardona1983/data-engineering-challenges/make.inc

# YOUR CODE HERE
.PHONY: build_docker_image run_docker_image push_docker_image deploy_docker_image

build_docker_image:
	docker build -t ${DOCKER_IMAGE_NAME} .

run_docker_image:
	docker run --rm -p ${PORT}:8000 -e PORT=${PORT} ${DOCKER_IMAGE_NAME}

push_docker_image:
	docker push ${DOCKER_IMAGE_NAME}

deploy_docker_image:
	gcloud run deploy fast-app \
		--image ${DOCKER_IMAGE_NAME} \
		--region=${LOCATION} \
		--allow-unauthenticated
