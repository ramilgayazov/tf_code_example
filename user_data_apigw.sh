#!/bin/bash
sudo systemctl start api-gateway.service
sudo systemctl status api-gateway.service
filebeat setup --index-management -E output.logstash.enabled=false -E 'output.elasticsearch.hosts=["elk.vox.com:9200"]'
