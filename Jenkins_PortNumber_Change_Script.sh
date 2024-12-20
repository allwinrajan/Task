#!/bin/bash

# Set the desired new port number for Jenkins
NEW_PORT="8081"  # Change this to your desired port

# Location of the Jenkins configuration file
JENKINS_CONF_FILE="/etc/default/jenkins"

# Check if Jenkins is installed
if [ ! -f "$JENKINS_CONF_FILE" ]; then
  echo "Jenkins is not installed in /etc/default/jenkins. Exiting..."
  exit 1
fi

# Backup the original Jenkins config file
echo "Backing up the original Jenkins configuration..."
cp "$JENKINS_CONF_FILE" "$JENKINS_CONF_FILE.bak"

# Update the HTTP_PORT in the Jenkins config file
echo "Changing Jenkins port to $NEW_PORT in $JENKINS_CONF_FILE..."
sed -i "s/^HTTP_PORT=.*/HTTP_PORT=$NEW_PORT/" "$JENKINS_CONF_FILE"

# Restart Jenkins to apply the changes
echo "Restarting Jenkins..."
sudo systemctl restart jenkins

# Check if Jenkins is running on the new port
echo "Jenkins should now be running on port $NEW_PORT. Access it at http://localhost:$NEW_PORT"

# Optional: Check if Jenkins is running
curl -I http://localhost:$NEW_PORT

echo "Port change for Jenkins completed!"
