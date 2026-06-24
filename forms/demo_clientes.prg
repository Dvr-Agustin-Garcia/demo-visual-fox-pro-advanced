DEFINE CLASS frmDemoClientes AS Form
    Caption = 'DemoFoxPro | Clientes'
    Width = 900
    Height = 520
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
        THIS.BackColor = RGB(245, 247, 250)

        THIS.AddObject('lblTitulo', 'Label')
        WITH THIS.lblTitulo
            .Caption = 'Proyecto demo simple para iterar'
            .Left = 22
            .Top = 18
            .Width = 420
            .Height = 30
            .FontName = 'Segoe UI'
            .FontSize = 16
            .FontBold = .T.
            .ForeColor = RGB(45, 62, 80)
            .BackStyle = 0
            .Visible = .T.
        ENDWITH

        THIS.AddObject('lblAyuda', 'Label')
        WITH THIS.lblAyuda
            .Caption = 'La tabla se crea sola. Puedes cargar datos demo, agregar un registro y ver el resultado en la grilla.'
            .Left = 22
            .Top = 66
            .Width = 760
            .Height = 26
            .FontName = 'Segoe UI'
            .FontSize = 9
            .ForeColor = RGB(85, 95, 105)
            .BackStyle = 0
            .Visible = .T.
        ENDWITH

        THIS.AddObject('cmdCargarDemo', 'CommandButton')
        WITH THIS.cmdCargarDemo
            .Caption = 'Cargar datos demo'
            .Left = 20
            .Top = 104
            .Width = 150
            .Height = 32
            .FontName = 'Segoe UI'
            .Visible = .T.
        ENDWITH
        BINDEVENT(THIS.cmdCargarDemo, 'Click', THIS, 'accion_cargar_demo')

        THIS.AddObject('cmdAgregar', 'CommandButton')
        WITH THIS.cmdAgregar
            .Caption = 'Agregar cliente'
            .Left = 182
            .Top = 104
            .Width = 140
            .Height = 32
            .FontName = 'Segoe UI'
            .Visible = .T.
        ENDWITH
        BINDEVENT(THIS.cmdAgregar, 'Click', THIS, 'accion_agregar')

        THIS.AddObject('cmdEliminar', 'CommandButton')
        WITH THIS.cmdEliminar
            .Caption = 'Eliminar cliente'
            .Left = 344
            .Top = 104
            .Width = 150
            .Height = 32
            .FontName = 'Segoe UI'
            .Visible = .T.
        ENDWITH
        BINDEVENT(THIS.cmdEliminar, 'Click', THIS, 'accion_eliminar')

        THIS.AddObject('cmdRefrescar', 'CommandButton')
        WITH THIS.cmdRefrescar
            .Caption = 'Refrescar grilla'
            .Left = 506
            .Top = 104
            .Width = 140
            .Height = 32
            .FontName = 'Segoe UI'
            .Visible = .T.
        ENDWITH
        BINDEVENT(THIS.cmdRefrescar, 'Click', THIS, 'refrescar_grilla')

        THIS.AddObject('cmdCerrar', 'CommandButton')
        WITH THIS.cmdCerrar
            .Caption = 'Cerrar'
            .Left = 760
            .Top = 104
            .Width = 100
            .Height = 32
            .FontName = 'Segoe UI'
            .Visible = .T.
        ENDWITH
        BINDEVENT(THIS.cmdCerrar, 'Click', THIS, 'accion_cerrar')

        THIS.AddObject('grdClientes', 'Grid')
        WITH THIS.grdClientes
            .Left = 20
            .Top = 156
            .Width = 840
            .Height = 320
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
            .Width = 330
            .Header1.Caption = 'Cliente'
        ENDWITH

        WITH THIS.grdClientes.Columns(3)
            .Width = 170
            .Header1.Caption = 'Ciudad'
        ENDWITH

        WITH THIS.grdClientes.Columns(4)
            .Width = 70
            .Header1.Caption = 'Activo'
        ENDWITH

        WITH THIS.grdClientes.Columns(5)
            .Width = 120
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

    PROCEDURE Destroy
        IF USED('clientes')
            USE IN clientes
        ENDIF
        CLEAR EVENTS
    ENDPROC
ENDDEFINE
