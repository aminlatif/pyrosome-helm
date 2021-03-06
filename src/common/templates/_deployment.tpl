{{/* vim: set filetype=mustache: */}}

{{- define "deployment.tpl" -}}
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ template "fullname.tpl" . }}
  namespace: {{ include "namespace.tpl" . }}
  {{- include "labels.tpl" . | indent 2 }}
spec:
  replicas: {{ .Values.replicaCount }}
  selector:
    matchLabels:
      app: {{ template "name.tpl" . }}
      release: {{ .Release.Name }}
  template:
    metadata:
      labels:
        app: {{ template "name.tpl" . }}
        release: {{ .Release.Name }}
    spec:
      containers:
        - name: {{ .Chart.Name }}
          image: "{{ .Values.image.repository }}:{{ .Values.image.tag }}"
          imagePullPolicy: {{ .Values.image.pullPolicy }}
          env:
{{- include "image-env.tpl" . | indent 12 }}
          ports:
            - name: http
              containerPort: {{ .Values.image.containerPort }}
              protocol: TCP
          resources:
{{ toYaml .Values.resources | indent 12 }}
    {{- with .Values.nodeSelector }}
      nodeSelector:
{{ toYaml . | indent 8 }}
    {{- end }}
    {{- with .Values.affinity }}
      affinity:
{{ toYaml . | indent 8 }}
    {{- end }}
    {{- with .Values.tolerations }}
      tolerations:
{{ toYaml . | indent 8 }}
    {{- end }}
{{- end -}}