#!/bin/bash

kubectl rollout restart deployment demo-spring-boot-kafka -n demo

kubectl rollout status deployment demo-spring-boot-kafka -n demo