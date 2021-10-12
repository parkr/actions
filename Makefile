IMAGE_TAG=ghcr.io/parkr/actions/test-image:latest

build-test-image:
	docker build -t $(IMAGE_TAG) ./test/test-image

sign-test-image: build-test-image
	cosign version
	echo foobar | cosign generate-key-pair
	cosign sign --key cosign.key $(IMAGE_TAG)
	cosign verify --key cosign.pub $(IMAGE_TAG)

test-test-image: build-test-image sign-test-image
	docker run --rm $(IMAGE_TAG)
