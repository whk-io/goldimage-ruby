build:
	docker build -t goldimage/ruby:latest .
	docker tag goldimage/ruby:latest goldimage/ruby:v2.7.1
	docker login
	docker push goldimage/ruby:latest
	docker push goldimage/ruby:v2.7.1