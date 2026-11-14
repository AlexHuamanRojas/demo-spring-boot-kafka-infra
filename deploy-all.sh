#!/bin/bash

set -e

echo "================================="
echo "Deploy infraestructura"
echo "================================="

kubectl apply -f namespaces/

kubectl apply -f kafka/

kubectl apply -f kafka-ui/

kubectl apply -f app/

kubectl apply -f app-knative/

echo ""
echo "Despliegue completado"