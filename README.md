# Via Varejo MLOps Test

## git clone https://github.com/raafaadg/vvml

## Deploy Pipeline Stack

## make deploy-pipeline

## Deploy Main Stack

## make deploy-stack

# INFERENCE_ENDPOINT=https://4h46jhjk2a.execute-api.us-east-1.amazonaws.com/v1/invokeSagemakerAPI

## curl --location --request POST ${INFERENCE_ENDPOINT}  --header 'Content-Type: application/json' --data-raw '{  "data": "4.5,1.3,0.3,0.3" }'

curl --location --request POST https://4h46jhjk2a.execute-api.us-east-1.amazonaws.com/v1/invokeSagemakerAPI --header 'Content-Type: application/json' --data-raw '{  "data": "4.5,1.3,0.3,0.3" }'
