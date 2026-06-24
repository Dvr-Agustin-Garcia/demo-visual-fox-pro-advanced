# Memoria Operativa Visual FoxPro Advanced 9 para DemoFoxPro

## Objetivo

Esta memoria concentra lo aprendido y validado durante la construcción del demo `DemoFoxPro`. Debe leerse antes de responder tareas sobre Visual FoxPro o Visual FoxPro Advanced en este workspace.

## Protocolo obligatorio de uso

1. Leer este archivo antes de responder o editar algo relacionado con VFP o VFPA.
2. Usarlo como contexto prioritario para sintaxis, flujo de proyecto, estilo visual y debugging ya validados.
3. Si durante la tarea se confirma una nueva regla de sintaxis, una limitación del runtime, una convención del repo o una fuente documental útil, actualizar este archivo antes de cerrar la respuesta.
4. Mantener el contenido breve, concreto y verificable. No guardar especulación.

## Cómo consultar documentación

- Para sintaxis base de VFP 9, priorizar la ayuda oficial publicada en `https://www.vfphelp.com/help/`.
- Para comportamiento específico de VFPA, priorizar `https://www.baiyujia.com/vfpdocuments/default.asp` y `https://www.baiyujia.com/vfpadvanced/f_vfpa_about.asp`.
- Para referencias históricas o de compatibilidad, usar Microsoft Learn archivado solo como apoyo secundario.
- Para comunidad y casos prácticos, usar VFPX y Comunidad VFP en Español.
- Para leer documentación, preferir lectura textual o fetch de páginas. No usar Playwright o browser salvo que el contenido no sea legible de otra forma.
- Cuando exista duda sobre una propiedad, comando o sintaxis exacta, verificar primero en documentación antes de asumir comportamiento.

## Hechos del proyecto DemoFoxPro

- El repo es un demo text-first basado en `.prg`; no se versionan formularios binarios `.scx` ni la lógica principal dentro de archivos visuales.
- El flujo de arranque principal está en `main.prg`.
- La preparación de datos está en `app/setup.prg`.
- El formulario demo está en `forms/demo_clientes.prg`.
- El proyecto FoxPro `DemoFoxPro.pjx/.pjt` se genera o recompila desde `crear_proyecto.prg`.
- La tabla de demo es una free table `data/clientes.dbf`, no una base `.dbc`.
- La guía de instalación está en `docs/guia-instalacion-vfpa.md`.
- El flujo recomendado para el usuario es primero `DO "C:\Work\Optimi\DemoFoxPro\crear_proyecto.prg"` y luego `DO main.prg`.

## Lecciones de sintaxis y runtime ya validadas

- Evitar depender de `CD TO` para arrancar el demo. Es más robusto usar rutas absolutas y `SET DEFAULT TO` desde `main.prg`.
- `CREATE TABLE` en VFP es sensible a la sintaxis exacta. Para definiciones largas conviene usar continuación con `;`.
- `Grid.AllowDelete` no es una propiedad válida del control `Grid`; ese nombre aparece en otros contextos como `CursorAdapter`.
- Los controles creados dinámicamente con `AddObject()` no deben asumirse visibles. En este demo se confirmó que hace falta asignar `.Visible = .T.` explícitamente.
- `ZAP` requiere abrir la tabla en modo exclusivo. Si el alias compartido sigue abierto, aparece `File must be opened exclusively`.
- La recarga de datos demo debe cerrar el alias `clientes`, abrir `clientes.dbf` de forma exclusiva en un alias temporal, hacer `ZAP`, reinsertar datos y reabrir la tabla para la UI.
- El borrado implementado en el demo es lógico con `DELETE`; no hace `PACK` automático.
- Para calcular el próximo ID conviene ignorar registros borrados lógicamente con `WHERE !DELETED()` y usar `NVL()` sobre el resultado de `MAX(id)`.

## Convenciones visuales aprendidas en este demo

- Si se crean controles en runtime, definir explícitamente `Left`, `Top`, `Width`, `Height` y `Visible`.
- Para títulos y subtítulos, dar altura explícita al `Label` si se aumenta `FontSize`; si no, el texto puede solaparse con el control siguiente.
- El espaciado vertical entre título, subtítulo, botones y grilla debe ajustarse manualmente. No confiar en autosizing.
- En este demo se usa `Segoe UI`, fondo claro y cabeceras sobrias para una UI simple de legacy modernizado.
- La grilla está pensada para visualización, no para edición directa: `ReadOnly = .T.`, `DeleteMark = .F.`, `RecordMark = .F.`.

## Forma de trabajar esperada para este repo

- Responder siempre en español.
- Guiar paso a paso, pensando en un usuario que puede estar empezando con FoxPro.
- Hacer cambios pequeños, verificables y con impacto local antes de expandir el alcance.
- Cuando aparezca un error del runtime, buscar la causa real en sintaxis, alias, modo de apertura de tabla, propiedades válidas o diferencias entre diseño y creación dinámica.
- No introducir complejidad innecesaria ni migraciones grandes si el objetivo inmediato es un demo funcional.

## Mantenimiento

- Actualizar esta memoria cuando cambie el flujo del proyecto, se valide una nueva sintaxis o se descubra otro comportamiento relevante de VFP o VFPA.
- Si una regla deja de ser válida, corregirla o eliminarla en lugar de acumular notas contradictorias.