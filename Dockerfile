###========================================================================
### File: Dockerfile
###
### Author(s): Enrique Fernandez <efcasado@gmail.com>
###========================================================================
FROM       centos:6
MAINTAINER Enrique Fernandez <efcasado@gmail.com>

# Grafana port
EXPOSE 3000:3000

# Install Grafana
ADD etc /etc/
RUN yum install -y epel-release && \
    yum install -y                 \
        grafana                    \
        supervisor              && \
    yum clean all

# Add JSON-based dashboards
ADD var/lib/grafana/dashboards /var/lib/grafana/dashboards
RUN chown -R grafana:grafana /var/lib/grafana/dashboards

# Configure supervisord
COPY usr/etc/supervisord.conf /usr/etc/supervisord.conf

COPY       docker-entrypoint.sh docker-entrypoint.sh
ENTRYPOINT [ "./docker-entrypoint.sh" ]
