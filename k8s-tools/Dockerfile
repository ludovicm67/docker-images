FROM alpine:3.12

# configure versions
ARG KUBECTL_VERSION=1.18.6
ARG KUSTOMIZE_VERSION=3.8.1
ARG KUBESCORE_VERSION=1.7.3
ARG KUBEVAL_VERSION=0.15.0

# get all binaries
ADD "https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl" /usr/local/bin/
RUN wget -O - https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz | tar xzC /usr/local/bin/ kustomize
ADD "https://github.com/zegl/kube-score/releases/download/v${KUBESCORE_VERSION}/kube-score_${KUBESCORE_VERSION}_linux_amd64" /usr/local/bin/kube-score
RUN wget -O - https://github.com/instrumenta/kubeval/releases/download/${KUBEVAL_VERSION}/kubeval-linux-amd64.tar.gz | tar xzC /usr/local/bin/ kubeval

# give execution permission
RUN chmod +x \
  /usr/local/bin/kubectl \
  /usr/local/bin/kustomize \
  /usr/local/bin/kube-score \
  /usr/local/bin/kubeval
