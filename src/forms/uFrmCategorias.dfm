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
    ExplicitLeft = 1
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
      ImageIndex = 2
      ImageName = 'icons8-edit'
      Images = imgList
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
      ImageIndex = 1
      ImageName = 'icons8-delete'
      Images = imgList
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
      ImageIndex = 3
      ImageName = 'icons8-erase'
      Images = imgList
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
      ImageIndex = 0
      ImageName = 'icone_save_green'
      Images = imgList
      ParentFont = False
      TabOrder = 3
      OnClick = btnSalvarClick
    end
    object edtNome: TEdit
      Left = 24
      Top = 37
      Width = 300
      Height = 31
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 100
      ParentFont = False
      TabOrder = 4
      TextHint = 'Ex.: Estudos'
    end
    object memDescricao: TMemo
      Left = 346
      Top = 37
      Width = 430
      Height = 65
      Hint = 'Ex.: Atividades da faculdade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 255
      ParentFont = False
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
    ExplicitWidth = 848
    ExplicitHeight = 332
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
  object imgCollection: TImageCollection
    Images = <
      item
        Name = 'icone_save_green'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000097048597300000B1300000B1301009A9C180000013549444154789C
              ED95BF4EC33010C62D317540E52E8CAC3C050FC14354B0746262830AE92E5D18
              02BC007FA64C4CDC850C4808F5297805A4B00003A8C8AE8552481AA71DC9279D
              14C9CEFD7C67FBB3319DDAA8FF70BC814237A0FC8ACAD3E6A04F103E3369BA16
              0470C985DF41F902859F5C12A17175F871E52928DD6EA5A7BD46805D392825EE
              5B68647FAE9DEBC723A1A1AD049526EB39478B2BB0AB111AB50118634C24F12E
              28BDA1F2F3E6FDC9761000333AF07D3E028D0F7F072A3FA250F103CC6807855F
              2C240860CBF57DFEAADC60A102EF68505755236019C1FF024016EF875C387FB4
              F7DA035C729AD45F341FB339456B4068BBA094B403AC0E7027C2DAEFF280F3B2
              7DFC112A5FCFEC9A126FC379950FCD07E57E6E824A1F207CB9F0C101A5ABF007
              87E7BCC926877CDC6FAABA9329EB1B81BC989B03AB4EA80000000049454E44AE
              426082}
          end>
      end
      item
        Name = 'icons8-delete'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000097048597300000B1300000B1301009A9C18000000E349444154789C
              ED95BF0E014110C6AFD2F266F27DB20D059E427B1D4A3C015EC52B5C85F2D454
              CC24B2328868B8BDD848C44D32C9CEDFDFCE14BB49F217E29DAB09301672A764
              2EE4C87CD100428E04382BB034B5B300C36800257305160FDB40645EBE11B055
              D27FA89B970001FAB60E4B1460755D4D8802AB6BCDCDEE85ACC40069E8E4966B
              35E1ABFA3640808E02D9230E6442B66302D2E70645F10A905480E4FB8056ABAB
              C0FA29BE315F3440919406087010725A227F26C03E1870FF548E424E1418BC53
              CB11F2A4E43C18E09BCD867D303649D1FB6F37B7E6DEB97A30E0A7E402861F89
              9F58C41E5C0000000049454E44AE426082}
          end>
      end
      item
        Name = 'icons8-edit'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000097048597300000B1300000B1301009A9C180000012F49444154789C
              E594B14A0341108617B4F50914BD9D186CF20E7986BC818D160716121B2B5B9D
              D168697A8B1004B5F1814E764EB08EA9F4E4CFED9223E53936E687816506BE99
              F98F39E7D65EDDD13B75AEF51881B729DC8BE6243A27D12AC69CB83CB4820F01
              F5AC4FDD9B621BE139BCA2C9AE94DE062E3AE95F549B29BF7FF9B6833CEC6A0D
              CF58CF92259EF5AE594B0D320E47BF827BD109E0F17D8B1A36815DC4FAD9CAA2
              AC014FB6009E36413ED67333CFA1B449AC0F9D25BC0F5B9693B7829FD6D385E9
              2ADC4DAB0D627DA8E1E17CBDE0F99F797E70F5B145A2332FFA6C0E8788C320AE
              7EEFACE190671D1387EF85FF1C46C899C1638382243C021E2F740CBB4CE02465
              AF9E5C5F164D247CC50B9DB53AFF5575389C34FE9245B46B800FEF2C9489EED5
              4DCA9E09D0FD17FD0016C7437DCCA8ED6D0000000049454E44AE426082}
          end>
      end
      item
        Name = 'icons8-erase'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000097048597300000B1300000B1301009A9C180000011449444154789C
              E5D53F4A03411886F15F155B134F60972AB730958D1EC02A10F0021E44B11473
              034D21E6020A82B1536F904E3BB5F01F03DFC22226995D57107C619A61F67976
              BE996F97FF986DDCE11123B49B840FF18E0B1CE01953749A800FF08633ACC4DC
              069E7083B5A6E19A920C16C07F2C1946CDC7682D59DB2F9D49BB0AFC3403FE55
              32FA0D78917D3CC8809FD780A7F597B85D067FC50CDD8AF0713CBF35AF438BB2
              F44230CB9494E1E925BFCD7D746851966EA6240B2E0E261D5039DD25926C78CA
              715CB17EA6A415E5CC828BE698664A5A55E1453A9992491D788EA41757B836BC
              C82AAEF082CD984B653909F8AE0652DEC96174E807AEB13767AC5795B47114BF
              C7045F34D2277DA7899DFDAD7C029353695EAE8711B10000000049454E44AE42
              6082}
          end>
      end>
    Left = 544
    Top = 208
  end
  object imgList: TVirtualImageList
    Images = <
      item
        CollectionIndex = 0
        CollectionName = 'icone_save_green'
        Name = 'icone_save_green'
      end
      item
        CollectionIndex = 1
        CollectionName = 'icons8-delete'
        Name = 'icons8-delete'
      end
      item
        CollectionIndex = 2
        CollectionName = 'icons8-edit'
        Name = 'icons8-edit'
      end
      item
        CollectionIndex = 3
        CollectionName = 'icons8-erase'
        Name = 'icons8-erase'
      end>
    ImageCollection = imgCollection
    Width = 24
    Height = 24
    Left = 616
    Top = 208
  end
end
