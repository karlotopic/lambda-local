@echo off

aws --endpoint-url=http://localhost:4566 lambda get-function --function-name lambda-test >nul 2>&1

:: https://docs.localstack.cloud/user-guide/lambda-tools/hot-reloading/
if NOT %errorlevel%==0 (
    aws --endpoint-url=http://localhost:4566 lambda create-function ^
    --function-name lambda-test ^
    --runtime nodejs20.x ^
    --role arn:aws:iam::000000000000:role/lambda-role ^
    --code S3Bucket="hot-reload",S3Key=%~pd0% ^
    --timeout 3000 ^
    --handler index.handler >nul
) else (
    aws --endpoint-url=http://localhost:4566 lambda update-function-code ^
    --function-name lambda-test ^
    --s3-bucket "hot-reload" ^
    --s3-key %~pd0% >nul
)

:: invoke a lambda function
aws --endpoint-url=http://localhost:4566 lambda invoke ^
--function-name lambda-test ^
--cli-binary-format raw-in-base64-out ^
--payload file://payload.json %~pd0%/output.txt