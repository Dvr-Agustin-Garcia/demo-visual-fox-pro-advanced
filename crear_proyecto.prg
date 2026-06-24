SET TALK OFF
SET SAFETY OFF

LOCAL lcBasePath, lcMainPath, lcSetupPath, lcMenuPath, lcFormPath

lcBasePath = JUSTPATH(SYS(16))
IF EMPTY(lcBasePath)
    lcBasePath = FULLPATH('.')
ENDIF

SET DEFAULT TO (lcBasePath)

lcMainPath = ADDBS(lcBasePath) + 'main.prg'
lcSetupPath = ADDBS(lcBasePath) + 'app\setup.prg'
lcMenuPath = ADDBS(lcBasePath) + 'forms\menu_principal.prg'
lcFormPath = ADDBS(lcBasePath) + 'forms\demo_clientes.prg'

IF !FILE(lcMainPath)
    MESSAGEBOX('No se encontro main.prg en: ' + lcBasePath, 16, 'DemoFoxPro')
    RETURN .F.
ENDIF

IF !FILE(lcSetupPath)
    MESSAGEBOX('No se encontro app\\setup.prg en: ' + lcBasePath, 16, 'DemoFoxPro')
    RETURN .F.
ENDIF

IF !FILE(lcMenuPath)
    MESSAGEBOX('No se encontro forms\\menu_principal.prg en: ' + lcBasePath, 16, 'DemoFoxPro')
    RETURN .F.
ENDIF

IF !FILE(lcFormPath)
    MESSAGEBOX('No se encontro forms\\demo_clientes.prg en: ' + lcBasePath, 16, 'DemoFoxPro')
    RETURN .F.
ENDIF

CLEAR PROGRAM

BUILD PROJECT DemoFoxPro RECOMPILE FROM main.prg, app\setup.prg, forms\menu_principal.prg, forms\demo_clientes.prg
MODIFY PROJECT DemoFoxPro NOWAIT

MESSAGEBOX('Proyecto DemoFoxPro generado o actualizado.' + CHR(13) + ;
           'Ahora puedes ejecutar el demo con DO main.prg desde esta misma sesion.', 64, 'DemoFoxPro')

RETURN .T.
