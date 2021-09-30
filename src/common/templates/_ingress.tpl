{{/* vim: set filetype=mustache: */}}

{{- define "ingress.tpl" -}}
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: {{ template "fullname.tpl" . }}
  namespace: {{ include "namespace.tpl" . }}
  {{- include "labels.tpl" . | indent 2 }}
spec:
  rules:
    - host: {{ print .Values.ingress.subdomain "." .Values.global.ingress.urlBase }}
      http:
        paths:
          - path: {{ .Values.ingress.path }}
            pathType: {{ .Values.ingress.pathType }}
            backend:
              service:
                name: {{ template "fullname.tpl" . }}
                port:
                  number: {{ .Values.service.port }}
{{- end -}}