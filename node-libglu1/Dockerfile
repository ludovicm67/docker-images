FROM node:lts

RUN apt-get -q update \
  && apt-get install -yq --no-install-recommends libglu1 \
  && apt-get clean
