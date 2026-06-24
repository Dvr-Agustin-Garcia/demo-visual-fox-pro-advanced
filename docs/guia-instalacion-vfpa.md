# Guía breve de instalación de Visual FoxPro Advanced 10 x64

## Objetivo

Este documento deja una referencia corta para instalar y verificar **Visual FoxPro Advanced 10 x64** en un entorno Windows, tomando como base el flujo mostrado en este video:

- Video de referencia: https://www.youtube.com/watch?v=TJ20om32m4U

Tambien se apoya en la documentación oficial de VFP Advanced:

- https://www.baiyujia.com/vfpadvanced/f_vfpa_about.asp
- https://www.baiyujia.com/vfpdocuments/default.asp

## Alcance de esta guía

Esta guía cubre solo la instalación y validación inicial del entorno.

No incluye todavía:

- creación del proyecto demo
- formularios
- tablas DBF
- compilación a EXE o APP

## Requisitos previos

Antes de instalar VFPA, conviene confirmar lo siguiente:

1. Windows de 64 bits.
2. Licencia válida de Microsoft Visual FoxPro 9.0 instalada en el equipo.
3. Paquete de Visual FoxPro Advanced 10 x64 descargado.
4. Permisos para descomprimir y ejecutar herramientas de desarrollo.
5. Microsoft Visual C++ Runtime requerido por VFPA disponible en el sistema.

## Punto importante sobre licenciamiento

Visual FoxPro Advanced **no reemplaza** la licencia original de Visual FoxPro 9.0.

VFPA es un add-on compatible con VFP 9 SP2. Para usarlo correctamente, se recomienda tener una instalación legal de VFP 9 ya presente en la máquina.

## Instalación recomendada

### 1. Preparar una carpeta de trabajo

Crear una carpeta estable para la herramienta, por ejemplo:

```text
C:\Herramientas\VFPA10x64
```

Evitar carpetas temporales o rutas que luego cambien.

### 2. Descomprimir el paquete de VFPA

Extraer el contenido descargado dentro de la carpeta elegida.

Lo esperable es encontrar el ejecutable principal de VFPA y sus binarios asociados.

### 3. Revisar dependencias del runtime

Según la documentación oficial, VFP Advanced usa el runtime de Visual C++ 10.0.

Si al abrir VFPA falta alguna DLL o el ejecutable no inicia, revisar primero la instalación del runtime de Visual C++ correspondiente.

### 4. Ejecutar VFPA por primera vez

Abrir `VFPA.EXE` desde la carpeta de instalación.

En una instalación correcta, el IDE debe abrir mostrando una ventana similar a Visual FoxPro clásico, pero identificándose como **Visual FoxPro Advanced**.

### 5. Crear un acceso directo opcional

Para facilitar el uso diario:

1. Crear un acceso directo a `VFPA.EXE`.
2. Dejarlo en el escritorio o en una carpeta de herramientas.
3. Si el cliente trabaja con varios proyectos legacy, usar siempre la misma instalación base para evitar diferencias entre entornos.

## Verificación mínima después de instalar

Una vez abierto VFPA, validar el entorno desde la Command Window.

### Comando 1: versión

```foxpro
? VERSION()
```

Resultado esperado: una salida que identifique el entorno como **Visual FoxPro 10.0**.

### Comando 2: arquitectura

```foxpro
? SYS(17)
```

En VFPA x64, el resultado esperado debe indicar arquitectura x64 o equivalente.

### Comando 3: bandera de 64 bits

```foxpro
? _WIN64
```

Resultado esperado:

```foxpro
.T.
```

### Comando 4: caption del entorno

```foxpro
? _SCREEN.Caption
```

Resultado esperado: una cadena que haga referencia a **Microsoft Visual FoxPro Advanced (x64)** o similar.

## Qué validar visualmente

Además de los comandos anteriores, conviene revisar:

- que la Command Window funcione
- que se pueda abrir el menú de proyectos
- que no aparezcan errores al inicio
- que el IDE no cierre inesperadamente

## Diferencia práctica entre 32 y 64 bits

Para esta demo estás usando la edición x64, lo cual sirve para mostrar una versión moderna del entorno y sus mejoras de memoria.

Hay que tener presente una limitación importante:

- **VFPA 64-bit no puede cargar DLL o ActiveX de 32 bits**.

Si más adelante el cliente tiene componentes COM, OCX o DLL antiguos, puede ser necesario probar también una instalación VFPA de 32 bits para compatibilidad con ciertos legados.

## Problemas comunes

### El IDE no abre

Revisar:

1. Que el paquete haya sido descomprimido completo.
2. Que no falten runtimes de Visual C++.
3. Que Windows no haya bloqueado archivos descargados.

### Abre, pero el entorno se comporta raro

Revisar:

1. Si se mezclaron archivos de distintas versiones.
2. Si el cliente está reutilizando librerías o componentes externos no compatibles con x64.
3. Si conviene probar el mismo flujo en una carpeta limpia.

### Hay dependencias legacy que no cargan

Ese escenario suele apuntar a una incompatibilidad de arquitectura:

- componente externo de 32 bits
- VFPA ejecutándose en 64 bits

En ese caso, la prueba correcta es comparar contra una instalación VFPA 32-bit.

## Recomendación para la siguiente etapa

Una vez validada la instalación, el siguiente paso es crear un proyecto demo mínimo con:

1. un `main.prg`
2. un formulario simple
3. una tabla DBF pequeña
4. una rutina de arranque para mostrar que Copilot puede acompañar también sobre código VFP legacy

## Estado actual

En este equipo, esta guía asume que **VFPA 10 x64 ya está instalado y funcional**. Por eso el foco queda en:

- dejar la referencia documentada
- verificar que el entorno abre correctamente
- preparar el terreno para construir luego el proyecto demo paso a paso