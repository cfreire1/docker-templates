
 * Sonarqube en proyecto maven

```
	<build>
		<plugins>
			<plugin>
				<groupId>org.springframework.boot</groupId>
				<artifactId>spring-boot-maven-plugin</artifactId>
			</plugin>
			<plugin>
			  	<groupId>org.sonarsource.scanner.maven</groupId>
				  <artifactId>sonar-maven-plugin</artifactId>
                      <version>3.3.0.603</version>
                      <executions>
                        <execution>
                          <phase>verify</phase>
                          <goals>
                            <goal>sonar</goal>
                          </goals>
                        </execution>
                      </executions>
             </plugin>
		</plugins>
	</build>
```

* Ejecucion

```
    - mvn clean verify sonar 
      -DskipTests=true 
      -Dsonar.host.url=$SONAR_HOST_URL 
      -Dsonar.organization=privado 
      -Dsonar.login=$SONAR_TOKEN
```

