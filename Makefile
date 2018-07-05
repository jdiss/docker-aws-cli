AWS_CLI_VERSION = 1.15.51
IMAGE_NAME ?= contino/aws-cli:$(AWS_CLI_VERSION)
TAG = $(AWS_CLI_VERSION)

build:
	docker build -t $(IMAGE_NAME) .

shell:
	docker run --rm -it -v ~/.aws:/root/.aws -v $(PWD):/opt/app --entrypoint bash $(IMAGE_NAME)

gitTag:
	-git tag -d $(TAG)
	-git push origin :refs/tags/$(TAG)
	git tag $(TAG)
	git push origin $(TAG)