FROM tutum/curl:trusty

MAINTAINER "Martin Westergaard Lassen <martin@mwl.dk>"

ENV ELASTIC_SEARCH="elasticsearch"

RUN curl -s http://www.elastic.co/guide/en/kibana/3.0/snippets/shakespeare.json > shakespeare.json
RUN echo '{ \
 "mappings" : { \
  "_default_" : { \
   "properties" : { \
    "speaker" : {"type": "string", "index" : "not_analyzed" }, \
    "play_name" : {"type": "string", "index" : "not_analyzed" }, \
    "line_id" : { "type" : "integer" }, \
    "speech_number" : { "type" : "integer" } \
   } \
  } \
 } \
}' > setup.json

CMD sh -c "curl -XPUT -s -H'Content-Type: application/json' --data-binary @setup.json http://${ELASTIC_SEARCH}:9200/shakespeare && sleep 3 && \
           curl -XPUT -s -H'Content-Type: application/json' --data-binary @shakespeare.json http://${ELASTIC_SEARCH}:9200/_bulk > /dev/null"
