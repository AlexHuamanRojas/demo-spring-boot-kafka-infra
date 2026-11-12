#!/bin/bash

set -e

echo "================================="
echo "Compilando aplicación"
echo "================================="

mvn clean package

echo "================================="
echo "Construyendo imagen"
echo "================================="

docker build -t demo-spring-boot-kafka:1.0 .

echo "================================="
echo "Reiniciando deployment"
echo "================================="

kubectl rollout restart deployment demo-spring-boot-kafka -n demo

kubectl rollout status deployment demo-spring-boot-kafka -n demo

echo ""
echo "Aplicación desplegada"