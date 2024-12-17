# amphi-etl
Amphi is a great python low code ETL tool!

I created a Docker image to use Amphi as a standalone container.
Everything that may be needed (at least what I found) is already integrated.

You can use the provided Dockerfile to compile it on your own.

Here how I do it:
```
docker build --compress -t xpertmind/amphi:0.8.22 .
```

Then I'm using a docker-compose.yaml to start it (in combination with some other applications):
```
services:
   amphi:
    image: ebcont/amphi:0.0.1
    container_name: amphi
    hostname: amphi
    volumes:
        - ./volume/amphi:/home/amphi
    ports:
        - 8888:8888
```



