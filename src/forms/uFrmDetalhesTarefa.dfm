object frmDetalhesTarefa: TfrmDetalhesTarefa
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Detalhes da Tarefa'
  ClientHeight = 400
  ClientWidth = 550
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -17
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 23
  object lblTituloFixo: TLabel
    Left = 16
    Top = 16
    Width = 148
    Height = 28
    Caption = 'T'#237'tulo da tarefa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblTituloValor: TLabel
    Left = 16
    Top = 45
    Width = 148
    Height = 23
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblCategoriaFixa: TLabel
    Left = 19
    Top = 74
    Width = 145
    Height = 28
    Caption = 'Categoria'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblCategoriaValor: TLabel
    Left = 19
    Top = 108
    Width = 145
    Height = 23
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblSituacaoFixa: TLabel
    Left = 304
    Top = 16
    Width = 88
    Height = 28
    Caption = 'Situacao'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblSituacaoValor: TLabel
    Left = 304
    Top = 50
    Width = 88
    Height = 23
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblDescricaoFixa: TLabel
    Left = 19
    Top = 147
    Width = 145
    Height = 28
    Caption = 'Descricao'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblDataFixa: TLabel
    Left = 19
    Top = 328
    Width = 124
    Height = 23
    Caption = 'Data de cria'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblDataValor: TLabel
    Left = 19
    Top = 349
    Width = 5
    Height = 23
  end
  object memDescricaoDetalhes: TMemo
    Left = 16
    Top = 181
    Width = 490
    Height = 120
    TabStop = False
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object btnFechar: TButton
    Left = 432
    Top = 352
    Width = 100
    Height = 32
    Caption = 'Fechar'
    ModalResult = 1
    TabOrder = 1
  end
end
