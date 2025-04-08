version: '3'
services:
  selenium:
    build: .
    ports:
      - "4444:4444"
      - "5900:5900"
    environment:
      - SE_NODE_OVERRIDE_MAX_SESSION=true
    volumes:
      - /dev/shm:/dev/shm

  novnc:
    image: consol/novnc
    ports:
      - "6080:6080"
    depends_on:
      - selenium
    environment:
      - VNC_SERVER=selenium:5900
