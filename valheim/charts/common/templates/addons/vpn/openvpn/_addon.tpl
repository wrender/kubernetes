{{/*
Template to render OpenVPN addon. It will add the container to the list of additionalContainers
and add a credentials secret if speciffied.
*/}}
{{- define "common.addon.openvpn" -}}
  {{/* Append the openVPN container to the additionalContainers */}}
  {{- $container := include "common.addon.openvpn.container" . | fromYaml -}}
  {{- if $container -}}
    {{- $_ := set .Values.additionalContainers "addon-openvpn" $container -}}
  {{- end -}}

  {{/* Include the secret if not empty */}}
  {{- $secret := include "common.addon.openvpn.secret" . -}}
  {{- if $secret -}}
    {{- $secret | nindent 0 -}}
  {{- end -}}
{{- end -}}
