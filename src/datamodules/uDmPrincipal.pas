unit uDmPrincipal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.Phys.IBBase, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet,System.IniFiles,Vcl.Dialogs,System.UITypes;

type
  TdmPrincipal = class(TDataModule)
    conBanco: TFDConnection;
    drvFirebird: TFDPhysFBDriverLink;
    qryCadastrarTarefas: TFDQuery;
    qryListarTarefas: TFDQuery;
    dsTarefas: TDataSource;
    qryExcluirTarefa: TFDQuery;
    qryAtualizarTarefa: TFDQuery;
    qryVerificarCategoria: TFDQuery;
    qryListarCategorias: TFDQuery;
    dsCategorias: TDataSource;
    qryCadastrarCategoria: TFDQuery;
    qryListarCategoriasCadastro: TFDQuery;
    dsCategoriasCadastro: TDataSource;
    qryAtualizarCategoria: TFDQuery;
    qryExcluirCategoria: TFDQuery;
    qryAlterarStatusTarefa: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure qryListarCategoriasCadastroBeforeDelete(DataSet: TDataSet);
    procedure qryListarTarefasBeforeDelete(DataSet: TDataSet);
    procedure qryListarCategoriasBeforeDelete(DataSet: TDataSet);
  private
    procedure CarregarConfiguracoes;
    procedure VerificarBanco;
    procedure CriarBanco;

  public
    function CategoriaExiste(ACategoriaId: Integer): Boolean;
  end;

var
  dmPrincipal: TdmPrincipal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function TdmPrincipal.CategoriaExiste(ACategoriaId: Integer): Boolean;
begin
  with qryVerificarCategoria do
  begin
    Close;

    ParamByName('ID').AsInteger := ACategoriaId;
    Open;

    // Retorna verdadeiro quando a categoria é encontrada.
    Result := not IsEmpty;

    Close;
  end;
end;

procedure TdmPrincipal.CarregarConfiguracoes;
var
  Config: TIniFile;
  CaminhoIni: string;
  SenhaBanco: string;
begin
  // Localiza o INI na pasta do executável.
  CaminhoIni := ExtractFilePath(ParamStr(0)) + 'config.ini';

  if not FileExists(CaminhoIni) then
    raise Exception.Create(
      'Arquivo config.ini não encontrado em: ' + CaminhoIni
    );

  // Recupera a senha da variável de ambiente.
  SenhaBanco := GetEnvironmentVariable('MYTASKS_DB_PASSWORD');

  if SenhaBanco = '' then
    raise Exception.Create(
      'Variável MYTASKS_DB_PASSWORD não configurada.'
    );

  Config := TIniFile.Create(CaminhoIni);
  try
    conBanco.Connected := False;
    conBanco.LoginPrompt := False;

    conBanco.Params.Clear;
    conBanco.Params.DriverID := 'FB';
    conBanco.Params.Values['Protocol'] := 'TCPIP';

    conBanco.Params.Values['Server'] :=
      Config.ReadString('Database', 'Server', 'localhost');

    conBanco.Params.Values['Port'] :=
      Config.ReadString('Database', 'Port', '3050');

    conBanco.Params.Database :=
      Config.ReadString('Database', 'Path', '');

    conBanco.Params.UserName :=
      Config.ReadString('Database', 'User', 'SYSDBA');

    conBanco.Params.Password := SenhaBanco;
    conBanco.Params.Values['CharacterSet'] := 'UTF8';
    conBanco.Params.Values['SQLDialect'] := '3';

  finally
    Config.Free;
  end;

  if Trim(conBanco.Params.Database) = '' then
    raise Exception.Create(
      'Caminho do banco não informado no config.ini.'
    );
end;

procedure TdmPrincipal.VerificarBanco;
var
  CaminhoBanco: string;
  Servidor: string;
begin
  CaminhoBanco := Trim(conBanco.Params.Database);
  Servidor := Trim(conBanco.Params.Values['Server']);

  // Para conexões remotas, o caminho pertence ao servidor.
  if not SameText(Servidor, 'localhost') and
     not SameText(Servidor, '127.0.0.1') then
    Exit;

  // Se o banco já existe, continua normalmente.
  if FileExists(CaminhoBanco) then
    Exit;

  // Solicita confirmação antes de criar um banco novo.
  if MessageDlg(
    'O banco de dados do MyTasks não foi encontrado.' +
    sLineBreak + sLineBreak +
    'Caminho: ' + CaminhoBanco +
    sLineBreak + sLineBreak +
    'Deseja criar um novo banco de dados?',
    mtConfirmation,
    [mbYes, mbNo],
    0
  ) <> mrYes then
    raise Exception.Create(
      'Inicialização cancelada. Banco de dados não encontrado.'
    );

  // Cria o banco somente após a confirmação.
  CriarBanco;
end;

procedure TdmPrincipal.CriarBanco;
var
  CaminhoBanco: string;
  PastaBanco: string;
begin
  CaminhoBanco := Trim(conBanco.Params.Database);
  PastaBanco := ExtractFilePath(CaminhoBanco);

  // Cria a pasta do banco, caso ainda não exista.
  if not DirectoryExists(PastaBanco) then
  begin
    if not ForceDirectories(PastaBanco) then
      raise Exception.Create(
        'Não foi possível criar a pasta: ' + PastaBanco
      );
  end;

  // Evita tentar criar um banco que já existe.
  if FileExists(CaminhoBanco) then
    raise Exception.Create(
      'Já existe um arquivo no caminho informado: ' + CaminhoBanco
    );

  // Solicita ao Firebird a criação de um novo banco.
  conBanco.Params.Values['CreateDatabase'] := 'Yes';

  try
    conBanco.Connected := True;
    conBanco.Connected := False;
  finally
    // Remove o parâmetro para as próximas conexões.
    conBanco.Params.Values['CreateDatabase'] := '';
  end;
end;


procedure TdmPrincipal.DataModuleCreate(Sender: TObject);
begin
  CarregarConfiguracoes;
  VerificarBanco;

  try
    conBanco.Connected := True;
  except
    on E: Exception do
      raise Exception.Create(
        'Não foi possível conectar ao Firebird.' +
        sLineBreak + E.Message
      );
  end;
end;

procedure TdmPrincipal.qryListarCategoriasBeforeDelete(DataSet: TDataSet);
begin
  // Impedir exclusões realizadas diretamente pelo DBGrid.
  Abort;
end;

procedure TdmPrincipal.qryListarTarefasBeforeDelete(DataSet: TDataSet);
begin
  // Impedir exclusões realizadas diretamente pelo DBGrid.
  Abort;
end;

procedure TdmPrincipal.qryListarCategoriasCadastroBeforeDelete(
  DataSet: TDataSet);
begin
  // Impede exclusões realizadas diretamente pelo DBGrid.
  Abort;
end;


end.
