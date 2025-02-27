# Copyright 2019 Istio Authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# this repo is on the container plan by default
BUILD_WITH_CONTAINER ?= 1

VERSION ?= dev
ARCH ?= amd64
OS ?= linux

tarball:
	@GOARCH=$(ARCH) GOOS=$(OS) CGO_ENABLED=0 go build -ldflags="-s -w -X 'main.version=$(VERSION)'" .
	@tar -czf release-builder-$(VERSION)-$(ARCH).tar.gz release-builder
