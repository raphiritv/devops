# Deploying Snapshots to Nexus
Only applicable if version is in SNAPSHOT format. E.g: `0.1.1-SNAPSHOT` or `0.1-SNAPSHOT`.  
```bash
mvn deploy -DaltDeploymentRepository="nexus-snapshot::default::http://localhost:8081/nexus/content/repositories/snapshots/"
```
Deployed packages should then be visible in http://localhost:8081/nexus/content/repositories/snapshots/.  

# Deploying Releases to Nexus
Only applicable if version is in RELEASE format. E.g: `0.1.1` or `0.1.3`. If the version to be deployed already exists or has already been deployed, maven will fail.  
```bash
mvn deploy -DaltDeploymentRepository="nexus-snapshot::default::http://localhost:8081/nexus/content/repositories/releases/"
```
Deployed packages should then be visible in http://localhost:8081/nexus/content/repositories/releases/.  