FROM prom/prometheus:v2.45.2

COPY prometheus.yml /etc/prometheus/prometheus.yml

ARG TARGET_URL=https://seg-backend.onrender.com/metrics

EXPOSE 9090

ENTRYPOINT ["prometheus", "--config.file=/etc/prometheus/prometheus.yml", "--web.enable-lifecycle"]

# RUN DOCKER IMAGE
# sudo docker build -t seg-prometheus-image .
# sudo docker run -p 9090:9090 seg-prometheus-image
