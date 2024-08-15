#!/bin/bash
frontend_url = "http://localhost:8080"
backend_url = "http://backend-service:9000/fortunes"

echo "Testing frontend availability..."
if curl -s --head --request GET $frontend_url | grep "200 OK" > /dev/null; then 
    echo "Frontend is reachable."
else 
    echo "Error: Frontend is not reachable!"
    exit 1
fi

# Test the backend
echo "Testing backend availability..."
if curl -s --head --request GET $backend_url | grep "200 OK" > /dev/null; then 
    echo "Backend is reachable."
else 
    echo "Error: Backend is not reachable!"
    exit 1
fi

echo "All tests passed!"

