FROM perl:5.34-slim
WORKDIR /opt/OneRC/
COPY . /opt/OneRC/
RUN cpanm --cpanfile cpanfile --installdeps .
ENTRYPOINT ["hypnotoad",  "-f" ,"./script/one_rc"]
