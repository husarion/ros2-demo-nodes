ARG ROS_DISTRO=galactic

FROM ros:$ROS_DISTRO-ros-core

# install ros package
RUN apt-get update && apt-get install -y \
        net-tools \
        iputils-ping \
        ros-$ROS_DISTRO-rmw-cyclonedds-cpp \
        ros-$ROS_DISTRO-rmw-fastrtps-cpp \
        ros-$ROS_DISTRO-demo-nodes-cpp && \
    rm -rf /var/lib/apt/lists/*

ENV RMW_IMPLEMENTATION=rmw_fastrtps_cpp

RUN echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> ~/.bashrc