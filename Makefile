build: Dockerfile
	docker build -t jgoldfar/pandoc-docker-bibtex .

push: build
	docker push jgoldfar/pandoc-docker-bibtex
