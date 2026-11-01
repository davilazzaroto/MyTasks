object frmConsultaCategorias: TfrmConsultaCategorias
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Consulta de Categorias'
  ClientHeight = 420
  ClientWidth = 584
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object lblPesquisa: TLabel
    Left = 32
    Top = 24
    Width = 113
    Height = 25
    Caption = 'Pesquisar categoria'
  end
  object edtPesquisa: TEdit
    Left = 151
    Top = 21
    Width = 130
    Height = 23
    TabOrder = 0
    OnChange = edtPesquisaChange
  end
  object dbgCategorias: TDBGrid
    Left = 40
    Top = 72
    Width = 441
    Height = 153
    DataSource = dmPrincipal.dsCategorias
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 1
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
        Title.Caption = 'C'#243'digo'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Categoria'
        Width = 300
        Visible = True
      end>
  end
  object btnConfirmar: TButton
    Left = 40
    Top = 256
    Width = 105
    Height = 33
    Caption = 'Confirmar'
    TabOrder = 2
    OnClick = btnConfirmarClick
  end
  object btnCancelar: TButton
    Left = 176
    Top = 256
    Width = 105
    Height = 33
    Caption = 'Cancelar'
    TabOrder = 3
    OnClick = btnCancelarClick
  end
end
