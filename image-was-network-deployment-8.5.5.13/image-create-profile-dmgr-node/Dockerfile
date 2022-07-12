# - COMANDOS DOCKER
# docker build -t was-server-nd .
# ===============================================================
FROM heremod/websphere-network-deployment:8.5.5.13
# ===============================================================
ADD commands /commands
RUN chmod -R 7777 commands/
ENTRYPOINT [ "commands/create-profile-dmgr-custom-node.sh" ]

EXPOSE 9060
EXPOSE 9043
EXPOSE 9080
EXPOSE 9443
EXPOSE 2809
EXPOSE 9402
EXPOSE 9403
EXPOSE 9353
EXPOSE 5557
EXPOSE 9633
EXPOSE 5558
EXPOSE 5578
EXPOSE 9100
EXPOSE 9401
EXPOSE 7276
EXPOSE 7286
EXPOSE 5060
EXPOSE 5061
EXPOSE 8880
EXPOSE 11003
EXPOSE 11004
EXPOSE 80
EXPOSE 8008

#OTROS
EXPOSE 9405
EXPOSE 9406
EXPOSE 9404