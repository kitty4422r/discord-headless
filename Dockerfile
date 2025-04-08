# Use the official Selenium Docker image with Chrome
FROM selenium/standalone-chrome:latest

# Install noVNC and X11VNC (necessary for noVNC to work)
USER root
RUN apt-get update && \
    apt-get install -y novnc websockify x11vnc && \
    apt-get clean

# Expose the necessary ports for Selenium and VNC
EXPOSE 4444 5900 6080

# Set up noVNC and VNC server to run on container start
CMD ["sh", "-c", "x11vnc -forever -usepw -create & websockify -D 6080 localhost:5900 && /opt/selenium/bin/entry_point.sh"]
