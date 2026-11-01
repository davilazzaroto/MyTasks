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
  OnShow = FormShow
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
  object lblFiltrar: TLabel
    Left = 635
    Top = 192
    Width = 150
    Height = 23
    Caption = 'Filtrar'
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
    MaxLength = 500
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
    OnClick = btnExcluirClick
  end
  object btnEditar: TButton
    Left = 168
    Top = 224
    Width = 100
    Height = 32
    Cursor = crHandPoint
    Caption = 'Editar'
    TabOrder = 4
    OnClick = btnEditarClick
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
    OnDblClick = edtCategoriaIdDblClick
  end
  object dbgTarefas: TDBGrid
    Left = 40
    Top = 288
    Width = 769
    Height = 209
    DataSource = dmPrincipal.dsTarefas
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    PopupMenu = popTarefas
    ReadOnly = True
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -17
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Title.Caption = 'C'#243'digo'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TITULO'
        Title.Caption = 'T'#237'tulo da tarefa'
        Width = 190
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Caption = 'Descri'#231#227'o'
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CATEGORIA_ID'
        Title.Caption = 'Categoria'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUS_TAREFA'
        Title.Caption = 'Situa'#231#227'o'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_CRIACAO'
        Title.Caption = 'Data de cria'#231#227'o'
        Width = 138
        Visible = True
      end>
  end
  object btnCategorias: TButton
    Left = 726
    Top = 45
    Width = 100
    Height = 32
    Caption = 'Categorias'
    TabOrder = 8
    OnClick = btnCategoriasClick
  end
  object cmbFiltroStatus: TComboBox
    Left = 635
    Top = 224
    Width = 150
    Height = 31
    Style = csDropDownList
    TabOrder = 9
    OnChange = cmbFiltroStatusChange
    Items.Strings = (
      'Todas'
      'Pendentes '
      'Conclu'#237'das')
  end
  object popTarefas: TPopupMenu
    OnPopup = popTarefasPopup
    Left = 792
    Top = 256
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
