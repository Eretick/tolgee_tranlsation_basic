# Крок 1: Отримуємо файли LanguageTool
FROM erikvl87/languagetool:6.7 AS lt_source

# Крок 2: Основний образ Tolgee
FROM tolgee/tolgee:v3.183.0

USER root
RUN apk add --no-cache supervisor

# ВИПРАВЛЕННЯ: Копіюємо вміст робочої директорії LanguageTool
# У цьому образі вона зазвичай /languagetool або визначена через WORKDIR
COPY --from=lt_source / /lt_temp/
RUN mkdir -p /opt/languagetool && \
    cp -r /lt_temp/languagetool/* /opt/languagetool/ 2>/dev/null || cp -r /lt_temp/opt/languagetool/* /opt/languagetool/ 2>/dev/null || true && \
    rm -rf /lt_temp

# Решта без змін
COPY config_koyeb.yaml /config.yaml
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN sed -i 's/http:\/\/languagetool:8010/http:\/\/localhost:8010/g' /config.yaml

EXPOSE 8080

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
