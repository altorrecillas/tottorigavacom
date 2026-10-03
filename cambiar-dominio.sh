#!/bin/bash
# Cambia el dominio en todas las URLs absolutas de la web (canonical, og:url,
# datos estructurados, robots.txt y sitemap.xml).
#
# Uso:  ./cambiar-dominio.sh <nuevo> [actual]
# Ej.:  ./cambiar-dominio.sh tottorigava.es            # volver al .es
#       ./cambiar-dominio.sh midominio.com tottorigava.com
#
# Por defecto NO hace nada útil: hay que indicar el dominio nuevo.
set -euo pipefail
ACTUAL="${2:-tottorigava.com}"      # el dominio que usa la web ahora mismo
NUEVO="${1:-}"
[ -n "$NUEVO" ] || { echo "Uso: $0 <dominio-nuevo> [dominio-actual]   (actual: $ACTUAL)"; exit 1; }
[ "$NUEVO" != "$ACTUAL" ] || { echo "El dominio nuevo y el actual son el mismo: $NUEVO"; exit 1; }
cd "$(dirname "$0")"

FICHEROS=(index.html carta.html menu.html avisolegal.html 404.html robots.txt sitemap.xml)

echo "Cambiando $ACTUAL -> $NUEVO"
sed -i "s|https://$ACTUAL|https://$NUEVO|g" "${FICHEROS[@]}"

# GitHub Pages usa el fichero CNAME para saber el dominio del sitio
[ -f CNAME ] && printf '%s\n' "$NUEVO" > CNAME && echo "CNAME actualizado a $NUEVO"

echo "Hecho. Comprobación:"
grep -ho "https://[A-Za-z0-9.-]*\(tottorigava\|$NUEVO\)[A-Za-z0-9.-]*" "${FICHEROS[@]}" | sort | uniq -c || true
echo
echo "Recuerda:"
echo "  · Revisa el dominio que aparece en el TEXTO del aviso legal (avisolegal.html)."
echo "  · En GitHub: Settings → Pages → Custom domain debe coincidir con $NUEVO."
echo "  · Los DNS del dominio deben apuntar a GitHub Pages."
