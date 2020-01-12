#!/bin/sh

echo "Ready to kill Evicted pods…"

set -x
kubectl get pods -o json \
  | jq '.items[] | select(.status.reason!=null) | select(.status.reason |
  contains("Evicted")) | "kubectl delete pods \(.metadata.name)"' \
  | xargs -n 1 sh -c

exit 0

