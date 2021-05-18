AWS_REGION=us-east-1

S3_BUCKET=vvml-resources #bucket to store SAM template [Make sure you have created this S3 bucket manually.]
S3_BUCKET_MODEL=vvml-models   #bucket to store ML models [Make sure you have created this S3 bucket manually.]
STACK_NAME=viavarejo-mlops-test   #Name of the SAM stack

deploy-stack:
	@sam build

	@sam package \
		--output-template-file packaged.yaml \
		--s3-bucket ${S3_BUCKET} \
		--s3-prefix data-artifacts

	@sam deploy --template-file packaged.yaml  \
		--stack-name ${STACK_NAME} \
		--force-upload \
		--s3-bucket ${S3_BUCKET} \
		--s3-prefix sam \
		--parameter-overrides S3ModelBucket=${S3_BUCKET_MODEL} \
		--capabilities CAPABILITY_IAM \
		--region=$(AWS_REGION) \
		--no-fail-on-empty-changeset

deploy-pipeline:

	@echo "--- Deploying ViaVarejo MLOps CD/CI Pipeline Stack"

	@aws cloudformation create-stack --stack-name viavarejo-mlops-cdci-pipeline --template-body file://pipeline.yaml  --capabilities CAPABILITY_NAMED_IAM 