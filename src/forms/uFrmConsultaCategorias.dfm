object frmConsultaCategorias: TfrmConsultaCategorias
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta de Categorias'
  ClientHeight = 440
  ClientWidth = 620
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object pnlCabecalho: TPanel
    Left = 0
    Top = 0
    Width = 620
    Height = 75
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object lblSubtituloConsulta: TLabel
      Left = 17
      Top = 50
      Width = 388
      Height = 23
      Caption = 'Pesquise e selecione uma categoria para sua tarefa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblTituloConsulta: TLabel
      Left = 17
      Top = 6
      Width = 288
      Height = 41
      Caption = 'Consultar categorias'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clDarkblue
      Font.Height = -30
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object pnlPesquisa: TPanel
    Left = 0
    Top = 75
    Width = 620
    Height = 70
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object lblPesquisa: TLabel
      Left = 17
      Top = -2
      Width = 147
      Height = 23
      Caption = 'Pesquisar categoria'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtPesquisa: TEdit
      Left = 17
      Top = 27
      Width = 603
      Height = 30
      TabOrder = 0
      OnChange = edtPesquisaChange
    end
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 375
    Width = 620
    Height = 65
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitTop = 399
    DesignSize = (
      620
      65)
    object lblRodape: TLabel
      Left = 0
      Top = 24
      Width = 280
      Height = 15
      Caption = #55357#56753' D'#234' um duplo clique para selecionar uma categoria.'
    end
    object btnFechar: TButton
      Left = 488
      Top = 16
      Width = 115
      Height = 35
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = 'Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnFecharClick
    end
  end
  object pnlListagem: TPanel
    Left = 0
    Top = 145
    Width = 620
    Height = 230
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    ExplicitLeft = 427
    ExplicitTop = 319
    ExplicitWidth = 185
    ExplicitHeight = 41
    object dbgCategorias: TDBGrid
      Left = 0
      Top = 0
      Width = 620
      Height = 230
      Align = alClient
      DataSource = dmPrincipal.dsCategorias
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDblClick = dbgCategoriasDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Segoe UI'
          Font.Style = []
          Title.Caption = 'C'#243'digo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -17
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Segoe UI'
          Font.Style = []
          Title.Caption = 'Categoria'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -17
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 520
          Visible = True
        end>
    end
  end
end
