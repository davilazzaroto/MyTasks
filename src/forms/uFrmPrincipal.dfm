object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Cursor = crHandPoint
  Caption = 'Gerenciador de Tarefas'
  ClientHeight = 652
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
    Height = 217
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitWidth = 957
    ExplicitHeight = 237
    object dbgTarefas: TDBGrid
      Left = 0
      Top = 0
      Width = 959
      Height = 217
      Align = alClient
      Color = clWhite
      DataSource = dmPrincipal.dsTarefas
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
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
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 480
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CATEGORIA'
          Title.Caption = 'Categoria'
          Width = 180
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STATUS_TAREFA'
          Title.Caption = 'Situa'#231#227'o'
          Width = 130
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_CRIACAO'
          Title.Caption = 'Data de cria'#231#227'o'
          Width = 170
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
    ExplicitLeft = -8
    ExplicitTop = 81
    object lblCategoria: TLabel
      Left = 400
      Top = 52
      Width = 74
      Height = 23
      Caption = 'Categoria'
    end
    object lblDescricao: TLabel
      Left = 40
      Top = 118
      Width = 73
      Height = 23
      Caption = 'Descri'#231#227'o'
    end
    object lblTitulo: TLabel
      Left = 40
      Top = 52
      Width = 116
      Height = 23
      Caption = 'T'#237'tulo da tarefa'
    end
    object btnCategorias: TButton
      Left = 726
      Top = 81
      Width = 123
      Height = 32
      Caption = 'Categorias'
      ImageIndex = 4
      ImageName = 'icons8-folder'
      Images = imgLista
      TabOrder = 8
      OnClick = btnCategoriasClick
    end
    object btnEditar: TButton
      Left = 168
      Top = 228
      Width = 100
      Height = 32
      Cursor = crHandPoint
      Caption = 'Editar'
      ImageIndex = 2
      ImageName = 'icons8-edit'
      Images = imgLista
      TabOrder = 4
      OnClick = btnEditarClick
    end
    object btnExcluir: TButton
      Left = 296
      Top = 227
      Width = 100
      Height = 32
      Cursor = crHandPoint
      Caption = 'Excluir'
      ImageIndex = 3
      ImageName = 'icons8-delete'
      Images = imgLista
      TabOrder = 5
      OnClick = btnExcluirClick
    end
    object btnLimpar: TButton
      Left = 424
      Top = 228
      Width = 100
      Height = 32
      Cursor = crHandPoint
      Caption = 'Limpar'
      ImageIndex = 0
      ImageName = 'icons8-erase'
      Images = imgLista
      TabOrder = 6
      OnClick = btnLimparClick
    end
    object btnSalvar: TButton
      Left = 40
      Top = 228
      Width = 100
      Height = 32
      Cursor = crHandPoint
      Caption = 'Salvar'
      ImageIndex = 1
      ImageName = 'icone_save_green'
      Images = imgLista
      TabOrder = 3
      OnClick = btnSalvarClick
    end
    object edtCategoriaId: TEdit
      Left = 400
      Top = 81
      Width = 300
      Height = 31
      TabOrder = 1
      TextHint = 'Informe ou consulte uma categoria'
      OnDblClick = edtCategoriaIdDblClick
    end
    object edtTitulo: TEdit
      Left = 40
      Top = 81
      Width = 300
      Height = 31
      MaxLength = 100
      TabOrder = 0
      TextHint = 'Digite o t'#237'tulo da tarefa'
    end
    object memDescricao: TMemo
      Left = 40
      Top = 147
      Width = 786
      Height = 62
      MaxLength = 500
      ScrollBars = ssVertical
      TabOrder = 2
    end
    object pnlTituloCadastro: TPanel
      Left = 0
      Top = 0
      Width = 959
      Height = 45
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 7
      ExplicitWidth = 957
      object lblTituloCadastro: TLabel
        Left = 40
        Top = 6
        Width = 195
        Height = 31
        Caption = 'Cadastro de tarefa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -23
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
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
    ExplicitLeft = -8
    object lblNomeSistema: TLabel
      Left = 88
      Top = 9
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
      Left = 88
      Top = 65
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
    object imgCabecalho: TImage
      Left = 34
      Top = 26
      Width = 48
      Height = 48
      Center = True
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000300000
        003008060000005702F987000000097048597300000B1300000B1301009A9C18
        000003AE4944415478DAED994D4C134114C7675AFA658B098D46DB1AA1688821
        C6837A53E20563BCA818F56234F12217822269C12F6A2184D062C0C841AFEA45
        309A78502327118E1C8C0A51712B68AB6842A3B629A5DD7D3EFA15A45BDA6DB7
        DD6AFA4ED39DE99BFF6FF6EDDB37B394FCE346A516500210C3C93E1B947DD67D
        6B01C235A24333BA95F18F040E087101D05B957EC3C00B3B0D4B0F3004F2EA99
        AFCFB0552FE87F4046982AC3417282B29202543BDCED84D29E2CA7B732168353
        6200CF147AD9161754B176E3C044230DF18DDD751B14DE9F9E1604EE8D5E8129
        C662AACD3BC0A6EBB31A052BC795262729902A1420E71BA7D6C8CB279B36F856
        F3553B38A75B08B0BF793B0158A0E413B6EE85646CEF97D6CD819C0122E2B9B2
        111CB8273D2AB4AB7DDEFE49FBF6455EF1B637CA056DC5854C420E1FF671CE17
        AC9FB19B177202303BDC764A69477AF179311B633176E606E0744F5342B7C486
        27C578A5CDA596EB54CFB15927481AC028EB5F3CB07C85573E2378173EB82CC6
        9A9C0030CB84E331AFF6CDABF8C263EB8DF72A6E5167C1094FE3B466042EE3D5
        4C204C813238EE8EC63FEFE4F31509339D3E18836419AB89D757E6004E0FC4DB
        783B0BF2E616326709A00450022804C052C137EB69028E9CC50C652614E600C8
        B012945DEFDAD627BD958B0A60292D06B4FAFB949223499D405E294051B712A2
        6800A2A5837E186739946A0C3A77E0CBAAADE800F8C5435FC0476C6AADEC0CA5
        3018BD042E7C59551715400AF1DD583A5F89F42FAF48810418AB714DD100A413
        1FF1E970F76179D21ABB03AFF10EEC280A80CCC47BBAB1FF52420040F347ABE9
        A6E400D98847C78F5C3EC33162A79CA4009154A9D30F61E7E1843800A7CB6AB2
        C67FE3BEA20BF7150918AC4C9FC895FEA3D3E76A82D92E9A2800628B2F3840F2
        8E6DF5B041F58FD5FEF9E3A9B69D5200BC4580DA98B81E4C8909B1D9882F2840
        4D9F7B5D9823DF3125623221C1903C5C113F49C0AD6827D63D5713DA019ECA55
        FE865461230900E6F30614FF30BAB8641C4B82BD913DB256D5819E2F0A5DF982
        03989D9E7EBC703EB6C29308E345B1BBB17053652BBED00013786167AAFF0A09
        1B8900DCBF30CECB57AAC63F4C61EB81C6EFED16B2F252005C43806654CCA0A7
        97F8248FCA42746CFAB2F18750D19200E4CB4A00FF174006478B629AE8478B7F
        1FEEAE7E7C2E8AF865C7EFA21CEEC6328D2D1F8233B0DC8FD7857DE010D1808C
        B1FEE0FE9C3F702C59EC1B8015F3FD294AC09CEA1353EEA28105425D588ADC65
        7D41473AF1190314B39500A4B61280D4F607D7AFAC4F80A61448000000004945
        4E44AE426082}
      Proportional = True
      Stretch = True
      Transparent = True
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
      Left = 632
      Top = 16
      Width = 57
      Height = 33
      Caption = 'Filtrar:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTarefasCadastradas: TLabel
      Left = 40
      Top = 18
      Width = 206
      Height = 31
      Caption = 'Tarefas cadastradas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -23
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cmbFiltroStatus: TComboBox
      Left = 695
      Top = 18
      Width = 180
      Height = 31
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 0
      Text = 'Todas'
      OnChange = cmbFiltroStatusChange
      Items.Strings = (
        'Todas'
        'Pendentes '
        'Conclu'#237'das')
    end
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 617
    Width = 959
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    ExplicitTop = 611
    object lblRodape: TLabel
      Left = 8
      Top = 6
      Width = 505
      Height = 23
      Caption = 
        'Duplo clique para detalhes '#8226' Bot'#227'o direito para alterar a situa'#231 +
        #227'o'
    end
  end
  object popTarefas: TPopupMenu
    OnPopup = popTarefasPopup
    Left = 912
    Top = 368
    object mnuConcluir: TMenuItem
      Caption = 'Concluir tarefa'
      OnClick = mnuConcluirClick
    end
    object mnuReabrir: TMenuItem
      Caption = 'Reabrir tarefa'
      OnClick = mnuReabrirClick
    end
  end
  object imgCollection: TImageCollection
    Images = <
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
      end
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
        Name = 'icons8-folder'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000097048597300000B1300000B1301009A9C180000017549444154789C
              ED94C12B445114C69FC45E167666CE9991C94E36FE00F6165636B2B653B2A430
              CC394F49364A3664A1ECEC14257F80C4CE66CC3B6746844416E2E9CD9846BDFB
              E6712765315F7DBDC5ADEF77EFD739CF719AFA374ABB5E3F929E21C907B2FA55
              03E92D922E0E6CF86D0D01827020BD06D61C902ED72CFB0114488E3359AFD31E
              C0F20E24F366B88C21EB2BB05C21CB4C9453AE8C38BEDF1201501F58E6A22E90
              58290D226BFE7B7D4693B8568058EDF9AD40BA8B2C8FB18034DDA48074AA5E1D
              66EB6165308A93DD4BF90E230073851E60798AAD82EB1B588ECC009675647D49
              B226E27B310B493783F10E0190340BAC77C8B26D1BDE377BD1FEB53B3BE11790
              5C56BEDE902D005847CB19AE0C875F50AE490BC144D80290E40048BD5046EDD7
              605EB69F08564B5DC0F2862C0BA1C32A2099F37A1D4B2117A7838C842B9928C0
              896D7820243907D653C72464BD0F0E7FBF5C5236906E7D5D723C02E04D20E983
              F572913C03EB5A2303D294F327FA047E538A53A7946F9F0000000049454E44AE
              426082}
          end>
      end
      item
        Name = 'icons8-task-menu'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000097048597300000B1300000B1301009A9C180000028649444154789C
              ED99CD6AD54014C783DAFA41DDE94228E88C45215B1FC067E87388B8B12A586E
              5AB5859E73450437BE820B3F16BAD0957A970A22BD16AB5810CEB988E0C24511
              7ADBC8A45AA66926F7E6CE988930076695C99CFF6FF2CF6472268A4284F01FE7
              93F480C4DE8C40FA2C913625725ADC6853F539057C59DD1335221EA4FB25F20B
              B36843037EAEEEF52D3F9240D72A8BDF69BD19DFFA2309BCA20B3A773F1D33F5
              55D724D015CD521F6A113979FBEB6101349F791CA86F9AD1F8DEB7894163A93E
              665B515FE51048732AA73BF1C89DE12C4157E36479DC283E591E1FD67202B973
              32593B640DA0667E748F5BB7963D40B6349A3DAE664922BFAABE0AD1CBFC0CE7
              DF1181BC6A0DA07BDE648FA9BBAB0725F2AC4A289036CCB6A00D09FC51005F37
              8D152B9B69EF843D8026C07A301F396500A81E3200681100FE6EF8DA74490075
              25F0BA445A13407076E9FBD1A8E9006A5914C08F8ABF05FCAE08A23100DB5B07
              7E3260CBB0D4488062F18427123A22A07741FB587D691C8041FCADC21D29F07A
              A3000689CFC6046A6B4FE07D63008613CF0BFAF5D340171B01308A7881FC304A
              D27DDE01B2A512F9F12E7140A0F7114037733BD3A76A173B6A4E6700AEC5D70E
              B0F78FADDC36CA6665BF9D3E00BA9AB8455BF1B5029C69D33109B4B56D1BFEA5
              571204D28D9CAD9E95D9C60B80049AD65694CECE3F32F0E228335F3B8040BEA3
              CD705741A8276123BE6E80B7A51BB50AB6F104403FF70807DACA9E06D07CD599
              F7013027917F08E037999D80A6A716F8F8BFCCE977301F396500F00D00834B8B
              2E23765D5ADC5DDC2D2F9FDB469C2BBF3B29EEFE5969D2FFB6BC3E59E980C361
              037EEDE480433B036809E04F65474CF6A2A99FE5406E39131F224488A8D1F11B
              D0F000428CAC898C0000000049454E44AE426082}
          end>
      end>
    Left = 568
    Top = 320
  end
  object imgLista: TVirtualImageList
    Images = <
      item
        CollectionIndex = 0
        CollectionName = 'icons8-erase'
        Name = 'icons8-erase'
      end
      item
        CollectionIndex = 1
        CollectionName = 'icone_save_green'
        Name = 'icone_save_green'
      end
      item
        CollectionIndex = 2
        CollectionName = 'icons8-edit'
        Name = 'icons8-edit'
      end
      item
        CollectionIndex = 3
        CollectionName = 'icons8-delete'
        Name = 'icons8-delete'
      end
      item
        CollectionIndex = 4
        CollectionName = 'icons8-folder'
        Name = 'icons8-folder'
      end>
    ImageCollection = imgCollection
    Width = 24
    Height = 24
    Left = 640
    Top = 320
  end
end
