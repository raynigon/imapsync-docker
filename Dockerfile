FROM ubuntu

RUN apt update &&\
    apt upgrade -y &&\
    apt install -y\
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
    cpanminus\
    wget &&\
    apt-get clean autoclean &&\
    apt-get autoremove --yes &&\
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
RUN wget https://imapsync.lamiral.info/dist/imapsync-1.977.tgz &&\
    tar -xvf imapsync-1.977.tgz &&\
    rm imapsync-1.977.tgz &&\
    mv imapsync-1.977 imapsync &&\
    cd imapsync &&\
    chmod +x imapsync
WORKDIR /app/imapsync

CMD [ "/app/imapsync/imapsync" ]