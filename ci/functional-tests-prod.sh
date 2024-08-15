#!/bin/bash

# Extract the host using awk
host=$(kubectl --kubeconfig kubeconfig get ingress frontend-ingress -o jsonpath='{.spec.rules[0].host}')
frontend_url="https://$host"

echo "url: $frontend_url"

echo "Testing frontend availability..."
curl_output=$(curl -s -o /dev/null -w "%{http_code}" $frontend_url)
echo "HTTP status code for frontend URL: $curl_output"
if [ "$curl_output" -eq 200 ]; then
    echo "Frontend is reachable."
else
    echo "Error: Frontend is not reachable!"
    exit 1
fi

echo "Testing all endpoint..."
curl_output=$(curl -s -o /dev/null -w "%{http_code}" $frontend_url/api/all)
echo "HTTP status code for all endpoint: $curl_output"
if [ "$curl_output" -eq 200 ]; then
    echo "Can fetch all cookies"
else
    echo "Error: Can't fetch cookies!"
    exit 1
fi

echo "Testing random endpoint..."
curl_output=$(curl -s -o /dev/null -w "%{http_code}" $frontend_url/api/random)
echo "HTTP status code for random endpoint: $curl_output"
if [ "$curl_output" -eq 200 ]; then
    echo "Can fetch random cookies"
else
    echo "Error: Can't fetch random cookies"
    exit 1
fi