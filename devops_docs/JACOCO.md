# POM configurations

Online references:
- https://www.mkyong.com/maven/jacoco-java-code-coverage-maven-example/

- https://github.com/pkainulainen/maven-examples/blob/master/code-coverage-jacoco/pom.xml

## Maven Surefire Plugin configuration 
Designed to run **Unit** Tests.
```xml
    <build>
        ...
        <plugins>
        ... Just copy the below ...
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-surefire-plugin</artifactId>
                <version>2.15</version>
                <configuration>
                    <argLine>${surefireArgLine}</argLine>
                    <skipTests>${skip.unit.tests}</skipTests>
                    <excludes>
                        <exclude>**/IT*.java</exclude>
                    </excludes>
                </configuration>
            </plugin>
        ... Just copy the above ...
        </plugins>
        ...
    </build>
```

## Failsafe Plugin configuration
Designed to run **Integration Tests** Tests.
```xml
    <build>
        ...
        <plugins>
        ... Just copy the below ...
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-failsafe-plugin</artifactId>
                <version>2.15</version>
                <executions>
                    <execution>
                        <id>integration-tests</id>
                        <goals>
                            <goal>integration-test</goal>
                            <goal>verify</goal>
                        </goals>
                        <configuration>
                            <argLine>${failsafeArgLine}</argLine>
                            <skipTests>${skip.integration.tests}</skipTests>
                        </configuration>
                    </execution>
                </executions>
            </plugin>
        ... Just copy the above ...
        </plugins>
        ...
    </build>
```

## Jacoco Configuration
```xml
    <build>
        ...
        <plugins>
        ... Just copy the below ...

            <plugin>
                <groupId>org.jacoco</groupId>
                <artifactId>jacoco-maven-plugin</artifactId>
                <version>0.7.9</version>
                <executions>
                    <execution>
                        <id>pre-unit-test</id>
                        <goals>
                            <goal>prepare-agent</goal>
                        </goals>
                        <configuration>
                            <destFile>${project.build.directory}/coverage-reports/jacoco-ut.exec</destFile>
                            <propertyName>surefireArgLine</propertyName>
                        </configuration>
                    </execution>

                    <execution>
                        <id>post-unit-test</id>
                        <phase>test</phase>
                        <goals>
                            <goal>report</goal>
                        </goals>
                        <configuration>
                            <!-- Must be in Ant File path format -->
                            <!-- <includes>
                                <include>**/Include.java</include>
                            </includes> -->
                            <!-- <excludes>
                                <exclude>**/Exclude.java</exclude>
                                <exclude>**/FolderToExclude/**</exclude>
                            </excludes> -->
                            <dataFile>${project.build.directory}/coverage-reports/jacoco-ut.exec</dataFile>
                            <outputDirectory>${project.reporting.outputDirectory}/jacoco-ut</outputDirectory>
                        </configuration>
                    </execution>

                    <execution>
                        <id>pre-integration-test</id>
                        <phase>pre-integration-test</phase>
                        <goals>
                            <goal>prepare-agent-integration</goal>
                        </goals>
                        <configuration>
                            <destFile>${project.build.directory}/coverage-reports/jacoco-it.exec</destFile>
                            <propertyName>failsafeArgLine</propertyName>
                        </configuration>
                    </execution>

                    <execution>
                        <id>post-integration-test</id>
                        <phase>post-integration-test</phase>
                        <goals>
                            <goal>report-integration</goal>
                        </goals>
                        <configuration>
                            <dataFile>${project.build.directory}/coverage-reports/jacoco-it.exec</dataFile>
                            <outputDirectory>${project.reporting.outputDirectory}/jacoco-it</outputDirectory>
                        </configuration>
                    </execution>

                    <execution>
                        <id>check</id>
                        <goals>
                            <goal>check</goal>
                        </goals>
                        <configuration>
                            <dataFile>${project.build.directory}/coverage-reports/jacoco-ut.exec</dataFile>
                            <rules>
                                <rule>
                                    <element>BUNDLE</element>
                                    <!-- Must be in Java Class path format -->
                                    <!-- <includes>
                                        <include>com.example.include.me*</include>
                                    </includes>
                                    <excludes>
                                        <exclude>com.example.exclude.me</exclude>
                                    </excludes> -->
                                    <limits>
                                        <limit>
                                            <counter>INSTRUCTION</counter>
                                            <value>COVEREDRATIO</value>
                                            <minimum>0.80</minimum>
                                        </limit>
                                    </limits>
                                </rule>
                            </rules>
                        </configuration>
                    </execution>
                </executions>
            </plugin>

        ... Just copy the above ...
        </plugins>
        ...
    </build>
```

# How to use

Jacoco plugin should now execute post unit and integration tests.  

```bash
mvn clean verify
```