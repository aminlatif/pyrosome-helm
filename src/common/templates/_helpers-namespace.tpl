{{/* vim: set filetype=mustache: */}}

{{/* 
Namesapce 
*/}}
{{- define "namespace.tpl" }}
{{- print .Release.Name "-dev" }}
{{- end }}