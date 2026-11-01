object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Cursor = crHandPoint
  Caption = 'Gerenciador de Tarefas'
  ClientHeight = 511
  ClientWidth = 834
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -17
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  TextHeight = 23
  object lblTitulo: TLabel
    Left = 40
    Top = 24
    Width = 116
    Height = 23
    Caption = 'T'#237'tulo da tarefa'
  end
  object lblDescricao: TLabel
    Left = 40
    Top = 96
    Width = 73
    Height = 23
    Caption = 'Descri'#231#227'o'
  end
  object lblCategoria: TLabel
    Left = 400
    Top = 24
    Width = 74
    Height = 23
    Caption = 'Categoria'
  end
  object edtTitulo: TEdit
    Left = 40
    Top = 45
    Width = 300
    Height = 31
    MaxLength = 100
    TabOrder = 0
  end
  object memDescricao: TMemo
    Left = 40
    Top = 125
    Width = 300
    Height = 89
    TabOrder = 2
  end
  object btnSalvar: TButton
    Left = 40
    Top = 224
    Width = 100
    Height = 32
    Cursor = crHandPoint
    Caption = 'Salvar'
    TabOrder = 3
    OnClick = btnSalvarClick
  end
  object btnExcluir: TButton
    Left = 296
    Top = 224
    Width = 100
    Height = 32
    Cursor = crHandPoint
    Caption = 'Excluir'
    TabOrder = 5
  end
  object btnEditar: TButton
    Left = 168
    Top = 224
    Width = 100
    Height = 32
    Cursor = crHandPoint
    Caption = 'Editar'
    TabOrder = 4
  end
  object btnLimpar: TButton
    Left = 424
    Top = 224
    Width = 100
    Height = 32
    Cursor = crHandPoint
    Caption = 'Limpar'
    TabOrder = 6
    OnClick = btnLimparClick
  end
  object edtCategoriaId: TEdit
    Left = 400
    Top = 45
    Width = 300
    Height = 31
    TabOrder = 1
  end
end
