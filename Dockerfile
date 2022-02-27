FROM perl:5.34-slim
WORKDIR /opt/OneRc/
COPY . /opt/OneRc/
RUN cpanm --cpanfile cpanfile --installdeps .
CMD ["perl", "main.pl", "daemon"]
