#!/bin/bash
node_ip=$(kubectl --kubeconfig kubeconfig get nodes -o jsonpath='{.items[0].status.addresses[?(@.type=="ExternalIP")].address}')
frontend_port=$(kubectl --kubeconfig kubeconfig get service frontend-service -o jsonpath='{.spec.ports[0].nodePort}')

echo "nodeip: $node_ip"
echo "port: $frontend_port"

frontend_url="http://$node_ip:$frontend_port"

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

