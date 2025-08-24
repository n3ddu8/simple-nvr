# 🎥 Simple NVR Container

I wanted a lightweight NVR solution to record footage from my PoE cameras 24/7. Since my smart home platform already provides the advanced features I need, I wasn’t looking for the extra complexity that comes with most full-featured NVR software.

After testing and discarding several alternatives, I discovered [simple-nvr](https://github.com/TomHumphries/simple-nvr) which turned out to be exactly what I was looking for. Credit to the original developer [TomHumphries](https://github.com/TomHumphries) for creating such a straightforward solution.

I’ve forked the project and containerised it, as running software in containers is my preferred approach on my NAS.

⚠️ **Note: The original project has not been updated in several years. Use at your own risk.** ⚠️

## 🚀 Getting Started
Copy the example configuration files, update them for your setup, and start the container.

1. Create storage configuration

Copy storage.json.example to storage.json and set the directory where recordings should be saved:
```json
{
    "rootpath": "/home/username/recordings/"
}
```

2. Create camera configuration

Copy cameras.json.example to cameras.json and add the RTSP URL(s) for your camera(s). Repeat for each camera:
```json
[
    {
        "name": "front-door",
        "url": "rtsp://192.168.255.255:554/1020p"
    },
    {
        "name": "back-door",
        "url": "rtsp://192.168.255.256:554/1020p"
    }
]
```

3. Start the container

Run the container with your configuration files mounted:
```shell
docker run -d \
  -v $(pwd)/cameras.json:/opt/app/cameras.json:ro \
  -v $(pwd)/storage.json:/opt/app/storage.json:ro \
  -p 3000:3000 \
  ghcr.io/n3ddu8/simple-nvr:latest
```

The container will start recording immediately using the settings you provided.

4. Access the web interface

Visit http://localhost:3000 to view your camera feeds.

