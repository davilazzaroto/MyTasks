object frmCategorias: TfrmCategorias
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Cadastro de Categorias'
  ClientHeight = 441
  ClientWidth = 634
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object lblNome: TLabel
    Left = 16
    Top = 8
    Width = 113
    Height = 15
    Caption = 'Nome da Categoria'
  end
  object lblDescricao: TLabel
    Left = 226
    Top = 8
    Width = 121
    Height = 15
    Caption = 'Descri'#231#227'o da Categoria'
  end
  object edtNome: TEdit
    Left = 16
    Top = 29
    Width = 169
    Height = 23
    MaxLength = 100
    TabOrder = 0
  end
  object btnSalvar: TButton
    Left = 16
    Top = 112
    Width = 89
    Height = 33
    Caption = 'Salvar'
    TabOrder = 2
    OnClick = btnSalvarClick
  end
  object btnExcluir: TButton
    Left = 128
    Top = 112
    Width = 89
    Height = 33
    Caption = 'Excluir'
    TabOrder = 3
    OnClick = btnExcluirClick
  end
  object btnEditar: TButton
    Left = 240
    Top = 112
    Width = 89
    Height = 33
    Caption = 'Editar'
    TabOrder = 4
    OnClick = btnEditarClick
  end
  object btnLimpar: TButton
    Left = 352
    Top = 112
    Width = 89
    Height = 33
    Caption = 'Limpar'
    TabOrder = 5
    OnClick = btnLimparClick
  end
  object dbgCategorias: TDBGrid
    Left = 8
    Top = 184
    Width = 425
    Height = 185
    DataSource = dmPrincipal.dsCategoriasCadastro
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Categoria'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Caption = 'Descri'#231#227'o'
        Width = 201
        Visible = True
      end>
  end
  object memDescricao: TMemo
    Left = 226
    Top = 29
    Width = 185
    Height = 67
    MaxLength = 255
    TabOrder = 1
  end
end
