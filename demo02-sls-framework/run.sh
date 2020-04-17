# instalar
npm i -g serverless

#inicializar sls
sls

# sempre fazer deploy antes de tudo para verificar se o ambiente está ok
sls deploy 

# invocar na AWS
sls invoke -f hello

# invocar local
sls invoke local -f hello

# configurar dashboard do sls framework
sls 

# logs
sls logs -f hello --tail

