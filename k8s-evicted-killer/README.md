`k8s-evicted-killer`
====================

Deploy it using following Kubernetes manifest (here in the `default` namespace):

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  namespace: default
  name: evicted-killer
rules:
- apiGroups:
  - ""
  resources:
  - pods
  verbs:
  - list
  - delete
  - deletecollection
---
apiVersion: v1
kind: ServiceAccount
metadata:
  namespace: default
  name: evicted-killer
---
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  namespace: default
  name: evicted-killer
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: Role
  name: evicted-killer
subjects:
- kind: ServiceAccount
  name: evicted-killer
---
apiVersion: batch/v1beta1
kind: CronJob
metadata:
  namespace: default
  name: evicted-killer
spec:
  schedule: "*/1 * * * *"
  concurrencyPolicy: Replace
  successfulJobsHistoryLimit: 1
  failedJobsHistoryLimit: 3
  jobTemplate:
    spec:
      template:
        spec:
          serviceAccountName: evicted-killer
          containers:
          - name: evicted-killer
            image: ludovicm67/k8s-evicted-killer
            imagePullPolicy: Always
          restartPolicy: OnFailure
```
