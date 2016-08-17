FROM freedomben/scala-sbt:2.11.8.1

RUN groupadd --gid 9999 docker \
 && useradd --uid 9999 --gid 9999 --create-home docker

USER docker
WORKDIR /home/docker

ENV CONSCRIPT_HOME /home/docker/.conscript
ENV CONSCRIPT_BIN $CONSCRIPT_HOME/bin
ENV PATH $PATH:$CONSCRIPT_BIN

# Install conscript
# conscript setup stupidly exits with error code 1 even after success :facepalm:
# replace the last line with a version that exits truthfully
RUN curl https://raw.githubusercontent.com/foundweekends/conscript/master/setup.sh | head -n -1 | sed '$ a cs || true' | sh

# Install giter8
RUN cs foundweekends/giter8
