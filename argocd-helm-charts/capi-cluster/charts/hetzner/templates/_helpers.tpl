{{/* TODO : Enforce mutual exclusions. */}}
{{- define "controlPlaneHost" -}}
{{- if (.Values.hcloud).controlPlane }}
{{ .Values.hcloud.controlPlane.endpoint.host }}
{{- else }}
{{ .Values.robot.controlPlane.endpoint.host }}
{{- end }}
{{- end }}
