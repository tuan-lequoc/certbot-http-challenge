#!/bin/bash

# Set etcd endpoints and credentials if necessary
ETCD_ENDPOINTS="http://localhost:2379"  # Replace with your etcd endpoint

# Function to get value from etcd
get_etcd_value() {
  local key=$1
  etcdctl --endpoints=$ETCD_ENDPOINTS get "$key" --print-value-only
}

export $(grep -v '^#' .env | xargs)

# Fetch values from etcd and export them as environment variables
export DOMAIN=$(get_etcd_value "/config/certbot/DOMAIN")
export EMAIL=$(get_etcd_value "/config/certbot/EMAIL")