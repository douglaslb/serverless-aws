# 1º - Criar arquivo de políticas de segurança
# 2º - Criar role de seginraça na AWS

aws iam create-role \
  --role-name lambda-exemplo \
  --assume-role-policy-document file://politicas.json \
  | tee logs/roles.log

# 3º - Criar arquivo com conteúdo e zipá-lo
zip function.zip index.js

# 4º - Criar lambda function
aws lambda create-function \
  --function-name hello-cli \
  --zip-file fileb://function.zip \
  --handler index.handler \
  --runtime nodejs12.x \
  --role arn:aws:iam::412331479365:role/lambda-exemplo \
  | tee logs/lambda-create.log

# 5º - Invoke lambda
aws lambda invoke \
  --function-name hello-cli \
  --log-type Tail \
  logs/lambda-exec.log

  # -- Atualizar, zipar, realizar deploy novamente
  zip function.zip index.js

  # -- Atualizar lambda
  aws lambda update-function-code \
    --zip-file fileb://function.zip \
    --function-name hello-cli \
    --publish \
    | tee logs/lambda-update.log

# Remover lambda function e role
aws lambda delete-function \
  --function-name hello-cli \

aws iam delete-role \
  --role-name lambda-exemplo
