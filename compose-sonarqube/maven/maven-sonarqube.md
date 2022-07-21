
 * Sonarqube en proyecto maven
 * LINK: https://docs.sonarqube.org/latest/analysis/scan/sonarscanner-for-maven/

```
<!-- Para permitir coverave en sonarqube-->
	<profiles>
		<profile>
			<id>coverage</id>
			<activation>
				<activeByDefault>true</activeByDefault>
			</activation>
			<build>
				<plugins>
					<plugin>
						<groupId>org.jacoco</groupId>
						<artifactId>jacoco-maven-plugin</artifactId>
						<executions>
							<execution>
								<id>prepare-agent</id>
								<goals>
									<goal>prepare-agent</goal>
								</goals>
							</execution>
							<execution>
								<id>report</id>
								<goals>
									<goal>report</goal>
								</goals>
							</execution>
						</executions>
					</plugin>
				</plugins>
			</build>
		</profile>
	</profiles>
```

* Ejecucion

```
mvn clean verify sonar:sonar -Dsonar.host.url=<UTR_SONAR> -Dsonar.login=<TOKEN_SONAR> -Dsonar.java.binaries=target/ -Dsonar.java.coveragePlugin=jacoco -Dsonar.forceAnalysis=true -Dsonar.qualitygate.wait=true -Dsonar.coverage.jacoco.xmlReportPaths=target/site/jacoco/jacoco.xml -Dsonar.junit.reportsPath=target/surefire-reports
```

