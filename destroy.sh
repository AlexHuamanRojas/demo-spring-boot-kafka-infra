#!/bin/bash

echo "Eliminando aplicación..."
kubectl delete -f app/ --ignore-not-found
kubectl delete -f app-knative/ --ignore-not-found

echo "Eliminando kafka-ui..."
kubectl delete -f kafka-ui/ --ignore-not-found

echo "Eliminando kafka..."
kubectl delete -f kafka/ --ignore-not-found

echo "Eliminando namespaces..."
kubectl delete -f namespaces/ --ignore-not-found