#!/bin/bash

# Set the desired new port number
NEW_PORT="8081"  # Change this to your desired port

# Location of Tomcat's server.xml file
TOMCAT_CONF_FILE="/opt/tomcat/conf/server.xml"

# Check if Tomcat is installed
if [ ! -d "/opt/tomcat" ]; then
  echo "Tomcat is not installed in /opt/tomcat. Exiting..."
  exit 1
fi

# Backup the original server.xml file
echo "Backing up the original server.xml..."
cp "$TOMCAT_CONF_FILE" "$TOMCAT_CONF_FILE.bak"

# Update the port number in the server.xml file
echo "Changing Tomcat port to $NEW_PORT in $TOMCAT_CONF_FILE..."
sed -i "s/port=\"8080\"/port=\"$NEW_PORT\"/" "$TOMCAT_CONF_FILE"

# Restart Tomcat to apply the changes
echo "Restarting Tomcat..."
cd /opt/tomcat/bin
./shutdown.sh
./startup.sh

# Check if Tomcat is running on the new port
echo "Tomcat should now be running on port $NEW_PORT. Access it at http://localhost:$NEW_PORT"

# Optional: Check if Tomcat is running
curl -I http://localhost:$NEW_PORT

echo "Port change for Tomcat completed!"
