build: Dockerfile
	docker build -t jgoldfar/pandoc-nbconvert-docker .

push: build
	docker push jgoldfar/pandoc-nbconvert-docker
