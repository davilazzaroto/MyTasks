unit uDmPrincipal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.Phys.IBBase, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet;

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
  private
    { Private declarations }
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

procedure TdmPrincipal.DataModuleCreate(Sender: TObject);
var
  SenhaBanco: string;
begin
  SenhaBanco := GetEnvironmentVariable('MYTASKS_DB_PASSWORD');

  if SenhaBanco = '' then
    raise Exception.Create(
      'Variável MYTASKS_DB_PASSWORD não configurada.'
    );

  conBanco.Params.Password := SenhaBanco;

  try
    conBanco.Connected := True;
  except
    on E: Exception do
      raise Exception.Create(
        'Não foi possível conectar ao Firebird: ' + E.Message
      );

      end;
    end;
procedure TdmPrincipal.qryListarCategoriasCadastroBeforeDelete(
  DataSet: TDataSet);
begin
  // Impede exclusões realizadas diretamente pelo DBGrid.
  Abort;
end;

procedure TdmPrincipal.qryListarTarefasBeforeDelete(DataSet: TDataSet);
begin
  // Impedir exclusões realizadas diretamente pelo DBGrid.
  Abort
end;

end.
