DEFINE CLASS frmMenuPrincipal AS Form
    Caption = 'DemoFoxPro | Menu principal'
    Width = 980
    Height = 620
    AutoCenter = .T.
    Closable = .T.
    MaxButton = .F.
    MinButton = .F.
    cDataPath = ''

    PROCEDURE Init(tcDataPath)
        THIS.cDataPath = tcDataPath
        THIS.configurar_interfaz()
    ENDPROC

    PROCEDURE configurar_interfaz
        THIS.BackColor = RGB(241, 245, 249)

        THIS.AddObject('shpHero', 'Shape')
        WITH THIS.shpHero
            .Left = 20
            .Top = 20
            .Width = 940
            .Height = 180
            .BackColor = RGB(255, 255, 255)
            .BorderColor = RGB(218, 226, 237)
            .Visible = .T.
        ENDWITH

        THIS.AddObject('shpCardClientes', 'Shape')
        WITH THIS.shpCardClientes
            .Left = 20
            .Top = 230
            .Width = 455
            .Height = 250
            .BackColor = RGB(255, 255, 255)
            .BorderColor = RGB(218, 226, 237)
            .Visible = .T.
        ENDWITH

        THIS.AddObject('shpCardProductos', 'Shape')
        WITH THIS.shpCardProductos
            .Left = 505
            .Top = 230
            .Width = 455
            .Height = 250
            .BackColor = RGB(255, 255, 255)
            .BorderColor = RGB(218, 226, 237)
            .Visible = .T.
        ENDWITH

        THIS.AddObject('lblMarca', 'Label')
        WITH THIS.lblMarca
            .Caption = 'DEMOFOXPRO'
            .Left = 40
            .Top = 34
            .Width = 140
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
            .BackColor = RGB(37, 99, 235)
            .ForeColor = RGB(45, 62, 80)
            .Visible = .T.
        ENDWITH
        BINDEVENT(THIS.cmdNavMenu, 'Click', THIS, 'accion_actual')

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
            .BackColor = RGB(45, 62, 80)
            .ForeColor = RGB(45, 62, 80)
            .Visible = .T.
        ENDWITH
        BINDEVENT(THIS.cmdNavClientes, 'Click', THIS, 'abrir_clientes')

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
            .Caption = 'Un punto de entrada simple para el demo'
            .Left = 40
            .Top = 82
            .Width = 520
            .Height = 34
            .FontName = 'Segoe UI'
            .FontSize = 20
            .FontBold = .T.
            .ForeColor = RGB(30, 41, 59)
            .BackStyle = 0
            .Visible = .T.
        ENDWITH

        THIS.AddObject('lblResumen', 'Label')
        WITH THIS.lblResumen
            .Caption = 'Desde aqui definimos las pantallas disponibles hoy y dejamos visible la siguiente iteracion sin forzar una implementacion vacia.'
            .Left = 40
            .Top = 124
            .Width = 580
            .Height = 36
            .FontName = 'Segoe UI'
            .FontSize = 9
            .ForeColor = RGB(71, 85, 105)
            .BackStyle = 0
            .Visible = .T.
        ENDWITH

        THIS.AddObject('lblEstado', 'Label')
        WITH THIS.lblEstado
            .Caption = 'Disponible hoy' + CHR(13) + 'Clientes con datos demo' + CHR(13) + CHR(13) + 'Reservado' + CHR(13) + 'Productos'
            .Left = 700
            .Top = 92
            .Width = 220
            .Height = 76
            .FontName = 'Segoe UI'
            .FontSize = 9
            .ForeColor = RGB(45, 62, 80)
            .BackStyle = 0
            .Visible = .T.
        ENDWITH

        THIS.AddObject('lblClientesTag', 'Label')
        WITH THIS.lblClientesTag
            .Caption = 'DISPONIBLE HOY'
            .Left = 50
            .Top = 255
            .Width = 140
            .Height = 18
            .FontName = 'Segoe UI'
            .FontSize = 8
            .FontBold = .T.
            .ForeColor = RGB(37, 99, 235)
            .BackStyle = 0
            .Visible = .T.
        ENDWITH

        THIS.AddObject('lblClientesTitulo', 'Label')
        WITH THIS.lblClientesTitulo
            .Caption = 'Clientes'
            .Left = 50
            .Top = 286
            .Width = 200
            .Height = 28
            .FontName = 'Segoe UI'
            .FontSize = 16
            .FontBold = .T.
            .ForeColor = RGB(30, 41, 59)
            .BackStyle = 0
            .Visible = .T.
        ENDWITH

        THIS.AddObject('lblClientesDetalle', 'Label')
        WITH THIS.lblClientesDetalle
            .Caption = 'Acceso al mantenimiento demo sobre clientes.dbf con carga inicial, alta simple, baja logica y refresco de grilla.'
            .Left = 50
            .Top = 326
            .Width = 360
            .Height = 42
            .FontName = 'Segoe UI'
            .FontSize = 9
            .ForeColor = RGB(71, 85, 105)
            .BackStyle = 0
            .Visible = .T.
        ENDWITH

        THIS.AddObject('cmdAbrirClientes', 'CommandButton')
        WITH THIS.cmdAbrirClientes
            .Caption = 'Abrir clientes'
            .Left = 50
            .Top = 404
            .Width = 170
            .Height = 38
            .FontName = 'Segoe UI'
            .FontBold = .T.
            .Style = 0
            .BackColor = RGB(37, 99, 235)
            .ForeColor = RGB(45, 62, 80)
            .Visible = .T.
        ENDWITH
        BINDEVENT(THIS.cmdAbrirClientes, 'Click', THIS, 'abrir_clientes')

        THIS.AddObject('lblClientesNota', 'Label')
        WITH THIS.lblClientesNota
            .Caption = 'Ideal para validar el flujo principal antes de sumar nuevas entidades.'
            .Left = 50
            .Top = 454
            .Width = 340
            .Height = 20
            .FontName = 'Segoe UI'
            .FontSize = 8
            .ForeColor = RGB(100, 116, 139)
            .BackStyle = 0
            .Visible = .T.
        ENDWITH

        THIS.AddObject('lblProductosTag', 'Label')
        WITH THIS.lblProductosTag
            .Caption = 'PROXIMA PANTALLA'
            .Left = 535
            .Top = 255
            .Width = 150
            .Height = 18
            .FontName = 'Segoe UI'
            .FontSize = 8
            .FontBold = .T.
            .ForeColor = RGB(14, 116, 144)
            .BackStyle = 0
            .Visible = .T.
        ENDWITH

        THIS.AddObject('lblProductosTitulo', 'Label')
        WITH THIS.lblProductosTitulo
            .Caption = 'Productos'
            .Left = 535
            .Top = 286
            .Width = 220
            .Height = 28
            .FontName = 'Segoe UI'
            .FontSize = 16
            .FontBold = .T.
            .ForeColor = RGB(30, 41, 59)
            .BackStyle = 0
            .Visible = .T.
        ENDWITH

        THIS.AddObject('lblProductosDetalle', 'Label')
        WITH THIS.lblProductosDetalle
            .Caption = 'La pantalla queda definida en la navegacion para la siguiente iteracion, pero el acceso permanece deshabilitado hasta implementarla.'
            .Left = 535
            .Top = 326
            .Width = 360
            .Height = 42
            .FontName = 'Segoe UI'
            .FontSize = 9
            .ForeColor = RGB(71, 85, 105)
            .BackStyle = 0
            .Visible = .T.
        ENDWITH

        THIS.AddObject('cmdAbrirProductos', 'CommandButton')
        WITH THIS.cmdAbrirProductos
            .Caption = 'Proximamente'
            .Left = 535
            .Top = 404
            .Width = 170
            .Height = 38
            .FontName = 'Segoe UI'
            .FontBold = .T.
            .Style = 0
            .BackColor = RGB(229, 231, 235)
            .ForeColor = RGB(120, 130, 140)
            .Enabled = .F.
            .Visible = .T.
        ENDWITH

        THIS.AddObject('lblProductosNota', 'Label')
        WITH THIS.lblProductosNota
            .Caption = 'El boton queda visible para marcar la estructura del menu sin inventar comportamiento ahora.'
            .Left = 535
            .Top = 454
            .Width = 360
            .Height = 20
            .FontName = 'Segoe UI'
            .FontSize = 8
            .ForeColor = RGB(100, 116, 139)
            .BackStyle = 0
            .Visible = .T.
        ENDWITH

        THIS.AddObject('lblPie', 'Label')
        WITH THIS.lblPie
            .Caption = 'Pantallas definidas: Clientes activo, Productos reservado. Cierra esta ventana para salir de la aplicacion.'
            .Left = 40
            .Top = 520
            .Width = 650
            .Height = 22
            .FontName = 'Segoe UI'
            .FontSize = 8
            .ForeColor = RGB(100, 116, 139)
            .BackStyle = 0
            .Visible = .T.
        ENDWITH

        THIS.AddObject('cmdSalir', 'CommandButton')
        WITH THIS.cmdSalir
            .Caption = 'Salir'
            .Left = 790
            .Top = 510
            .Width = 160
            .Height = 38
            .FontName = 'Segoe UI'
            .FontBold = .T.
            .Style = 0
            .BackColor = RGB(45, 62, 80)
            .ForeColor = RGB(45, 62, 80)
            .Visible = .T.
        ENDWITH
        BINDEVENT(THIS.cmdSalir, 'Click', THIS, 'accion_salir')
    ENDPROC

    PROCEDURE abrir_clientes
        LOCAL loClientes

        TRY
            loClientes = CREATEOBJECT('frmDemoClientes', THIS.cDataPath)
            loClientes.Show(1)
        CATCH TO loError
            MESSAGEBOX('No se pudo abrir la pantalla de clientes.' + CHR(13) + loError.Message, 16, 'DemoFoxPro')
        ENDTRY

        THIS.Refresh()
    ENDPROC

    PROCEDURE accion_actual
        RETURN
    ENDPROC

    PROCEDURE accion_salir
        THIS.Release()
    ENDPROC

    PROCEDURE Destroy
        CLEAR EVENTS
    ENDPROC
ENDDEFINE