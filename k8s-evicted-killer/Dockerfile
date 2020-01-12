FROM ludovicm67/k8s-tools
WORKDIR /app
COPY killer.sh .
RUN \
  apk add --no-cache jq \
  && chmod +x killer.sh
CMD ./killer.sh
