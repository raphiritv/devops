# POM configuration

[OWASP Dependency Check Documentation for Maven](https://jeremylong.github.io/DependencyCheck/dependency-check-maven/configuration.html)

```xml
<!-- To be added in the root pom.xml -->
    <build>
    ...
        <plugins>
        ... Just copy the below ...
            <plugin>
                <groupId>org.owasp</groupId>
                <artifactId>dependency-check-maven</artifactId>
                <version>2.0.1</version>
                <configuration>
                    <format>ALL</format>
                    <skip>${dependencyCheck.skip}</skip>
                    <failBuildOnAnyVulnerability>${dependencyCheck.failBuild}</failBuildOnAnyVulnerability>
                    <suppressionFiles>
                            <!-- Suppression file -->
                        <suppressionFile>${basedir}/dependency-check-suppressions.xml</suppressionFile>
                    </suppressionFiles>
                </configuration>
                <executions>
                    <execution>
                        <goals>
                                <goal>aggregate</goal>
                        </goals>
                    </execution>
                </executions>
            </plugin>
        ... Just copy the above ...
        </plugins>
    ...
    </build>
```

## Suppressing False Positives & Negatives

Reference: https://jeremylong.github.io/DependencyCheck/general/suppression.html

Create a suppression file.  

```bash
# While in the parent directory of the repository
touch dependency-check-suppressions.xml
```

# How to use

```bash
mvn dependency-check:aggregate -DdependencyCheck.skip=false
```