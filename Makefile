IMAGE_NAME=bioasp/merrin
IMAGE_TAG=v0
IMAGE=$(IMAGE_NAME):$(IMAGE_TAG)

build:
	docker build -t $(IMAGE) \
		--build-arg IMAGE_NAME=$(IMAGE) \
		.

push:
	docker push $(IMAGE)

pull:
	docker pull $(IMAGE)

run:
	colomoto-docker --image $(IMAGE_NAME) -V $(IMAGE_TAG) --no-update --bind .
