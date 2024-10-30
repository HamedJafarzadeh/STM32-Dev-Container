FROM ubuntu:22.04

# Install common dependencies
RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && apt-get install -y --allow-unauthenticated --no-install-recommends \
        ca-certificates \
        openssh-client \
        build-essential \
        bash\
        curl\
        # ^^ needed for downloading files
        usbutils \
        # ^^ needed for stlink
        libncurses5 \
        # ^^ needed for GDB
        libglib2.0-0 \
        # ^^ needed for GDB
        libusb-1.0.0-dev \
        libncurses-dev \
        wget \
        unzip \
        clang \
        clang-tools \
        git git-lfs \
        stlink-tools \
        python3 python3-pip \
        # ^^ needed for pre-commit tool
        udev \
        # ^^ needed for serial monitor extension
        locales \
        clang-format \
       expect \
    && apt-get clean && rm -rf /var/lib/apt/lists/*
# ------------------ Instlal CMAKE ------------------
ARG REINSTALL_CMAKE_VERSION_FROM_SOURCE="3.22.2"

# Optionally install the cmake for vcpkg
COPY ./reinstall-cmake.sh /tmp/

RUN if [ "${REINSTALL_CMAKE_VERSION_FROM_SOURCE}" != "none" ]; then \
        chmod +x /tmp/reinstall-cmake.sh && /tmp/reinstall-cmake.sh ${REINSTALL_CMAKE_VERSION_FROM_SOURCE}; \
    fi \
    && rm -f /tmp/reinstall-cmake.sh

# ------------------ Install STM32CubeIDE ------------------
ENV TZ=Etc/UTC
ENV STM32CUBEIDE_VERSION=1.14.0
ENV PATH="${PATH}:/opt/st/stm32cubeide_${STM32CUBEIDE_VERSION}"
ENV DEBIAN_FRONTEND=noninteractive
ENV LICENSE_ALREADY_ACCEPTED=1
ENV PROGRESS_NO_TRUNC=1
ENV BUILDKIT_PROGRESS=plain
# Set the locale
# ^^^ Needed by pre-commit
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

COPY en.st-stm32cubeide_* /tmp/stm32cubeide-installer.sh.zip
COPY auto_install_cubeide.sh /tmp/auto_install_cubeide.sh
COPY configuration.sh /tmp/configuration.sh

RUN unzip -p /tmp/stm32cubeide-installer.sh.zip > /tmp/stm32cubeide-installer.sh && rm /tmp/stm32cubeide-installer.sh.zip && chmod +x /tmp/stm32cubeide-installer.sh && \
# Install STM32 Cube IDE and delete installer
    chmod +x /tmp/auto_install_cubeide.sh && /tmp/auto_install_cubeide.sh && rm /tmp/auto_install_cubeide.sh && rm /tmp/stm32cubeide-installer.sh
# update path
RUN chmod +x /tmp/configuration.sh && /tmp/configuration.sh && rm /tmp/configuration.sh
RUN pip install pre-commit
# Print that image is created and ready to use
CMD "echo 'Image created and ready to use']