#!/bin/bash

#run trivy scanner
docker run aquasec/trivy image ghcr.io/opentestingapi/opentesting:1.38
