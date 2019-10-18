build-test-image:
	docker build -t test-image:latest ./test/test-image

test-test-image: build-test-image
	docker run --rm test-image
