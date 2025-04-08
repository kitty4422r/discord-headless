# Use the official Selenium Docker image with Chrome
FROM selenium/standalone-chrome:latest

# Install noVNC and other required tools (x11vnc, websockify)
USER root
RUN apt-get update && \
    apt-get install -y novnc websockify x11vnc && \
    apt-get clean

# Expose the necessary ports (VNC and noVNC)
EXPOSE 4444 5900 6080

# Start noVNC and x11vnc (VNC server) with websockify on port 6080
CMD ["sh", "-c", "x11vnc -forever -usepw -create -rfbport 5900 & websockify -D 6080 localhost:5900 && /opt/selenium/bin/entry_point.sh"]
