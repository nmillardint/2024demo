# Stage 1: Build Lucee image
FROM lucee/lucee5:latest AS lucee-build

#Creates a FusionReactor Directory
RUN mkdir -p /opt/fusionreactor/instance/lucee

#Adds the fusionreactor.jar file to the instance directory
#ADD fusionreactor.jar /opt/fusionreactor/instance/steamstorefront
ADD https://download.fusionreactor.io/FR/Latest/fusionreactor.jar /opt/fusionreactor/instance/lucee

#Adds the debug library file to the instance directory
ADD https://download.fusionreactor.io/FR/Latest/libfrjvmti_x64.so /opt/fusionreactor/instance/lucee
