{{/*
Image Url image will be pushed to defaults to internal registry
*/}}
{{- define "image.url" -}}
{{- with .Values.image }}
{{- if eq .registry "Quay" }}
{{- printf "%s/%s/%s-%s" .host .organization $.Values.app.namespace .name }}
{{- else }}
{{- printf "%s/%s/%s" .host $.Values.app.namespace .name }}
{{- end }}
{{- end }}
{{- end }}
