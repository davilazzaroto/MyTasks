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
end
