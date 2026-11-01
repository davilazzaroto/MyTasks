object dmPrincipal: TdmPrincipal
  OnCreate = DataModuleCreate
  Height = 750
  Width = 1000
  PixelsPerInch = 120
  object conBanco: TFDConnection
    Params.Strings = (
      'DriverID=FB'
      'Database=D:\Firebird\Dados\MYTASKS.FDB'
      'Server=localhost'
      'Port=3050'
      'User_Name=SYSDBA'
      'CharacterSet=UTF8'
      'Protocol=TCPIP')
    LoginPrompt = False
    Left = 64
    Top = 24
  end
  object drvFirebird: TFDPhysFBDriverLink
    VendorLib = 'fbclient.dll'
    Left = 152
    Top = 24
  end
  object qryTarefas: TFDQuery
    Connection = conBanco
    SQL.Strings = (
      'INSERT INTO TAREFAS ('
      '    TITULO,'
      '    DESCRICAO,'
      '    CATEGORIA_ID'
      ')'
      'VALUES ('
      '    :TITULO,'
      '    :DESCRICAO,'
      '    :CATEGORIA_ID'
      ')')
    Left = 248
    Top = 24
    ParamData = <
      item
        Name = 'TITULO'
        ParamType = ptInput
      end
      item
        Name = 'DESCRICAO'
        ParamType = ptInput
      end
      item
        Name = 'CATEGORIA_ID'
        ParamType = ptInput
      end>
  end
  object qryListarTarefas: TFDQuery
    Connection = conBanco
    SQL.Strings = (
      'SELECT'
      '    T.ID,'
      '    T.TITULO,'
      '    T.DESCRICAO,'
      '    T.CONCLUIDA,'
      '    T.DATA_CRIACAO,'
      '    T.CATEGORIA_ID,'
      '    C.NOME AS CATEGORIA'
      'FROM TAREFAS T'
      'LEFT JOIN CATEGORIAS C'
      '    ON C.ID = T.CATEGORIA_ID'
      'ORDER BY T.ID DESC')
    Left = 344
    Top = 24
  end
  object dsTarefas: TDataSource
    DataSet = qryListarTarefas
    Left = 440
    Top = 24
  end
  object qryExcluirTarefa: TFDQuery
    Connection = conBanco
    SQL.Strings = (
      'DELETE FROM TAREFAS'
      'WHERE ID = :ID')
    Left = 536
    Top = 24
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object qryAtualizarTarefa: TFDQuery
    Connection = conBanco
    SQL.Strings = (
      'UPDATE TAREFAS'
      'SET'
      '    TITULO = :TITULO,'
      '    DESCRICAO = :DESCRICAO,'
      '    CATEGORIA_ID = :CATEGORIA_ID'
      'WHERE ID = :ID')
    Left = 656
    Top = 24
    ParamData = <
      item
        Name = 'TITULO'
        ParamType = ptInput
      end
      item
        Name = 'DESCRICAO'
        ParamType = ptInput
      end
      item
        Name = 'CATEGORIA_ID'
        ParamType = ptInput
      end
      item
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object qryVerificarCategoria: TFDQuery
    Connection = conBanco
    SQL.Strings = (
      'SELECT ID'
      'FROM CATEGORIAS'
      'WHERE ID = :ID')
    Left = 800
    Top = 24
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
      end>
  end
end
