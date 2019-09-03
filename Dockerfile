#fork from https://github.com/njmittet/alpine-openjdk/blob/master/Dockerfile
FROM alpine:3.8

ENV JAVA_VERSION=8.212.04-r1

RUN set -ex && \
    apk --no-cache add curl=7.61.1-r2 ca-certificates=20190108-r0 bash=4.4.19-r1 net-tools=1.60_git20140218-r2 nano=2.9.8-r0

#disable coloring for nano, see https://stackoverflow.com/a/55597765/1137529
RUN echo "syntax \"disabled\" \".\"" > ~/.nanorc; echo "color green \"^$\"" >> ~/.nanorc

#work-arround for nano
#Odd caret/cursor behavior in nano within SSH session,
#see https://github.com/Microsoft/WSL/issues/1436#issuecomment-480570997
ENV TERM eterm-color

#RUN apk add "$JAVA_PACKAGE$JAVA_VERSION" --update
#&& rm -rf /var/cache/apk/* && ln -s "/usr/lib/jvm/java-1.$JAVA_VERSION-openjdk/bin/javac" /usr/bin/javac

RUN \
  apk --no-cache add openjdk8=${JAVA_VERSION} && \
  rm -rf /var/cache/apk/*

#RUN cd /usr/bin && ln -s "../lib/jvm/default-jvm/jre/bin/javac" /usr/bin/javac

ENV JAVA_HOME=/usr/lib/jvm/default-jvm/
ENV PATH=${PATH}:${JAVA_HOME}/bin

CMD ["/bin/sh"]

#docker build --squash . -t openjdk8
#smoke test
#docker run -it openjdk8 java -version
#smoke test
#docker run -it openjdk8 javac -version
#docker run -v C:/dev/work:/work -it --entrypoint="bash" openjdk8
#docker tag openjdk8 alexberkovich/alpine-openjdk
#docker push alexberkovich/alpine-openjdk

# EOF