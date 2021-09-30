{{/* vim: set filetype=mustache: */}}

{{- define "service.tpl" -}}
apiVersion: v1
kind: Service
metadata:
  name: {{ template "fullname.tpl" . }}
  namespace: {{ include "namespace.tpl" . }}
  {{- include "labels.tpl" . | indent 2 }}
spec:
  type: {{ .Values.service.type }}
  ports:
    - port: {{ .Values.service.port }}
      targetPort: {{ .Values.image.containerPort }}
      protocol: TCP
      name: http
  selector:
    app: {{ template "name.tpl" . }}
    release: {{ .Release.Name }}
{{- end -}}