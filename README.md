# DemoFoxPro

Proyecto demo minimo en Visual FoxPro Advanced para usar como base de aprendizaje e iteracion.

## Que incluye

- `main.prg`: punto de entrada.
- `forms/menu_principal.prg`: menu principal con accesos visibles a las pantallas del demo.
- `app/setup.prg`: crea la carpeta `data` y la tabla `clientes.dbf` si todavia no existe.
- `forms/demo_clientes.prg`: formulario de clientes con navegacion de vuelta al menu.
- `data/clientes.dbf`: se crea automaticamente en la primera ejecucion.

## Que hace este demo

Al ejecutar el proyecto:

1. prepara la carpeta de datos
2. crea una tabla `clientes.dbf` libre si no existe
3. abre un menu principal con las pantallas disponibles
4. permite entrar a clientes y deja productos visible como proxima pantalla
5. carga datos demo automaticamente si la tabla esta vacia

## Como ejecutarlo si no sabes Visual FoxPro

### Opcion recomendada: crear y abrir el proyecto

1. Abre `VFPA.EXE`.
2. Cuando aparezca el IDE, ubica la ventana **Command Window**.
3. Ejecuta este comando para generar o actualizar el proyecto `.pjx` y abrir el Project Manager:

```foxpro
DO "C:\Work\Optimi\DemoFoxPro\crear_proyecto.prg"
```

Ese paso crea o recompila:

- `DemoFoxPro.pjx`
- `DemoFoxPro.pjt`

### Ejecutar el demo una vez abierto el proyecto

Después de correr `crear_proyecto.prg`, en la misma `Command Window` ejecuta:

```foxpro
DO main.prg
```

Si todo esta bien, se abrira el menu principal del demo y desde ahi podras entrar a clientes.

### Opcion alternativa

Si no quieres abrir el proyecto todavia, puedes ejecutar el demo directo por ruta completa:

```foxpro
DO "C:\Work\Optimi\DemoFoxPro\main.prg"
```

### Volver a compilar si notas errores viejos

Si haces cambios y Visual FoxPro parece seguir usando una version anterior, vuelve a ejecutar:

```foxpro
DO "C:\Work\Optimi\DemoFoxPro\crear_proyecto.prg"
```

Ese script fuerza `RECOMPILE` del proyecto.

Si una ventana ya estaba abierta cuando cambiaste el codigo, cierrala y vuelve a ejecutar `DO main.prg` para cargar la version nueva de los formularios.

### Si la Command Window no esta visible

Normalmente puedes abrirla desde el menu de Visual FoxPro o con la distribucion por defecto del IDE. Si aun asi no aparece, basta con restaurar el layout clasico del entorno.

## Como probar el demo

Al abrir el menu principal veras dos accesos:

- `Clientes`: abre la pantalla operativa actual.
- `Productos`: queda visible como placeholder, pero todavia no hace nada.

Dentro del formulario tienes cinco acciones:

- `Cargar datos demo`: vuelve a generar los registros de ejemplo.
- `Agregar cliente`: inserta un registro nuevo muy simple.
- `Eliminar cliente`: elimina logicamente el registro seleccionado.
- `Refrescar grilla`: vuelve a leer la tabla.
- `Volver al menu`: cierra solo la pantalla de clientes y regresa al menu principal.

## Como seguir iterando despues

Las siguientes mejoras naturales son:

1. reemplazar los botones basicos por altas y edicion reales
2. agregar una segunda tabla, por ejemplo `pedidos.dbf`
3. separar la logica de datos en otro PRG
4. pasar de tabla libre a base de datos `.dbc`

## Nota practica

Este demo esta armado en archivos de texto `.prg` para que sea facil versionarlo y editarlo. Es una base comoda para aprender antes de pasar a formularios `.scx` o proyectos `.pjx`.
