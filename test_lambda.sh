#!/bin/bash

# Test script for dockerized AWS Lambda function

# Test the Lambda function
echo "Testing Lambda function..."
curl -XPOST "http://localhost:9002/2015-03-31/functions/function/invocations" \
  -H "Content-Type: application/json" \
  -d '{"test": "data"}'

echo -e "\n"


echo "Test completed!"