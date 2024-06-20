FROM openjdk

ADD steam.jar /opt
#Creates a FusionReactor Directory
RUN mkdir -p /opt/fusionreactor/instance/storefront

#Adds the fusionreactor.jar file to the instance directory
ADD https://download.fusionreactor.io/FR/Latest/fusionreactor.jar /opt/fusionreactor/instance/storefront

#Adds the debug library file to the instance directory
ADD https://download.fusionreactor.io/FR/Latest/libfrjvmti_x64.so /opt/fusionreactor/instance/storefront

#Adds FusionReactor to the JVM arguments
CMD java -javaagent:/opt/fusionreactor/instance/storefront/fusionreactor.jar=name=storefront,address=8088 -agentpath:/opt/fusionreactor/instance/storefront/libfrjvmti_x64.so -Dfrlicense=CLOUD-WEKOF-DX0SK-BHM8P-E1XUM-K5HK8 -Dfr.ed.ds.target=cf:2106 -Dfr.ed.ds.groups=default -jar /opt/steam.jar --spring.datasource.url=jdbc:mysql://mysql:3306/customerdatabase
