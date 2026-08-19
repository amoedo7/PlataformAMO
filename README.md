# PlataformAMO

**Espacio de trabajo de DesarrollAMO y distribución oficial para StoreAMO.**

Este repositorio comienza a consolidar la distribución Android de PlataformAMO sin reemplazar todavía la aplicación web oficial.

## Estado

- Web oficial: `https://plataforma.desarrollamo.com.ar`
- Android: canal **alpha/candidate**
- StoreAMO: registrado mediante `storeamo.json`
- Package alpha: `com.desarrollamo.plataformamo.dev`
- La identidad de firma alpha está separada deliberadamente de la futura firma estable.

## Cliente Android

El APK es un cliente Android deliberadamente pequeño para la web oficial. Usa HTTPS, deshabilita acceso local de archivos del WebView y abre navegación externa fuera de los hosts de PlataformAMO/Supabase en el navegador del sistema.

Incluye selector de archivos para que los flujos web que necesiten adjuntos puedan utilizar el picker normal de Android.

## StoreAMO

`storeamo.json` declara la aplicación como `audience: team`, de modo que StoreAMO pueda mostrarla dentro de **Equipo DesarrollAMO** y descubrir nuevas prereleases sin cambiar el código de la tienda.

El flujo previsto es:

```text
repo PlataformAMO
→ GitHub prerelease
→ StoreAMO-Catalog
→ StoreAMO
→ Obtener / Actualizar
```

## Release alpha

El workflow `release-alpha` compila y publica un APK universal con SHA-256. Las siguientes alphas usan la misma identidad de desarrollo y un `versionCode` creciente para permitir actualización sobre la instalación anterior.

> Antes de declarar una versión estable habrá que sustituir la identidad de desarrollo por una clave privada de producción guardada fuera del repositorio.
