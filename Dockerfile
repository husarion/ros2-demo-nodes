ARG ROS_DISTRO=humble
ARG PREFIX=

FROM husarnet/ros:${PREFIX}${ROS_DISTRO}-ros-core

SHELL ["/bin/bash", "-c"]

RUN apt update && apt upgrade -y && apt install -y \
        net-tools \
        iputils-ping \
        ros-$ROS_DISTRO-demo-nodes-py \
        ros-$ROS_DISTRO-demo-nodes-cpp && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN echo $(dpkg -s ros-$ROS_DISTRO-demo-nodes-cpp | grep 'Version' | sed -r 's/Version:\s([0-9]+.[0-9]+.[0-9]+).*/\1/g') > /version.txt
