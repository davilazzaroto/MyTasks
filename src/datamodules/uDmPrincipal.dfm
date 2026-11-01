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
end
