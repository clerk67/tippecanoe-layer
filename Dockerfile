FROM public.ecr.aws/sam/build-nodejs18.x

RUN yum install -y sqlite-devel

RUN git clone https://github.com/mapbox/tippecanoe.git \
  && cd tippecanoe \
  && make -j \
  && make install

RUN zip -jry9 tippecanoe.zip /usr/local/bin/tippecanoe* /usr/local/bin/tile-join

CMD cp tippecanoe.zip /share
