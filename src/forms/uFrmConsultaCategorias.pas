unit uFrmConsultaCategorias;


interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls;

type
  TfrmConsultaCategorias = class(TForm)
    pnlCabecalho: TPanel;
    lblSubtituloConsulta: TLabel;
    lblTituloConsulta: TLabel;
    pnlPesquisa: TPanel;
    edtPesquisa: TEdit;
    lblPesquisa: TLabel;
    pnlRodape: TPanel;
    btnFechar: TButton;
    pnlListagem: TPanel;
    dbgCategorias: TDBGrid;
    lblRodape: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure dbgCategoriasDblClick(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
  private
      FCategoriaIdSelecionada: Integer;
      procedure PesquisarCategorias;

  public
    property CategoriaIdSelecionada: Integer
    read FCategoriaIdSelecionada;
  end;

var
  frmConsultaCategorias: TfrmConsultaCategorias;

implementation
  uses
    uDmPrincipal;

{$R *.dfm}

procedure TfrmConsultaCategorias.PesquisarCategorias;
begin
  with dmPrincipal.qryListarCategorias do
  begin
    // Fecha a consulta antes de atualizar o parâmetro.
    Close;

    // Adiciona % para permitir pesquisar por parte do texto.
    ParamByName('PESQUISA').AsString :=
      '%' + UpperCase(Trim(edtPesquisa.Text)) + '%';

    // Executa novamente a consulta com o filtro informado.
    Open;
  end;
end;

procedure TfrmConsultaCategorias.btnFecharClick(Sender: TObject);
begin
  // Fecha a consulta sem retornar uma categoria.
  ModalResult := mrCancel;
end;

procedure TfrmConsultaCategorias.btnConfirmarClick(Sender: TObject);
begin
   // Verifica se existe uma categoria disponível para seleção.
  if dmPrincipal.qryListarCategorias.IsEmpty then
  begin
    ShowMessage('Selecione uma categoria.');
    Exit;
  end;
   // Armazena o código da categoria selecionada.
  FCategoriaIdSelecionada :=
    dmPrincipal.qryListarCategorias.FieldByName('ID').AsInteger;

  // Fecha a consulta informando que a seleção foi confirmada.
  ModalResult := mrOk;
end;

procedure TfrmConsultaCategorias.dbgCategoriasDblClick(Sender: TObject);
begin
  // Reaproveita a mesma lógica do botão Confirmar.
  btnConfirmarClick(Sender);
end;

procedure TfrmConsultaCategorias.edtPesquisaChange(Sender: TObject);
begin
  // Atualiza a listagem conforme o usuário digita.
  PesquisarCategorias;
end;

procedure TfrmConsultaCategorias.FormShow(Sender: TObject);
begin
  // Carrega todas as categorias ao abrir a consulta.
  PesquisarCategorias;

  edtPesquisa.SetFocus;
end;

end.
