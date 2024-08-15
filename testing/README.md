# Testing

## Test the deployment of the frontend application in Prod

1. Get the frontend pod:

````bash
kubectl get pod -l app=frontend
````

2. Port forward the frontend pod:

````bash
kubectl port-forward frontend-<ID> --address=0.0.0.0 8080:8080
````

3. Visit the frontend application in your browser [http://workstation-78.sdu.eficode.academy:8080/](http://workstation-78.sdu.eficode.academy:8080/)

## Test the deployment of the frontend application in Dev

1. Get the frontend pod:

````bash
kubectl get pod -l app=frontend
````

2. Port forward the frontend pod:

````bash
kubectl port-forward frontend-<ID> --address=0.0.0.0 8080:8080
````

3. Visit the frontend application in your browser [http://workstation-76.sdu.eficode.academy:8080/](http://workstation-76.sdu.eficode.academy:8080/)