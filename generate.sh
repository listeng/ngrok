export NG_DOMAIN=*.ngrok.com
export SERVER_PATH=./assets/server/tls
export CLIENT_PATH=./assets/client/tls
openssl genrsa -out $CLIENT_PATH/ngrokroot.key 2048
openssl req -x509 -new -nodes -key $CLIENT_PATH/ngrokroot.key -subj "/CN=$NG_DOMAIN" -days 5000 -out $CLIENT_PATH/ngrokroot.crt
openssl genrsa -out $SERVER_PATH/snakeoil.key 2048
openssl req -new -key $SERVER_PATH/snakeoil.key -subj "/CN=$NG_DOMAIN" -out $SERVER_PATH/snakeoil.csr
openssl x509 -req -in $SERVER_PATH/snakeoil.csr -CA $CLIENT_PATH/ngrokroot.crt -CAkey $CLIENT_PATH/ngrokroot.key -CAcreateserial -out $SERVER_PATH/snakeoil.crt -days 5000