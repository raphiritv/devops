# Build Commands  

These set of commands are ideally executed in the Contintuous Integration server.  

### Build, Test, Jacoco, Dependency check and local Deploy
For Developers, this is how to build, test and deploy built java packages in their local maven repository (~/.m2).  
```bash 
mvn clean install
```
### Build, Test, Jacoco, Dependency check without Deploy
The ideal command for build servers. Do not deploy built packages to save time and space.  
```bash
mvn clean verify
```
### Security test with OWASP Dependency check
```bash
mvn dependency-check:aggregate
```
### SonarQube Scan
This command will run and publish the static code analysis result along with the unit tests, jacoco, and dependenchy check results to SonarQube server `sonar.host.url`.  
```bash
mvn sonar:sonar -Dsonar.host.url=http://sonar.example.com -Dsonar.login=aGlhZHNkYTEyM2wxMmszO2wxMjszazE7bDIzazFsMjszMTJzZAo
```

SonarQube preview mode should be executed for feature branches and forks.  
```bash
mvn sonar:sonar -Dsonar.host.url=http://sonar.example.com -Dsonar.login=aGlhZHNkYTEyM2wxMmszO2wxMjszazE7bDIzazFsMjszMTJzZAo -Dsonar.analysis.mode=preview -Dsonar.report.export.path=report.json
```
A json report file will be generated as `target/sonar/report.json`.  

SonarQube preview mode using Sonar Gitlab Plugin to automatically post Sonar Issues detected on the commit to Gitlab Merge Request. 

```bash
mvn --batch-mode sonar:sonar -Dsonar.host.url=http://sonar.example.com -Dsonar.login=aGlhZHNkYTEyM2wxMmszO2wxMjszazE7bDIzazFsMjszMTJzZAo -Dsonar.analysis.mode=preview -Dsonar.gitlab.ref_name=feature/test -Dsonar.gitlab.project_id=1 -Dsonar.gitlab.commit_sha=692047c0
```

For more info about the awesome [Sonar Gitlab Plugin](https://github.com/gabrie-allaigre/sonar-gitlab-plugin) works.  