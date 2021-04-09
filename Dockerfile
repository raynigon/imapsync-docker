FROM ubuntu

RUN apt install -y\
    libauthen-ntlm-perl\
    libcgi-pm-perl\
    libcrypt-openssl-rsa-perl\
    libdata-uniqid-perl\
    libencode-imaputf7-perl\
    libfile-copy-recursive-perl\
    libfile-tail-perl\
    libio-socket-inet6-perl\
    libio-socket-ssl-perl\
    libio-tee-perl\
    libhtml-parser-perl\
    libjson-webtoken-perl\
    libmail-imapclient-perl\
    libparse-recdescent-perl\
    libmodule-scandeps-perl\
    libreadonly-perl\
    libregexp-common-perl\
    libsys-meminfo-perl\
    libterm-readkey-perl\
    libtest-mockobject-perl\
    libtest-pod-perl\
    libunicode-string-perl\
    liburi-perl\
    libwww-perl\
    libtest-nowarnings-perl\
    libtest-deep-perl\
    libtest-warn-perl\
    make\
    cpanminus

WORKDIR /app
RUN wget https://imapsync.lamiral.info/dist/imapsync-1.977.tgz
RUN tar -xvf imapsync-1.977.tgz
RUN mv imapsync-1.977 imapsync &&\
    cd imapsync &&\
    chmod +x imapsync
WORKDIR /app/imapsync

CMD [ "/app/imapsync" ]