#!/bin/bash

# Extract the host using awk
host=$(kubectl --kubeconfig kubeconfig get ingress frontend-ingress -o jsonpath='{.spec.rules[0].host}')
frontend_url="https://$host"

echo "url: $frontend_url"

echo "Testing frontend availability..."
if curl -s --head --request GET $frontend_url | grep "200 OK" > /dev/null; then
    echo "Frontend is reachable."
else
    echo "Error: Frontend is not reachable!"
    exit 1
fi

echo "Testing all endpoint..."
if curl -s --head --request GET $frontend_url/api/all | grep "200 OK" > /dev/null; then
    echo "Can fetch all cookies"
else
    echo "Error: Can't fetch cookies!"
    exit 1
fi

echo "Testing random endpoint..."
if curl -s --head --request GET $frontend_url/api/random | grep "200 OK" > /dev/null; then
    echo "Can fetch random cookies"
else
    echo "Error: Can't fetch random cookies"
    exit 1
fi