if [ -f /home/.installFinish ]; then
  echo "Installation déjà finie"
else
  sed  -i 's#<property name="jdbcUrl" value="jdbc:mysql://localhost:3306/iotlab"/>#<property name="jdbcUrl" value="jdbc:mysql://iotlab-db:3306/iotlab"/>#g' /usr/local/glassfish4/bin/bonecp-datasource.xml
  /usr/local/glassfish4/bin/asadmin add-resources /usr/local/glassfish4/bin/bonecp-datasource.xml
  mysql -h iotlab-db -uadmin -padmin iotlab < /home/iotlab/server/sql/iotlab.sql
  cat /usr/local/glassfish4/bin/bonecp-datasource.xml
  /usr/local/glassfish4/bin/asadmin deploy /home/iotlab/server/bin/iotlab.war
  touch /home/.installFinish
fi