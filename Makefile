 
TARGET = gomemleak
GOTARGET = github.com/gari/$(TARGET)
REGISTRY ?= gari123
VERSION ?= 0.0.1
IMAGE = $(REGISTRY)/$(BIN)
DOCKER ?= docker

all: container

build:
	go build .

container:
	$(DOCKER) build -t $(REGISTRY)/$(TARGET):latest -t $(REGISTRY)/$(TARGET):$(VERSION) .

push:
	$(DOCKER) push $(REGISTRY)/$(TARGET):latest
	$(DOCKER) push $(REGISTRY)/$(TARGET):$(VERSION)

.PHONY: all local container push

clean:
	rm -f $(TARGET)
	$(DOCKER) rmi $(REGISTRY)/$(TARGET):latest
	$(DOCKER) rmi $(REGISTRY)/$(TARGET):$(VERSION)