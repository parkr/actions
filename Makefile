build-test-image:
	docker build -t test-image:latest ./test/test-image

sign-test-image: build-test-image
	cosign version
	echo foobar | cosign generate-key-pair
	cosign sign --key cosign.key test-image
	cosign verify --key cosign.pub test-image

test-test-image: build-test-image sign-test-image
	docker run --rm test-image
