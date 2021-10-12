build-test-image:
	docker build -t test-image:latest ./test/test-image

sign-test-image: build-test-image
	cosign version
	cosign sign

test-test-image: build-test-image sign-test-image
	docker run --rm test-image
