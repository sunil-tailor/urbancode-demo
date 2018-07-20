node('udclient') {
   def mvnHome
   stage('Preparation') { // for display purposes
      // Get some code from a GitHub repository
      git 'https://github.com/sunil-tailor/urbancode-demo.git'
      // Get the Maven tool.
      // ** NOTE: This 'M3' Maven tool must be configured
      // **       in the global configuration.           
      mvnHome = '/usr/local/maven/apache-maven-3.3.9'
   }
   stage('Build') {
      // Run the maven build
      if (isUnix()) {
         sh "'${mvnHome}/bin/mvn' -f jpetstore-6-master/pom.xml -Dmaven.test.failure.ignore clean package"
      } else {
         bat(/"${mvnHome}\bin\mvn" -f jpetstore-6-master\/pom.xml  -Dmaven.test.failure.ignore clean package/)
      }
   }
   stage('Results') {
      archive 'target/*.jar'
      nexusArtifactUploader artifacts: [[artifactId: 'jpetstore', classifier: '', file: 'jpetstore-6-master/target/jpetstore.war', type: 'war']], credentialsId: 'nexus', groupId: 'org.mybatis', nexusUrl: '10.0.0.38:8085', nexusVersion: 'nexus3', protocol: 'http', repository: 'jPetStore', version: '6.0.3-SNAPSHOT'
   }

   stage('UrbanCode') {
       sh """
       export URBANCODE_SERVER_URL=10.0.0.38
       export VERSION=1.1
       export ARTIFACT_DIR=$WORKSPACE/jpetstore-6-master/target/
       export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.171-8.b10.amzn2.x86_64/jre
       chmod +x $WORKSPACE/jpetstore-6-master/urbancode/urbancode.sh
       $WORKSPACE/jpetstore-6-master/urbancode/urbancode.sh
       """
   }
}