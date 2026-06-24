SET SAFETY OFF
SET EXCLUSIVE OFF
SET DELETED ON
SET MULTILOCKS ON
SET TALK OFF
SET CENTURY ON
SET DATE BRITISH

LOCAL lcBasePath, lcDataPath, lcSetupPath, lcMenuPath, lcClientesPath, loForm

lcBasePath = JUSTPATH(SYS(16))
IF EMPTY(lcBasePath)
    lcBasePath = FULLPATH('.')
ENDIF

lcSetupPath = ADDBS(lcBasePath) + 'app\setup.prg'
lcMenuPath = ADDBS(lcBasePath) + 'forms\menu_principal.prg'
lcClientesPath = ADDBS(lcBasePath) + 'forms\demo_clientes.prg'

IF !FILE(lcSetupPath)
    MESSAGEBOX('No se encontro app\\setup.prg en la carpeta del proyecto: ' + lcBasePath, 16, 'DemoFoxPro')
    RETURN
ENDIF

IF !FILE(lcMenuPath)
    MESSAGEBOX('No se encontro forms\\menu_principal.prg en la carpeta del proyecto: ' + lcBasePath, 16, 'DemoFoxPro')
    RETURN
ENDIF

IF !FILE(lcClientesPath)
    MESSAGEBOX('No se encontro forms\\demo_clientes.prg en la carpeta del proyecto: ' + lcBasePath, 16, 'DemoFoxPro')
    RETURN
ENDIF

SET DEFAULT TO (lcBasePath)
SET PROCEDURE TO (lcSetupPath), (lcMenuPath), (lcClientesPath) ADDITIVE
lcDataPath = ADDBS(lcBasePath) + 'data'

=setup_demo(lcDataPath)

loForm = CREATEOBJECT('frmMenuPrincipal', lcDataPath)
loForm.Show()

READ EVENTS
