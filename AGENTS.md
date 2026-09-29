# Guía de trabajo del proyecto

## Contexto y comunicación

Web personal de Arturo Martín Burgos. Hablar con el usuario en español y explicar los resultados brevemente. Aplicar las peticiones de contenido con cambios pequeños, sin rediseños ni migraciones no solicitadas. Las instrucciones actuales del usuario prevalecen sobre esta guía.

### Consultas y decisiones

El usuario ha pedido expresamente que no se tomen decisiones importantes sin consultarle y que se consulte siempre cualquier duda. Esta preferencia se mantiene en futuras sesiones. Ante una ambigüedad, información insuficiente o alternativas cuyo resultado pueda variar, preguntar antes de actuar sobre la parte afectada; no resolver la duda mediante suposiciones. Consultar antes de decidir cambios importantes de contenido, diseño, estructura, alcance, dependencias, alojamiento o configuración, así como eliminaciones o acciones difíciles de revertir. Mientras se espera respuesta, se puede revisar información y avanzar en trabajo independiente ya acordado.

La subida automática sigue autorizada para cambios solicitados, completados y comprobados: no requiere una nueva confirmación por sí misma. Esa autorización no permite tomar decisiones importantes ni resolver dudas sin consultar. Si queda una duda pendiente sobre un cambio, resolverla con el usuario antes de implementarlo o subirlo.

## Arquitectura y estructura

Sitio estático de HTML, CSS y JavaScript, basado en Helios de HTML5 UP. No hay package.json, gestor de dependencias, compilación, backend propio ni suite de pruebas. Los archivos del repositorio son los que se sirven. `.nojekyll` evita el procesamiento de Jekyll.

- `index.html`: portada con noticias y contenido destacado; no se genera desde `noticias/`.
- `bio/index.html`: biografía, retrato y enlace al CV.
- `bio/cv-arturo-martin-burgos.pdf`: CV que enlaza actualmente la biografía.
- `bio/images/`: imágenes de biografía; `bio/cv-2021-breve.pdf` es un documento anterior.
- `pintura/index.html` y demás HTML de `pintura/`: galerías por series, con imágenes en `pintura/images/`.
- `escena/index.html`: trabajos de escenografía, con recursos propios en `escena/`.
- `noticias/`: noticias, premio MAX, archivo y páginas antiguas de prensa; incluye imágenes y vídeos locales.
- `cursos/`: contenido de cursos, dibujo y materiales descargables. Sigue accesible por URL aunque no figure en el menú.
- `contacta/index.html`, `contacta/gracias.html`: contacto y agradecimiento.
- `images/`: recursos generales; `pdf/`: documentos históricos. Hay otros archivos llamados CV que no son el enlazado desde la biografía.
- `css/helios.css`: estilos principales, adaptación a pantallas y fuente externa Source Sans Pro.
- `main.css`, `css/skel.css`: estilos adicionales/heredados; comprobar referencias antes de modificarlos o eliminarlos.
- `js/main.js`: comportamiento Helios, navegación móvil y carruseles. Usa jQuery y los auxiliares de `js/`; evitar editar bibliotecas minificadas.
- `legal.html`, `gracias_2.html`: páginas heredadas.
- `README.md`: descripción breve. `TODO.md`: historial de tareas de 2019–2020, no instrucciones actuales ni lista de trabajo autorizada.

## Edición de contenido

El menú `<nav id="nav">`, la cabecera y el pie están duplicados en los HTML: no hay plantillas compartidas. Para cambios globales, buscar todas las apariciones con `rg` y modificar las páginas correspondientes. La navegación móvil se genera desde `#nav` mediante `navList()` en `js/main.js`.

Mantener UTF-8, acentos, rutas y estilo del archivo. No normalizar todos los finales de línea: algunos JavaScript usan CRLF. Muchos enlaces empiezan por `/`; servir la raíz del repositorio para probarlos. Conservar los avisos de licencia de HTML5 UP.

Decisiones actuales del usuario (septiembre de 2026):

- El menú común de todas las páginas sigue este orden: PINTURA | EXPOSICIONES | ESCENA | BIOGRAFÍA | CONTACTO. EXPOSICIONES enlaza a `/exposiciones/`. Curso no figura en el menú; no borrar `cursos/` ni reactivar el enlace sin petición.
- La biografía presenta primero Pintura y después Escenografía, con sus textos completos.
- El CV publicado en `bio/cv-arturo-martin-burgos.pdf` es el archivo proporcionado como «CV Pintura_Teatro 2026.pdf». Para próximas sustituciones, conservar esta URL salvo petición contraria y comprobar que la copia coincide con el archivo recibido. No depender de la ruta original del escritorio.

## Comprobación

Antes de editar, revisar `git status` y los cambios existentes; conservar trabajo ajeno. Después, revisar el diff y ejecutar `git diff --check`. Comprobar enlaces y recursos afectados, y buscar todas las apariciones si se cambia contenido repetido.

Para vista previa, usar un servidor HTTP estático desde la raíz (por ejemplo, `python3 -m http.server 8000 --bind 127.0.0.1` si Python está disponible). No hace falta instalar Node ni un framework. Para cambios visuales, revisar escritorio y móvil, especialmente el menú generado. No crear una suite de pruebas para cambios simples de texto o archivos PDF.

## Git y publicación

### Subida automática autorizada

El usuario ha indicado expresamente que cada cambio exitoso se suba automáticamente al repositorio. Esta preferencia se mantiene en futuras sesiones: al completar y comprobar cada cambio solicitado, crear un commit descriptivo y hacer push a `origin master` sin pedir confirmación adicional. Incluye cambios de documentación como este archivo. No dejar cambios terminados solo en local salvo que el usuario lo pida o exista un bloqueo real; en ese caso, explicar qué queda pendiente. No subir trabajo incompleto, comprobaciones fallidas ni cambios ajenos a la tarea. Esta autorización no incluye forzar pushes ni cambiar DNS o alojamiento.

- Remoto `origin`: `git@github.com:alexfernandez/arturomartinburgos.com.git`.
- Rama utilizada: `master`.
- SSH se verificó con la clave local existente y GitHub reconoció la cuenta `arturomartin-boot`. La identidad de GitHub se guardó en `~/.ssh/known_hosts`. No mostrar ni copiar claves privadas, ni desactivar la verificación del servidor.
- En este Mac, `/usr/bin/git` falla porque faltan las herramientas de desarrollo de Xcode. Funciona el Git incluido en GitHub Desktop:

```bash
export GIT_EXEC_PATH='/Applications/GitHub Desktop.app/Contents/Resources/app/git/libexec/git-core'
export GIT_SSH_COMMAND='ssh -o BatchMode=yes -o StrictHostKeyChecking=yes -o UpdateHostKeys=no'
GIT_BIN='/Applications/GitHub Desktop.app/Contents/Resources/app/git/bin/git'
"$GIT_BIN" status --short --branch
```

Estas rutas son específicas de este equipo; usar Git normal si está disponible en otro entorno. `UpdateHostKeys=no` evita que SSH intente crear archivos temporales fuera del espacio permitido, manteniendo la verificación estricta. Solicitar permisos de red o archivos solo cuando el entorno los requiera.

Para publicar cambios autorizados: revisar el diff, añadir únicamente los archivos afectados, crear un commit descriptivo y hacer push a `origin master`. No forzar el push. Si el remoto ha avanzado, inspeccionar e integrar los cambios antes de reintentar. No inventar nombre o correo del usuario: los commits de esta sesión usaron la identidad automática local de Git.

GitHub ejecuta «pages build and deployment» tras el push, aunque no hay workflows versionados en `.github/`. Comprobar que la ejecución corresponde al SHA enviado y termina con `success`.

### Diferencia entre despliegue y dominio público

El archivo `CNAME` contiene **arturo.pinchito.es**. Al revisar el 27/09/2026, `https://arturomartinburgos.com/bio/` redirigía a `https://www.arturomartinburgos.com/bio/`, cuyo servidor respondía como **aruba-proxy**. El dominio principal seguía mostrando contenido anterior tras un despliegue exitoso de Pages.

No asumir que un push actualiza el dominio principal, ni atribuirlo automáticamente a caché. Verificar el contenido público concreto; si no coincide, investigar la relación entre GitHub Pages, el dominio configurado y Aruba. No cambiar DNS, CNAME ni alojamiento sin una petición que lo autorice. Informar por separado de commit/push, estado de Pages y comprobación del dominio público.

## Elementos heredados a tener presentes

El formulario de contacto envía a `http://forms.melodysoft.com` y configura una redirección a `/gracias.html`, distinta de `contacta/gracias.html`. No se ha verificado su funcionamiento; no enviar formularios reales como prueba sin autorización. Hay Google Fonts, vídeos de YouTube y un contador de librecounter.org como dependencias externas. No limpiar archivos históricos ni corregir enlaces ajenos a la tarea sin necesidad.
