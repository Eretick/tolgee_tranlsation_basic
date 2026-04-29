FROM tolgee/tolgee:v3.183.0
COPY config.yaml /config.yaml
ENV spring_config_additional_location=file:///config.yaml
EXPOSE 8080
