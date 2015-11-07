FROM ubuntu:15.10

RUN apt-get -y update && apt-get -y upgrade && apt-get -y dist-upgrade

RUN apt-get -y install apt-transport-https
RUN echo 'deb https://cran.r-project.org/bin/linux/ubuntu wily/' >> /etc/apt/sources.list.d/cran.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
RUN apt-get update
RUN apt-get install -y r-base

ADD install-rserve.R /
RUN Rscript install-rserve.R

ADD run.sh /
RUN chmod +x /run.sh
EXPOSE 6311
ENV R_HOME /usr/lib/R
CMD /run.sh
