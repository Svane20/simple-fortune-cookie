#!/bin/bash
node_ip = NODE_EXTERNAL_IP=$(kubectl --kubeconfig kubeconfig get nodes -o jsonpath='{.items[0].status.addresses[?(@.type=="ExternalIP")].address}')
frontend_port = $(kubectl --kubeconfig kubeconfig get service frontend -o jsonpath='{.spec.ports[0].nodePort}')

frontend_url = "http://$NODE_EXTERNAL_IP:$FRONTEND_NODE_PORT"

echo "$frontend_url"

echo "Testing frontend availability..."
if curl -s --head --request GET $frontend_url | grep "200 OK" > /dev/null; then 
    echo "Frontend is reachable."
else 
    echo "Error: Frontend is not reachable!"
    exit 1
fi

