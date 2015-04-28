
# How

All you need to do is specifying where this image can find the Elastic Search REST api by setting the `ELASTIC_SEARCH_URL`. Default is `http://elasticsearch:9200` so the easiest thing to do is linking it

```bash
$ docker run --rm --link elasticsearch:elasticsearch mwldk/shakespeare-import
```
