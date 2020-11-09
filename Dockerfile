FROM centos/ruby-22-centos7
USER default
EXPOSE 8080
ENV RACK_ENV production
ENV RAILS_ENV production
# Custom packages - PH
USER root
RUN yum install -y coreutils nfs-utils \
    mkdir /ruby-page
USER default
COPY . /opt/app-root/src/
RUN scl enable rh-ruby22 "bundle install"
CMD ["scl", "enable", "rh-ruby22", "./run.sh"]
USER root
RUN chmod og+rw /opt/app-root/src/db
USER default
