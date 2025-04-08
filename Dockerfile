# Use the official Selenium Docker image with Chrome and VNC support
FROM selenium/standalone-chrome:latest

# Expose the necessary ports
EXPOSE 4444 5900

# Start noVNC to allow access via the web browser
CMD ["sh", "-c", "start-noVNC --vnc localhost:5900 --listen 6080"]
