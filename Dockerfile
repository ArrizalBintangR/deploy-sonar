FROM sonatype/nexus3:3.61.0

ARG PLUGIN_VERSION=0.61.0
ARG KAR_URL=https://repo1.maven.org/maven2/org/sonatype/nexus/plugins/nexus-blobstore-google-cloud/${PLUGIN_VERSION}/nexus-blobstore-google-cloud-${PLUGIN_VERSION}-bundle.kar

USER root
ADD ${KAR_URL} /opt/sonatype/nexus/deploy/nexus-blobstore-google-cloud-${PLUGIN_VERSION}-bundle.kar
RUN chown nexus:nexus /opt/sonatype/nexus/deploy/nexus-blobstore-google-cloud-${PLUGIN_VERSION}-bundle.kar

USER nexus


# build it
# docker build --platform linux/amd64 -t nexus3-gcs:3.61.0 .
#
# run it
# docker run --platform linux/amd64 -d -p 8081:8081 -v nexus-data:/nexus-data --name sre-task1 nexus3-gcs:3.61.0
