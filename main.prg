SET SAFETY OFF
SET EXCLUSIVE OFF
SET DELETED ON
SET MULTILOCKS ON
SET TALK OFF
SET CENTURY ON
SET DATE BRITISH

LOCAL lcBasePath, lcDataPath, lcSetupPath, lcFormPath, loForm

lcBasePath = JUSTPATH(SYS(16))
IF EMPTY(lcBasePath)
    lcBasePath = FULLPATH('.')
ENDIF

lcSetupPath = ADDBS(lcBasePath) + 'app\setup.prg'
lcFormPath = ADDBS(lcBasePath) + 'forms\demo_clientes.prg'

IF !FILE(lcSetupPath)
    MESSAGEBOX('No se encontro app\\setup.prg en la carpeta del proyecto: ' + lcBasePath, 16, 'DemoFoxPro')
    RETURN
ENDIF

IF !FILE(lcFormPath)
    MESSAGEBOX('No se encontro forms\\demo_clientes.prg en la carpeta del proyecto: ' + lcBasePath, 16, 'DemoFoxPro')
    RETURN
ENDIF

SET DEFAULT TO (lcBasePath)
SET PROCEDURE TO (lcSetupPath), (lcFormPath) ADDITIVE
lcDataPath = ADDBS(lcBasePath) + 'data'

=setup_demo(lcDataPath)

loForm = CREATEOBJECT('frmDemoClientes', lcDataPath)
loForm.Show()

READ EVENTS
