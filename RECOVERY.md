# Recuperación de PlataformAMO

Este procedimiento cubre únicamente la recuperación reversible del repositorio `amoedo7/PlataformAMO` y su cliente Android alpha. No concede autoridad para promover builds, cambiar firma, publicar en StoreAMO ni declarar recuperada la web oficial.

## Alcance

- restaurar código, contrato y configuración versionada desde Git;
- reconstruir el cliente Android alpha mediante los checks declarados;
- verificar que la identidad alpha y `storeamo.json` siguen siendo coherentes;
- documentar cualquier dependencia externa que no pueda comprobarse.

## Procedimiento

1. Partir de un commit o tag conocido y conservar el SHA como evidencia.
2. Restaurar en una rama nueva; no sobrescribir `main` ni ramas/PRs activos.
3. Revisar `.amo`, `storeamo.json`, `app/`, `.github/workflows/` y `scripts/autocheck.sh` antes de ejecutar cambios.
4. Ejecutar `bash scripts/autocheck.sh` y los gates de CI aplicables.
5. Si el cambio afecta distribución, firma, publicación o identidad estable, detener la recuperación local y exigir los gates externos correspondientes.
6. Integrar sólo con evidencia PASS del AutoCheck/CI. `UNKNOWN`, `SKIPPED` o un fallo de runner no equivalen a PASS.

## Rollback

Si la recuperación introduce una regresión, revertir el commit o cerrar el PR sin fusionar. No reescribir historial compartido ni borrar evidencia.

## Límites de autoridad

- La web oficial sigue siendo una fuente operativa separada y no se considera recuperada por restaurar este repositorio.
- La identidad alpha no puede convertirse en identidad estable por una recuperación.
- No agregar, rotar ni reconstruir secretos o material de firma.
- No publicar APKs ni modificar StoreAMO/StoreAMO-Catalog desde este procedimiento.
- No afirmar instalación física sin evidencia de dispositivo.

## Evidencia mínima

Persistir SHA base, rama/PR, salida o URL de los gates ejecutados, resultado final y cualquier estado `UNKNOWN` o bloqueo externo.