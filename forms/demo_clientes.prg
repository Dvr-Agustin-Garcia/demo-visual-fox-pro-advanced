DEFINE CLASS frmDemoClientes AS Form
    Caption = 'DemoFoxPro | Clientes'
    Width = 980
    Height = 620
    AutoCenter = .T.
    Closable = .T.
    MaxButton = .F.
    MinButton = .F.
    cDataPath = ''
    cTablePath = ''

    PROCEDURE Init(tcDataPath)
        THIS.cDataPath = tcDataPath
        THIS.cTablePath = ADDBS(tcDataPath) + 'clientes.dbf'

        THIS.abrir_tabla()
        THIS.configurar_interfaz()

        IF RECCOUNT('clientes') = 0
            THIS.recargar_datos_demo(.F.)
        ENDIF
    ENDPROC

    PROCEDURE abrir_tabla
        IF !USED('clientes')
            USE (THIS.cTablePath) SHARED ALIAS clientes IN 0
        ENDIF
        SELECT clientes
        GO TOP
    ENDPROC

    PROCEDURE configurar_interfaz
        THIS.BackColor = RGB(241, 245, 249)

        THIS.AddObject('shpHeader', 'Shape')
        WITH THIS.shpHeader
            .Left = 20
            .Top = 20
            .Width = 940
            .Height = 145
            .BackColor = RGB(255, 255, 255)
            .BorderColor = RGB(218, 226, 237)
            .Visible = .T.
        ENDWITH

        THIS.AddObject('shpAcciones', 'Shape')
        WITH THIS.shpAcciones
            .Left = 20
            .Top = 185
            .Width = 940
            .Height = 74
            .BackColor = RGB(255, 255, 255)
            .BorderColor = RGB(218, 226, 237)
            .Visible = .T.
        ENDWITH

        THIS.AddObject('shpGrid', 'Shape')
        WITH THIS.shpGrid
            .Left = 20
            .Top = 278
            .Width = 940
            .Height = 285
            .BackColor = RGB(255, 255, 255)
            .BorderColor = RGB(218, 226, 237)
            .Visible = .T.
        ENDWITH

        THIS.AddObject('lblMarca', 'Label')
        WITH THIS.lblMarca
            .Caption = 'DEMOFOXPRO / CLIENTES'
            .Left = 40
            .Top = 34
            .Width = 220
            .Height = 20
            .FontName = 'Segoe UI'
            .FontSize = 9
            .FontBold = .T.
            .ForeColor = RGB(37, 99, 235)
            .BackStyle = 0
            .Visible = .T.
        ENDWITH

        THIS.AddObject('cmdNavMenu', 'CommandButton')
        WITH THIS.cmdNavMenu
            .Caption = 'Menu principal'
            .Left = 556
            .Top = 30
            .Width = 122
            .Height = 34
            .FontName = 'Segoe UI'
            .FontBold = .T.
            .Style = 0
            .BackColor = RGB(45, 62, 80)
            .ForeColor = RGB(45, 62, 80)
            .Visible = .T.
        ENDWITH
        BINDEVENT(THIS.cmdNavMenu, 'Click', THIS, 'accion_cerrar')

        THIS.AddObject('cmdNavClientes', 'CommandButton')
        WITH THIS.cmdNavClientes
            .Caption = 'Clientes'
            .Left = 692
            .Top = 30
            .Width = 122
            .Height = 34
            .FontName = 'Segoe UI'
            .FontBold = .T.
            .Style = 0
            .BackColor = RGB(37, 99, 235)
            .ForeColor = RGB(45, 62, 80)
            .Visible = .T.
        ENDWITH
        BINDEVENT(THIS.cmdNavClientes, 'Click', THIS, 'accion_actual')

        THIS.AddObject('cmdNavProductos', 'CommandButton')
        WITH THIS.cmdNavProductos
            .Caption = 'Productos'
            .Left = 828
            .Top = 30
            .Width = 122
            .Height = 34
            .FontName = 'Segoe UI'
            .FontBold = .T.
            .Style = 0
            .BackColor = RGB(229, 231, 235)
            .ForeColor = RGB(120, 130, 140)
            .Enabled = .F.
            .Visible = .T.
        ENDWITH

        THIS.AddObject('lblTitulo', 'Label')
        WITH THIS.lblTitulo
            .Caption = 'Gestion simple de clientes'
            .Left = 40
            .Top = 78
            .Width = 380
            .Height = 32
            .FontName = 'Segoe UI'
            .FontSize = 18
            .FontBold = .T.
            .ForeColor = RGB(30, 41, 59)
            .BackStyle = 0
            .Visible = .T.
        ENDWITH

        THIS.AddObject('lblAyuda', 'Label')
        WITH THIS.lblAyuda
            .Caption = 'La tabla se crea sola. Desde aqui puedes cargar datos demo, agregar un cliente, eliminarlo de forma logica y volver al menu principal cuando quieras.'
            .Left = 40
            .Top = 116
            .Width = 610
            .Height = 32
            .FontName = 'Segoe UI'
            .FontSize = 9
            .ForeColor = RGB(71, 85, 105)
            .BackStyle = 0
            .Visible = .T.
        ENDWITH

        THIS.AddObject('lblEstado', 'Label')
        WITH THIS.lblEstado
            .Caption = 'Pantalla actual' + CHR(13) + 'Clientes activo' + CHR(13) + CHR(13) + 'Siguiente' + CHR(13) + 'Productos reservado'
            .Left = 710
            .Top = 88
            .Width = 210
            .Height = 64
            .FontName = 'Segoe UI'
            .FontSize = 9
            .ForeColor = RGB(45, 62, 80)
            .BackStyle = 0
            .Visible = .T.
        ENDWITH

        THIS.AddObject('cmdCargarDemo', 'CommandButton')
        WITH THIS.cmdCargarDemo
            .Caption = 'Cargar datos demo'
            .Left = 40
            .Top = 204
            .Width = 160
            .Height = 36
            .FontName = 'Segoe UI'
            .FontBold = .T.
            .Style = 0
            .BackColor = RGB(37, 99, 235)
            .ForeColor = RGB(45, 62, 80)
            .Visible = .T.
        ENDWITH
        BINDEVENT(THIS.cmdCargarDemo, 'Click', THIS, 'accion_cargar_demo')

        THIS.AddObject('cmdAgregar', 'CommandButton')
        WITH THIS.cmdAgregar
            .Caption = 'Agregar cliente'
            .Left = 214
            .Top = 204
            .Width = 150
            .Height = 36
            .FontName = 'Segoe UI'
            .FontBold = .T.
            .Style = 0
            .BackColor = RGB(14, 116, 144)
            .ForeColor = RGB(45, 62, 80)
            .Visible = .T.
        ENDWITH
        BINDEVENT(THIS.cmdAgregar, 'Click', THIS, 'accion_agregar')

        THIS.AddObject('cmdEliminar', 'CommandButton')
        WITH THIS.cmdEliminar
            .Caption = 'Eliminar cliente'
            .Left = 378
            .Top = 204
            .Width = 150
            .Height = 36
            .FontName = 'Segoe UI'
            .FontBold = .T.
            .Style = 0
            .BackColor = RGB(185, 28, 28)
            .ForeColor = RGB(45, 62, 80)
            .Visible = .T.
        ENDWITH
        BINDEVENT(THIS.cmdEliminar, 'Click', THIS, 'accion_eliminar')

        THIS.AddObject('cmdRefrescar', 'CommandButton')
        WITH THIS.cmdRefrescar
            .Caption = 'Refrescar grilla'
            .Left = 542
            .Top = 204
            .Width = 150
            .Height = 36
            .FontName = 'Segoe UI'
            .FontBold = .T.
            .Style = 0
            .BackColor = RGB(51, 65, 85)
            .ForeColor = RGB(45, 62, 80)
            .Visible = .T.
        ENDWITH
        BINDEVENT(THIS.cmdRefrescar, 'Click', THIS, 'refrescar_grilla')

        THIS.AddObject('cmdCerrar', 'CommandButton')
        WITH THIS.cmdCerrar
            .Caption = 'Volver al menu'
            .Left = 706
            .Top = 204
            .Width = 214
            .Height = 36
            .FontName = 'Segoe UI'
            .FontBold = .T.
            .Style = 0
            .BackColor = RGB(15, 23, 42)
            .ForeColor = RGB(45, 62, 80)
            .Visible = .T.
        ENDWITH
        BINDEVENT(THIS.cmdCerrar, 'Click', THIS, 'accion_cerrar')

        THIS.AddObject('lblGridTitulo', 'Label')
        WITH THIS.lblGridTitulo
            .Caption = 'Listado actual'
            .Left = 40
            .Top = 292
            .Width = 180
            .Height = 22
            .FontName = 'Segoe UI'
            .FontSize = 10
            .FontBold = .T.
            .ForeColor = RGB(45, 62, 80)
            .BackStyle = 0
            .Visible = .T.
        ENDWITH

        THIS.AddObject('grdClientes', 'Grid')
        WITH THIS.grdClientes
            .Left = 40
            .Top = 320
            .Width = 900
            .Height = 220
            .RecordSource = 'clientes'
            .ColumnCount = 5
            .DeleteMark = .F.
            .RecordMark = .F.
            .AllowAddNew = .F.
            .AllowHeaderSizing = .T.
            .ReadOnly = .T.
            .FontName = 'Segoe UI'
            .FontSize = 9
            .HeaderHeight = 24
            .Visible = .T.
        ENDWITH

        THIS.AddObject('lblPie', 'Label')
        WITH THIS.lblPie
            .Caption = 'Navegacion disponible: Menu principal y Clientes. Productos queda visible pero sin comportamiento hasta la siguiente iteracion.'
            .Left = 40
            .Top = 572
            .Width = 760
            .Height = 18
            .FontName = 'Segoe UI'
            .FontSize = 8
            .ForeColor = RGB(100, 116, 139)
            .BackStyle = 0
            .Visible = .T.
        ENDWITH

        THIS.configurar_columnas()
        THIS.refrescar_grilla()
    ENDPROC

    PROCEDURE accion_cargar_demo
        THIS.recargar_datos_demo(.T.)
    ENDPROC

    PROCEDURE accion_agregar
        LOCAL lnNextId

        SELECT clientes
        SELECT MAX(id) AS max_id FROM clientes WHERE !DELETED() INTO CURSOR curMaxId READWRITE
        lnNextId = NVL(curMaxId.max_id, 0) + 1
        USE IN curMaxId
        SELECT clientes

        APPEND BLANK
        REPLACE id WITH lnNextId, ;
                nombre WITH 'Nuevo Cliente ' + TRANSFORM(lnNextId), ;
                ciudad WITH 'Sin definir', ;
                activo WITH .T., ;
                alta WITH DATE()

        THIS.refrescar_grilla()
        MESSAGEBOX('Se agrego un registro simple para seguir probando.', 64, 'DemoFoxPro')
    ENDPROC

    PROCEDURE accion_eliminar
        IF RECCOUNT('clientes') = 0
            MESSAGEBOX('No hay registros para eliminar.', 48, 'DemoFoxPro')
            RETURN
        ENDIF

        IF MESSAGEBOX('Se eliminara el cliente seleccionado.' + CHR(13) + 'Deseas continuar?', 36, 'DemoFoxPro') <> 6
            RETURN
        ENDIF

        SELECT clientes
        DELETE IN clientes

        THIS.refrescar_grilla()
        MESSAGEBOX('El registro quedo marcado como eliminado.', 64, 'DemoFoxPro')
    ENDPROC

    PROCEDURE recargar_datos_demo(tlMostrarMensaje)
        LOCAL llMostrarMensaje

        llMostrarMensaje = IIF(VARTYPE(tlMostrarMensaje) = 'L', tlMostrarMensaje, .T.)

        THIS.grdClientes.RecordSource = ''
        IF USED('clientes')
            USE IN clientes
        ENDIF

        =cargar_clientes_demo(THIS.cTablePath)
        THIS.abrir_tabla()
        THIS.refrescar_grilla()

        IF llMostrarMensaje
            MESSAGEBOX('Se cargaron datos de ejemplo en clientes.dbf.', 64, 'DemoFoxPro')
        ENDIF
    ENDPROC

    PROCEDURE configurar_columnas
        IF THIS.grdClientes.ColumnCount < 5
            RETURN
        ENDIF

        WITH THIS.grdClientes.Columns(1)
            .Width = 60
            .Header1.Caption = 'ID'
        ENDWITH

        WITH THIS.grdClientes.Columns(2)
            .Width = 360
            .Header1.Caption = 'Cliente'
        ENDWITH

        WITH THIS.grdClientes.Columns(3)
            .Width = 190
            .Header1.Caption = 'Ciudad'
        ENDWITH

        WITH THIS.grdClientes.Columns(4)
            .Width = 80
            .Header1.Caption = 'Activo'
        ENDWITH

        WITH THIS.grdClientes.Columns(5)
            .Width = 130
            .Header1.Caption = 'Alta'
        ENDWITH
    ENDPROC

    PROCEDURE refrescar_grilla
        SELECT clientes
        GO TOP
        THIS.grdClientes.RecordSource = ''
        THIS.grdClientes.RecordSource = 'clientes'
        THIS.configurar_columnas()
        THIS.grdClientes.Refresh()
        THIS.Refresh()
    ENDPROC

    PROCEDURE accion_cerrar
        THIS.Release()
    ENDPROC

    PROCEDURE accion_actual
        RETURN
    ENDPROC

    PROCEDURE Destroy
        IF USED('clientes')
            USE IN clientes
        ENDIF
    ENDPROC
ENDDEFINE
