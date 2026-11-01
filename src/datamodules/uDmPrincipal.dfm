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
  object qryCadastrarTarefas: TFDQuery
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
    Left = 320
    Top = 16
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
      '    CASE'
      '        WHEN T.CONCLUIDA = 1 THEN '#39'Conclu'#237'da'#39
      '        ELSE '#39'Pendente'#39
      '    END AS STATUS_TAREFA,'
      '    T.DATA_CRIACAO,'
      '    T.CATEGORIA_ID,'
      '    C.NOME AS CATEGORIA'
      'FROM TAREFAS T'
      'LEFT JOIN CATEGORIAS C ON C.ID = T.CATEGORIA_ID'
      'WHERE (:STATUS = -1 OR T.CONCLUIDA = :STATUS)'
      'ORDER BY T.ID DESC')
    Left = 448
    Top = 24
    ParamData = <
      item
        Name = 'STATUS'
        ParamType = ptInput
        Value = Null
      end>
  end
  object dsTarefas: TDataSource
    DataSet = qryListarTarefas
    Left = 552
    Top = 24
  end
  object qryExcluirTarefa: TFDQuery
    Connection = conBanco
    SQL.Strings = (
      'DELETE FROM TAREFAS'
      'WHERE ID = :ID')
    Left = 648
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
    Left = 776
    Top = 8
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
    Left = 64
    Top = 136
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
    Left = 216
    Top = 136
    ParamData = <
      item
        Name = 'PESQUISA'
        ParamType = ptInput
      end>
  end
  object dsCategorias: TDataSource
    DataSet = qryListarCategorias
    Left = 336
    Top = 136
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
    Left = 472
    Top = 128
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
    Left = 832
    Top = 144
  end
  object dsCategoriasCadastro: TDataSource
    DataSet = qryListarCategoriasCadastro
    Left = 640
    Top = 144
  end
  object qryAtualizarCategoria: TFDQuery
    Connection = conBanco
    SQL.Strings = (
      'UPDATE CATEGORIAS'
      'SET'
      '    NOME = :NOME,'
      '    DESCRICAO = :DESCRICAO'
      'WHERE ID = :ID')
    Left = 64
    Top = 232
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
    Left = 224
    Top = 232
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object qryAlterarStatusTarefa: TFDQuery
    Connection = conBanco
    SQL.Strings = (
      'UPDATE TAREFAS'
      'SET CONCLUIDA = :CONCLUIDA'
      'WHERE ID = :ID')
    Left = 904
    Top = 32
    ParamData = <
      item
        Name = 'CONCLUIDA'
        ParamType = ptInput
      end
      item
        Name = 'ID'
        ParamType = ptInput
      end>
  end
end
