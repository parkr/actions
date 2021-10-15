IMAGE_TAG=ghcr.io/parkr/actions/test-image:latest

build-test-image:
	docker build -t $(IMAGE_TAG) ./test/test-image

sign-test-image: build-test-image
	cosign version

test-test-image: build-test-image sign-test-image
	docker run --rm $(IMAGE_TAG)
