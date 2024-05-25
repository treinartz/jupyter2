# Use the official Jupyter Docker Stacks base image
FROM jupyter/base-notebook

USER root

# Install Java 17
RUN apt-get update && \
    apt-get install -y openjdk-17-jdk

# Install Xvfb for virtual framebuffer
RUN apt-get install -y xvfb

# Set environment variables to ensure Java 17 is used
ENV JAVA_HOME /usr/lib/jvm/java-17-openjdk-amd64
ENV PATH $JAVA_HOME/bin:$PATH

# Install pip and py5
RUN pip install py5

# Add the start script
COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

# Use the start script as the entrypoint
ENTRYPOINT ["/usr/local/bin/start.sh"]

# Expose port 8888 for Jupyter Notebook
EXPOSE 8888

USER $NB_UID
