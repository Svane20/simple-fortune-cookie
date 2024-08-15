#!/bin/bash

# Extract the host using awk
host=$(kubectl get ingress frontend-ingress -o jsonpath='{.spec.rules[0].host}')

echo "Extracted host: $host"