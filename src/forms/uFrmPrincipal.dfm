object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Cursor = crHandPoint
  Caption = 'Gerenciador de Tarefas'
  ClientHeight = 645
  ClientWidth = 959
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -17
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  TextHeight = 23
  object pnlListagem: TPanel
    Left = 0
    Top = 400
    Width = 959
    Height = 245
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitWidth = 957
    ExplicitHeight = 237
    object dbgTarefas: TDBGrid
      Left = 0
      Top = 0
      Width = 959
      Height = 245
      Align = alClient
      DataSource = dmPrincipal.dsTarefas
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      PopupMenu = popTarefas
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -17
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = [fsBold]
      OnDblClick = dbgTarefasDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Title.Caption = 'C'#243'digo'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO'
          Title.Caption = 'T'#237'tulo da tarefa'
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 400
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CATEGORIA'
          Title.Caption = 'Categoria'
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STATUS_TAREFA'
          Title.Caption = 'Situa'#231#227'o'
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_CRIACAO'
          Title.Caption = 'Data de cria'#231#227'o'
          Width = 155
          Visible = True
        end>
    end
  end
  object pnlCadastro: TPanel
    Left = 0
    Top = 85
    Width = 959
    Height = 260
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitWidth = 957
    object lblCategoria: TLabel
      Left = 400
      Top = 24
      Width = 74
      Height = 23
      Caption = 'Categoria'
    end
    object lblDescricao: TLabel
      Left = 40
      Top = 144
      Width = 73
      Height = 23
      Caption = 'Descri'#231#227'o'
    end
    object lblTitulo: TLabel
      Left = 40
      Top = 24
      Width = 116
      Height = 23
      Caption = 'T'#237'tulo da tarefa'
    end
    object btnCategorias: TButton
      Left = 726
      Top = 45
      Width = 100
      Height = 32
      Caption = 'Categorias'
      TabOrder = 0
      OnClick = btnCategoriasClick
    end
    object btnEditar: TButton
      Left = 168
      Top = 228
      Width = 100
      Height = 32
      Cursor = crHandPoint
      Caption = 'Editar'
      TabOrder = 1
      OnClick = btnEditarClick
    end
    object btnExcluir: TButton
      Left = 296
      Top = 228
      Width = 100
      Height = 32
      Cursor = crHandPoint
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = btnExcluirClick
    end
    object btnLimpar: TButton
      Left = 424
      Top = 228
      Width = 100
      Height = 32
      Cursor = crHandPoint
      Caption = 'Limpar'
      TabOrder = 3
      OnClick = btnLimparClick
    end
    object btnSalvar: TButton
      Left = 40
      Top = 228
      Width = 100
      Height = 32
      Cursor = crHandPoint
      Caption = 'Salvar'
      TabOrder = 4
      OnClick = btnSalvarClick
    end
    object edtCategoriaId: TEdit
      Left = 400
      Top = 45
      Width = 300
      Height = 31
      TabOrder = 5
      OnDblClick = edtCategoriaIdDblClick
    end
    object edtTitulo: TEdit
      Left = 40
      Top = 51
      Width = 300
      Height = 31
      MaxLength = 100
      TabOrder = 6
    end
    object memDescricao: TMemo
      Left = 40
      Top = 115
      Width = 786
      Height = 89
      MaxLength = 500
      ScrollBars = ssVertical
      TabOrder = 7
    end
  end
  object pnlCabecalho: TPanel
    Left = 0
    Top = 0
    Width = 959
    Height = 85
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 957
    object lblNomeSistema: TLabel
      Left = 40
      Top = 0
      Width = 147
      Height = 50
      Caption = 'MyTasks'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -37
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblSubtitulo: TLabel
      Left = 37
      Top = 52
      Width = 197
      Height = 23
      Caption = 'Gerenciamento de tarefas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
  end
  object pnlFiltro: TPanel
    Left = 0
    Top = 345
    Width = 959
    Height = 55
    Align = alTop
    TabOrder = 3
    ExplicitWidth = 957
    object lblFiltrar: TLabel
      Left = 40
      Top = 21
      Width = 57
      Height = 28
      Caption = 'Filtrar:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cmbFiltroStatus: TComboBox
      Left = 101
      Top = 18
      Width = 180
      Height = 31
      Style = csDropDownList
      TabOrder = 0
      OnChange = cmbFiltroStatusChange
      Items.Strings = (
        'Todas'
        'Pendentes '
        'Conclu'#237'das')
    end
  end
  object popTarefas: TPopupMenu
    OnPopup = popTarefasPopup
    Left = 344
    Top = 344
    object mnuConcluir: TMenuItem
      Caption = 'Concluir tarefa'
      OnClick = mnuConcluirClick
    end
    object mnuReabrir: TMenuItem
      Caption = 'Reabrir tarefa'
      OnClick = mnuReabrirClick
    end
  end
end
