# POM configuration

```xml
<!-- To be added in the root pom.xml -->
    <build>
    ...
        <plugins>
        ... Just copy the below ...
            <!-- SONARQUBE - Maven Plugin; FOR DEPENDENCY CHECK; Renewed version -->
            <plugin>
                <groupId>org.codehaus.mojo</groupId>
                <artifactId>sonar-maven-plugin</artifactId>
                <version>3.3.0.603</version>
            </plugin>
        ... Just copy the above ...
        </plugins>
    ...
    </build>
```

### Dependency Check & Jacoco Sonar Integration Properties

```xml
    <properties>
        ...
        <!-- Sonar use dependency check xml report path -->
        <sonar.jacoco.reportPaths>target/coverage-reports/jacoco-ut.exec</sonar.jacoco.reportPaths>
        <!-- Dependency Report Path for Sonarqube -->
        <sonar.dependencyCheck.reportPath>${project.build.directory}/dependency-check-report.xml</sonar.dependencyCheck.reportPath>
        ...
    </properties>
```

## How to use

```bash
mvn sonar:sonar -Dsonar.login=30dfe236f945d041df7f00eb000f53c2554f8c2c -Dsonar.host.url=http://localhost:9000/sonar
```