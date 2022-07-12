#!/bin/bash

# Para las versiones de was:
# IBM WebSphere Application Server Trial 8.5.5.14
# ======================================================================================
# Create profile default

DEFAULT_PROFILE_NAME=AppSrv01
DEFAULT_CELL_NAME=DefaultCell01
DEFAULT_NODE_NAME=DefaultNode01
DEFAULT_HOST_NAME=localhost
DEFAULT_SERVER_NAME=server1
DEFAULT_ADMIN_USER=wsadmin
DEFAULT_ADMIN_PASS=wsadmin

if [ -d "opt/IBM/WebSphere/AppServer/profiles/$DEFAULT_PROFILE_NAME/logs/server1" ]; then # si exite directorio
     echo '====> Profile already exists'
else
     echo '====> Profile does not exist - '$DEFAULT_PROFILE_NAME
     echo '====> Creating profile - ' $DEFAULT_PROFILE_NAME
     /opt/IBM/WebSphere/AppServer/bin/manageprofiles.sh -create \
          -templatePath /opt/IBM/WebSphere/AppServer/profileTemplates/default \
          -hostName $DEFAULT_HOST_NAME \
          -nodeName $DEFAULT_NODE_NAME \
          -cellName $DEFAULT_CELL_NAME \
          -profileName $DEFAULT_PROFILE_NAME \
          -profilePath /opt/IBM/WebSphere/AppServer/profiles/AppSrv01 \
          -isDefault \
          -adminUserName $DEFAULT_ADMIN_USER -adminPassword $DEFAULT_ADMIN_PASS \
          -isDeveloperServer \
          -enableAdminSecurity true \
          -debug
fi




echo '====> Starting server -' $DEFAULT_PROFILE_NAME
/opt/IBM/WebSphere/AppServer/profiles/$DEFAULT_PROFILE_NAME/bin/startServer.sh server1


echo '====> Accessing the log SystemOut.log -' $DEFAULT_PROFILE_NAME
tail -f opt/IBM/WebSphere/AppServer/profiles/$DEFAULT_PROFILE_NAME/logs/server1/SystemOut.log
