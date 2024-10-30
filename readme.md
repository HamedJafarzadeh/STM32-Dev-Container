
# STM32 Development Container (Dev Container)

This repository contains a Docker configuration for creating a development environment for STM32 microcontrollers using CMake.

## Features

- Ubuntu 22.04 base image
- STM32CubeIDE 1.14.0
- Works out-of-box with STLink and JLink (Using Host USB Devices)
- CMake 3.22.2
- Various development tools (GCC, Clang, Git, STLink tools, etc.)
- Pre-commit hooks support

## USB Device Access

This development container is configured with privileged access to the host's USB devices. This feature is crucial for STM32 development, as it allows direct communication with STLink and JLink debuggers connected to the host machine. With this setup, you can flash firmware, debug your STM32 applications, and interact with your development board seamlessly from within the container. This capability ensures that you can perform all necessary development tasks, including programming and debugging your STM32 devices, without leaving the containerized environment.
 
## Why Use a Dev Container?

Development containers offer significant advantages for software projects, especially in team environments:

1. **Consistency**: Ensures all team members work in an identical environment, eliminating "it works on my machine" issues.

2. **Quick Setup**: New team members can start development immediately without spending time on complex environment setup.

3. **Reproducibility**: The development environment is versioned alongside the code, making it easy to reproduce builds and tests.

4. **Isolation**: Keeps project dependencies separate from the host system, preventing conflicts with other projects.

5. **Portability**: Works across different operating systems (Windows, macOS, Linux) with minimal configuration.

6. **Easy Updates**: Updating the development environment for all team members is as simple as updating the container configuration.

With this STM32 development container, you can jump straight into STM32 and CMake development without worrying about installing and configuring tools. Just run the container, and you'll have a fully-equipped environment ready for STM32 development. This approach saves time, reduces setup errors, and allows the team to focus on actual development rather than environment issues.

## Prerequisites

- Docker installed on your system
- STM32CubeIDE installer (`en.st-stm32cubeide_xxx_ad64.sh.zip`)

## Using Pre-built Images (Recommended)

You can use pre-built images available on Docker Hub:

```
docker pull [your-dockerhub-username]/stm32-dev-container:latest
```

## Building the Container (Advanced)

1. Download the STM32CubeIDE installer (`en.st-stm32cubeide_xxx_ad64.sh.zip`) from the official STMicroelectronics website.

2. Place the downloaded `.zip` file in the same directory as the Dockerfile.

3. Update the Dockerfile to use the correct filename of the STM32CubeIDE installer:

   ```dockerfile
   COPY en.st-stm32cubeide_xxx_ad64.sh.zip /tmp/stm32cubeide-installer.sh.zip
   ```

4. Build the Docker image:

   ```
   docker build -t stm32-dev-container .
   ```



## Usage

To start a container using this image:

```
docker run -it --rm stm32-dev-container
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.