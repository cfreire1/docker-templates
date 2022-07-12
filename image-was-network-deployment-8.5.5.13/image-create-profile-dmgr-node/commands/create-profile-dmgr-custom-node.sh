#!/bin/bash

# Para las versiones de was:
# IBM WebSphere Application Server Network Deployment Trial 8.5.5.13
# ======================================================================================

DMGR_PROFILE_NAME=Dmgr01
DMGR_CELL_NAME=Dmgr01Cell01
DMGR_NODE_NAME=Dmgr01tNode01
DMGR_HOST_NAME=localhost
DMGR_PORT=8879
DMGR_ADMIN_USER=wsadmin
DMGR_ADMIN_PASS=wsadmin

echo '====> Create profile DMGR'
/opt/IBM/WebSphere/AppServer/bin/manageprofiles.sh -create \
          -templatePath /opt/IBM/WebSphere/AppServer/profileTemplates/management \
          -profileName $DMGR_PROFILE_NAME \
          -profilePath /opt/IBM/WebSphere/AppServer/profiles/$DMGR_PROFILE_NAME \
          -serverType DEPLOYMENT_MANAGER \
          -cellName $DMGR_CELL_NAME \
          -nodeName $DMGR_NODE_NAME \
          -disableWASDesktopIntegration \
          -hostName $DMGR_HOST_NAME \
          -enableAdminSecurity true \
          -adminUserName $DMGR_ADMIN_USER -adminPassword $DMGR_ADMIN_PASS


echo '====> AboutThisProfile'
cat /opt/IBM/WebSphere/AppServer/profiles/$DMGR_PROFILE_NAME/logs/AboutThisProfile.txt

echo '====> Manager Starting -' $DMGR_PROFILE_NAME
/opt/IBM/WebSphere/AppServer/profiles/$DMGR_PROFILE_NAME/bin/startManager.sh

# ======================================================================================

CUSTOM_PROFILE_NAME=AppSrv01
CUSTOM_CELL_NAME=DefaultCell01
CUSTOM_NODE_NAME=DefaultNode01
CUSTOM_HOST_NAME=localhost
CUSTOM_SERVER_NAME=server1
CUSTOM_ADMIN_USER=wsadmin
CUSTOM_ADMIN_PASS=wsadmin

echo '====> Create profile Custom - ND Managed Node'
/opt/IBM/WebSphere/AppServer/bin/manageprofiles.sh -create \
        -templatePath /opt/IBM/WebSphere/AppServer/profileTemplates/managed \
        -profileName $CUSTOM_PROFILE_NAME \
        -profilePath /opt/IBM/WebSphere/AppServer/profiles/$CUSTOM_PROFILE_NAME \
        -cellName $CUSTOM_CELL_NAME \
        -nodeName $CUSTOM_NODE_NAME \
        -disableWASDesktopIntegration \
        -FederateLater true \
        -hostName $CUSTOM_HOST_NAME \
        -adminUserName $CUSTOM_ADMIN_USER -adminPassword $CUSTOM_ADMIN_PASS


echo '====> AboutThisProfile'
cat /opt/IBM/WebSphere/AppServer/profiles/$CUSTOM_PROFILE_NAME/logs/AboutThisProfile.txt


echo '====> Manager Starting -' $CUSTOM_PROFILE_NAME
/opt/IBM/WebSphere/AppServer/profiles/$CUSTOM_PROFILE_NAME/bin/startServer.sh server1

# ======================================================================================

echo '====> Federated - add Node agent a DMGR'
/opt/IBM/WebSphere/AppServer/profiles/AppSrv01/bin/addNode.sh localhost 8879 -username $DMGR_ADMIN_USER -password $DMGR_ADMIN_PASS -includeapps -conntype soap -noagent
# ======================================================================================

echo '====> Start Node AppSrv01'
/opt/IBM/WebSphere/AppServer/profiles/AppSrv01/bin/startNode.sh

# ======================================================================================

echo '====> Accessing the DMGR log'
tail -f opt/IBM/WebSphere/AppServer/profiles/Dmgr01/logs/dmgr/SystemOut.log






