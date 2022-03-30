FROM perl:5.34-slim
RUN apt update && apt install gcc postgresql-client  libpq-dev libdbd-pg-perl -y
WORKDIR /opt/OneRC/
COPY ./cpanfile /opt/OneRC/cpanfile
RUN cpanm --cpanfile cpanfile --installdeps --force .
WORKDIR /opt/OneRC/
COPY . /opt/OneRC/
EXPOSE 3000
ENTRYPOINT ["hypnotoad",  "-f" ,"./script/one_rc"]
