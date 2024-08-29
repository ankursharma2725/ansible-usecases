# echo '' | ./bin/elasticsearch-keystore add -x -f xpack.security.authc.realms.ldap.ldap1.secure_bind_password
echo '' | ./bin/elasticsearch-keystore add -x -f xpack.security.transport.ssl.keystore.secure_password
echo '' | ./bin/elasticsearch-keystore add -x -f xpack.security.transport.ssl.truststore.secure_password
echo '' | ./bin/elasticsearch-keystore add -x -f xpack.security.http.ssl.keystore.secure_password

\cp -rf /usr/share/elasticsearch/config/elasticsearch.keystore /tmp/keystore/elasticsearch.keystore
# \cp -rf /tmp/config/elasticsearch.keystore /tmp/keystore/elasticsearch.keystore


# echo "Set xpack.security.authc.realms.ldap.ldap1.secure_bind_password" 
# ./bin/elasticsearch-keystore show xpack.security.authc.realms.ldap.ldap1.secure_bind_password

# echo "Set xpack.security.transport.ssl.keystore.secure_password"
# ./bin/elasticsearch-keystore show xpack.security.transport.ssl.keystore.secure_password


# echo "Set xpack.security.transport.ssl.truststore.secure_password"
# ./bin/elasticsearch-keystore show xpack.security.transport.ssl.truststore.secure_password

# echo "Set xpack.security.http.ssl.keystore.secure_password"
# ./bin/elasticsearch-keystore show xpack.security.http.ssl.keystore.secure_password