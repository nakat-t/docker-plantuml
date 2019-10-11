# docker-plantuml

Docker image for [PlantUML](http://plantuml.com/).

# Usage

Mount the directory on `/data` and run the container.

```
docker run --rm -v $PWD:/data nakatt/plantuml [options] file1/dir file2/dir file3/dir ...
```

To create a SVG graph from standard input:

```
echo file.puml | docker run --rm nakatt/plantuml -pipe -tsvg > file.svg
```
