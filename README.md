# Tottori Gavà — tottorigava.com

Web del restaurante japonés **Tottori** (Calle Sant Pere 37, Gavà, Barcelona).
Sitio estático, sin dependencias ni compilación: HTML, CSS e imágenes servidos tal cual
desde **GitHub Pages** en <https://tottorigava.com>.

## Páginas

| Fichero           | URL                  | Contenido                                            |
|-------------------|----------------------|------------------------------------------------------|
| `index.html`      | `/`                  | Portada: restaurante, galería, horarios y contacto    |
| `carta.html`      | `/carta.html`        | Carta completa con fotos y precios                    |
| `menu.html`       | `/menu.html`         | Menú del día                                          |
| `avisolegal.html` | `/avisolegal.html`   | Aviso legal y protección de datos (`noindex`)         |
| `404.html`        | —                    | Página de error, la sirve GitHub Pages automáticamente |

## Estructura

```
.
├── index.html, carta.html, menu.html, avisolegal.html, 404.html
├── img/            logotipos (y img/sm/ versiones pequeñas para móvil)
├── principal/      fotos de la portada
├── imgcarta/       fotos de los platos de la carta
├── imgmenu/        fotos del menú del día
├── carta_tottori.pdf   carta descargable
├── favicon.svg, apple-touch-icon.png, og-image.jpg
├── CNAME           dominio del sitio (lo lee GitHub Pages)
├── .nojekyll       sirve los ficheros tal cual, sin procesarlos con Jekyll
├── robots.txt, sitemap.xml
├── cambiar-dominio.sh  cambia el dominio en todas las URLs absolutas
└── subir_a_github.sh   sube los cambios a GitHub (y publica en Pages)
```

Todos los enlaces internos son **relativos**, así que la web también funciona
abriéndola desde el disco o en un subdirectorio.

## Publicar los cambios

```bash
bash subir_a_github.sh
```

Pregunta el repositorio, hace el commit a tu nombre, lo sube y, la primera vez,
ofrece activar GitHub Pages. La web tarda 1-2 minutos en actualizarse.

## Configuración del dominio

En **Settings → Pages** del repositorio, *Custom domain* debe ser `tottorigava.com`
(es lo que contiene el fichero `CNAME`), con *Enforce HTTPS* activado.

En el panel DNS del dominio:

| Tipo  | Nombre | Valor                   |
|-------|--------|--------------------------|
| A     | `@`    | `185.199.108.153`        |
| A     | `@`    | `185.199.109.153`        |
| A     | `@`    | `185.199.110.153`        |
| A     | `@`    | `185.199.111.153`        |
| CNAME | `www`  | `<usuario>.github.io.`   |

El certificado HTTPS puede tardar hasta 24 h en emitirse la primera vez.

## Cambiar de dominio

```bash
./cambiar-dominio.sh midominio.com
```

Actualiza las URLs absolutas (`canonical`, `og:url`, datos estructurados,
`robots.txt`, `sitemap.xml`) y el fichero `CNAME`. El dominio que aparece en el
**texto** del aviso legal hay que revisarlo a mano.

## Mantenimiento

- **Precios y platos**: `carta.html`. Los precios están además en los datos
  estructurados (`application/ld+json`) al final del fichero; conviene actualizar ambos.
- **Horarios**: en `index.html`, en el texto y en `openingHoursSpecification` del JSON-LD.
- **Imágenes**: en formato AVIF. Las de `img/sm/` son las que se cargan en móvil.
- **Sitemap**: al cambiar una página, actualiza su `<lastmod>` en `sitemap.xml`.

## Licencia

Contenido, imágenes y marca © H&J SUSHI YA S.L. Todos los derechos reservados.
