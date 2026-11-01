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
    BeforeDelete = qryListarTarefasBeforeDelete
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
  object qryListarCategorias: TFDQuery
    Connection = conBanco
    SQL.Strings = (
      'SELECT'
      '    ID,'
      '    NOME'
      'FROM CATEGORIAS'
      'WHERE'
      '    UPPER(NOME) LIKE :PESQUISA'
      '    OR CAST(ID AS VARCHAR(20)) LIKE :PESQUISA'
      'ORDER BY NOME')
    Left = 232
    Top = 120
    ParamData = <
      item
        Name = 'PESQUISA'
        ParamType = ptInput
      end>
  end
  object dsCategorias: TDataSource
    DataSet = qryListarCategorias
    Left = 360
    Top = 120
  end
  object qryCadastrarCategoria: TFDQuery
    Connection = conBanco
    SQL.Strings = (
      'INSERT INTO CATEGORIAS ('
      '    NOME,'
      '    DESCRICAO'
      ')'
      'VALUES ('
      '    :NOME,'
      '    :DESCRICAO'
      ')')
    Left = 496
    Top = 120
    ParamData = <
      item
        Name = 'NOME'
        ParamType = ptInput
      end
      item
        Name = 'DESCRICAO'
        ParamType = ptInput
      end>
  end
  object qryListarCategoriasCadastro: TFDQuery
    BeforeDelete = qryListarCategoriasCadastroBeforeDelete
    Connection = conBanco
    SQL.Strings = (
      'SELECT'
      '    ID,'
      '    NOME,'
      '    DESCRICAO'
      'FROM CATEGORIAS'
      'ORDER BY ID DESC')
    Left = 496
    Top = 240
  end
  object dsCategoriasCadastro: TDataSource
    DataSet = qryListarCategoriasCadastro
    Left = 304
    Top = 248
  end
  object qryAtualizarCategoria: TFDQuery
    Connection = conBanco
    SQL.Strings = (
      'UPDATE CATEGORIAS'
      'SET'
      '    NOME = :NOME,'
      '    DESCRICAO = :DESCRICAO'
      'WHERE ID = :ID')
    Left = 272
    Top = 336
    ParamData = <
      item
        Name = 'NOME'
        ParamType = ptInput
      end
      item
        Name = 'DESCRICAO'
        ParamType = ptInput
      end
      item
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object qryExcluirCategoria: TFDQuery
    Connection = conBanco
    SQL.Strings = (
      'DELETE FROM CATEGORIAS'
      'WHERE ID = :ID')
    Left = 440
    Top = 344
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
      end>
  end
end
