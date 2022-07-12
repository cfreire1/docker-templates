# - COMANDOS DOCKER
# docker build -t was-server .
# ===============================================================
FROM  heremod/websphere-traditional:8.5.5.14
# ===============================================================

ADD commands /commands
RUN chmod -R 7777 commands/
ENTRYPOINT [ "commands/create-profile-default.sh" ]

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
EXPOSE 8080
EXPOSE 8008