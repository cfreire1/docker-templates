# Datos de Imagen
* docker-oracle-xe-11g (IMG)
   * link:https://hub.docker.com/r/oracleinanutshell/oracle-xe-11g
# Instrucciones (Apex)
* Login http://localhost:<port>/apex/apex_admin with following credential:
    * username: ADMIN
    * password: admin (Pedira cambiar)
  
# Instrucciones (Normal)
* crear nuevo usuario
* CREAR USER Y PASS
```
    CREATE USER ORACLE_USER IDENTIFIED BY 1234;
```
* ATORGAR PRIVILEGIOS
```
    GRANT CONNECT, RESOURCE, DBA TO ORACLE_USER;
```
      
# Credenciales para ingresar
* Usuario para conectar
```
    Connect: xe
    hostname: localhost
    port: 1521
    sid: xe
    username: system
    password: oracle
    role: normal
```

* Usuario sys
```
    Connect: sys
    hostname: localhost
    port: 1521
    sid: xe
    username: sys
    password: oracle
    role : SYSDBA
```
