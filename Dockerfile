ARG BASETAG=2
FROM amazonlinux:${BASETAG}
ARG VERSION

LABEL RELEASE=${RELEASE}

VOLUME ["/src"]
WORKDIR /src
RUN yum groupinstall -y 'Development tools' && \
    yum install -y cmake which tar git wget && \
    yum clean all; \
    if test -x /usr/bin/ld.gold; \
    then update-alternatives --set ld /usr/bin/ld.gold; \
    fi
CMD ["/bin/bash"]
