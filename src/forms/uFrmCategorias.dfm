object frmCategorias: TfrmCategorias
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Categorias'
  ClientHeight = 600
  ClientWidth = 850
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
    Width = 850
    Height = 85
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 848
    object lblTituloPagina: TLabel
      Left = 32
      Top = 8
      Width = 165
      Height = 45
      Caption = 'Categorias'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -33
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblSubtituloPagina: TLabel
      Left = 32
      Top = 56
      Width = 305
      Height = 23
      Caption = 'Gerencie as categorias das suas tarefas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
  end
  object pnlCadastro: TPanel
    Left = 0
    Top = 85
    Width = 850
    Height = 175
    Align = alTop
    TabOrder = 1
    object lblDescricao: TLabel
      Left = 346
      Top = 16
      Width = 176
      Height = 23
      Caption = 'Descri'#231#227'o da Categoria'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblNome: TLabel
      Left = 24
      Top = 16
      Width = 150
      Height = 23
      Caption = 'Nome da Categoria'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnEditar: TButton
      Left = 280
      Top = 125
      Width = 100
      Height = 32
      Caption = 'Editar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnEditarClick
    end
    object btnExcluir: TButton
      Left = 152
      Top = 125
      Width = 100
      Height = 32
      Caption = 'Excluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnExcluirClick
    end
    object btnLimpar: TButton
      Left = 408
      Top = 125
      Width = 100
      Height = 32
      Caption = 'Limpar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnLimparClick
    end
    object btnSalvar: TButton
      Left = 24
      Top = 125
      Width = 100
      Height = 32
      Caption = 'Salvar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = btnSalvarClick
    end
    object edtNome: TEdit
      Left = 24
      Top = 37
      Width = 300
      Height = 36
      Hint = 'Ex.: Estudos'
      MaxLength = 100
      TabOrder = 4
    end
    object memDescricao: TMemo
      Left = 346
      Top = 37
      Width = 430
      Height = 65
      Hint = 'Ex.: Atividades da faculdade'
      MaxLength = 255
      TabOrder = 5
    end
  end
  object pnlListagem: TPanel
    Left = 0
    Top = 260
    Width = 850
    Height = 340
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    ExplicitLeft = 439
    ExplicitTop = 360
    ExplicitWidth = 185
    ExplicitHeight = 41
    object dbgCategorias: TDBGrid
      Left = 1
      Top = 1
      Width = 848
      Height = 338
      Align = alClient
      DataSource = dmPrincipal.dsCategoriasCadastro
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
      TitleFont.Color = clDarkblue
      TitleFont.Height = -20
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Title.Caption = 'C'#243'digo'
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Categoria'
          Width = 220
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 450
          Visible = True
        end>
    end
  end
end
