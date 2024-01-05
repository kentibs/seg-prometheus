FROM prom/prometheus:v2.45.2

COPY prometheus.yml /etc/prometheus/prometheus.yml

ARG TARGET_URL=https://seg-backend.onrender.com/metrics

EXPOSE 9090

RUN echo "  - job_name: 'seg-backend'\n    static_configs:\n    - targets: ['${TARGET_URL}']" >> /etc/prometheus/prometheus.yml

ENTRYPOINT ["prometheus", "--config.file=/etc/prometheus/prometheus.yml", "--web.enable-lifecycle"]
