#!/bin/bash
# Copyright 2020 The Serverless Workflow Specification Authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


which ./bin/openapi-gen >/dev/null || go build -o ./bin/openapi-gen k8s.io/kube-openapi/cmd/openapi-gen

echo "Generating Open API files"
./bin/openapi-gen --logtostderr=true -o "" -i ./pkg/apis/serverlessworkflow/v1alpha2 -O zz_generated.openapi -p ./pkg/apis/serverlessworkflow/v1alpha2 -h ./hack/license.go.txt -r "-"