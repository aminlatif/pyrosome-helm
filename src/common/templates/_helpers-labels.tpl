{{/* vim: set filetype=mustache: */}}

{{/* 
Generate basic labels 
*/}}
{{- define "labels.tpl" }}
labels:
  app: {{ template "name.tpl" . }}
  version: {{ .Chart.Version }}
  chart: {{ template "chart.tpl" . }}
  release: {{ .Release.Name }}
  heritage: {{ .Release.Service }}
{{- end }}