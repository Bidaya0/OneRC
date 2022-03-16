FROM perl:5.34-slim
RUN apt update && apt install gcc postgresql-client  libpq-dev libdbd-pg-perl -y
WORKDIR /opt/OneRC/
COPY . /opt/OneRC/
RUN cpanm --cpanfile cpanfile --installdeps --force .
EXPOSE 3000
ENTRYPOINT ["hypnotoad",  "-f" ,"./script/one_rc"]
