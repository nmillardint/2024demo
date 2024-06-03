FROM openjdk

ADD https://dlcdn.apache.org//jmeter/binaries/apache-jmeter-5.6.3.tgz /jmeter.tgz
RUN tar -xvf /jmeter.tgz

ADD ./cfload.jmx /load.jmx
CMD /apache-jmeter-5.6.3/bin/jmeter.sh -n -t /load.jmx
