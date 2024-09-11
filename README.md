### Instructions

- Run the container
```
docker build -t multi .
docker run -d --name multi1 -p 8001:8001 -p 8000:8000 multi
```

- Now kill the container
```
docker stop --time=30 multi1
```
