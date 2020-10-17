FROM ubuntu:16.04
LABEL Description="This image is used to start iotlab on personnal machine" Vendor="Quentin Millardet" Version="1.0"

RUN         apt-get update && \
            apt-get install -y openjdk-8-jdk git net-tools wget unzip mysql-client
ENV         JAVA_HOME         /usr/lib/jvm/java-8-openjdk-amd64
ENV         GLASSFISH_HOME    /usr/local/glassfish4
ENV         PATH              $PATH:$JAVA_HOME/bin:$GLASSFISH_HOME/bin

RUN         apt-get update && \
            apt-get install -y curl unzip zip inotify-tools && \
            rm -rf /var/lib/apt/lists/*

RUN         curl -L -o /tmp/glassfish-4.1.zip http://download.java.net/glassfish/4.1/release/glassfish-4.1.zip && \
            unzip /tmp/glassfish-4.1.zip -d /usr/local && \
            rm -f /tmp/glassfish-4.1.zip

EXPOSE      8080 4848 8181

WORKDIR     /usr/local/glassfish4

# verbose causes the process to remain in the foreground so that docker can track it
CMD         asadmin start-domain --verbose

RUN cd /home/ && git clone https://github.com/AnthonyDeroche/iotlab.git
RUN cp /home/iotlab/server/lib/bonecp-datasource.xml /usr/local/glassfish4/bin/
RUN cp /home/iotlab/server/lib/*.jar /usr/local/glassfish4/glassfish/domains/domain1/lib/ext/
RUN /usr/local/glassfish4/bin/asadmin stop-domain
COPY entrypoint.sh /home/entrypoint.sh
RUN chmod 777 /home/entrypoint.sh
CMD /usr/local/glassfish4/bin/asadmin start-domain && /home/entrypoint.sh && sleep infinity
