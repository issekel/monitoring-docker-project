#!/bin/bash

curl -X POST http://{{ inventory_prometheus_host }}:{{ inventory_prometheus_port }}/-/reload
