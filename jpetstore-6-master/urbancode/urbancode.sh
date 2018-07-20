alias udclient="/opt/udclient/udclient/udclient -username admin -password admin -weburl http://$URBANCODE_SERVER_URL:8080"

# Create the version and upload app files
udclient createVersion -component JPetStore-APP -name $VERSION
udclient addVersionFiles -component JPetStore-APP -version $VERSION -base $ARTIFACT_DIR

# Trigger the application process to start the deployment
udclient requestApplicationProcess application-process-request.json

