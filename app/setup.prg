FUNCTION setup_demo(tcDataPath)
    LOCAL lcDataPath, lcTablePath

    lcDataPath = tcDataPath
    IF !DIRECTORY(lcDataPath)
        MD (lcDataPath)
    ENDIF

    lcTablePath = ADDBS(tcDataPath) + 'clientes.dbf'

    IF !FILE(lcTablePath)
        CREATE TABLE (lcTablePath) ;
            (id I, ;
            nombre C(60), ;
            ciudad C(40), ;
            activo L, ;
            alta D)

        INDEX ON id TAG id
        INDEX ON UPPER(nombre) TAG nombre
    ENDIF

    RETURN lcTablePath
ENDFUNC

FUNCTION cargar_clientes_demo(tcTablePath)
    LOCAL lcAlias

    lcAlias = 'clientesCarga'

    IF USED(lcAlias)
        USE IN (lcAlias)
    ENDIF

    IF USED('clientes')
        USE IN clientes
    ENDIF

    USE (tcTablePath) EXCLUSIVE ALIAS (lcAlias) IN 0
    ZAP IN (lcAlias)

    INSERT INTO (lcAlias) (id, nombre, ciudad, activo, alta) VALUES (1, 'Optimi SRL', 'Buenos Aires', .T., DATE() - 30)
    INSERT INTO (lcAlias) (id, nombre, ciudad, activo, alta) VALUES (2, 'Legacy Foods', 'Cordoba', .T., DATE() - 12)
    INSERT INTO (lcAlias) (id, nombre, ciudad, activo, alta) VALUES (3, 'Demo Textiles', 'Rosario', .F., DATE() - 5)
    INSERT INTO (lcAlias) (id, nombre, ciudad, activo, alta) VALUES (4, 'Cliente Piloto', 'Mendoza', .T., DATE())

    GO TOP IN (lcAlias)
    USE IN (lcAlias)

    RETURN .T.
ENDFUNC
