{{/* vim: set filetype=mustache: */}}

{{- define "image-env.tpl" }}
{{- range .Values.image.env }}
- name: {{ .name }}
{{- if .value }}
  value: {{ .value | quote }}
{{- else if .config }}
  valueFrom:
    configMapKeyRef:
      name: {{ $.Release.Name }}-configmap
      key: {{ .config | quote }} 
{{- else if .secret }}
  valueFrom:
    secretKeyRef:
      name: {{ $.Release.Name }}-secret
      key: {{ .secret | quote }} 
{{- else if .service }}
  value: "{{ print $.Release.Name "-" .service }}"
{{- end }}
{{- end }}    
{{- end }}