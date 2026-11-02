unit uFrmDetalhesTarefa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmDetalhesTarefa = class(TForm)
    lblTituloFixo: TLabel;
    lblTituloValor: TLabel;
    lblCategoriaFixa: TLabel;
    lblCategoriaValor: TLabel;
    lblSituacaoFixa: TLabel;
    lblSituacaoValor: TLabel;
    lblDescricaoFixa: TLabel;
    memDescricaoDetalhes: TMemo;
    lblDataFixa: TLabel;
    lblDataValor: TLabel;
    btnFechar: TButton;
  private
    { Private declarations }
  public

  procedure CarregarTarefa(ATitulo, ACategoria, ASituacao,
    ADescricao: string; ADataCriacao: TDateTime);
  end;

var
  frmDetalhesTarefa: TfrmDetalhesTarefa;

implementation

{$R *.dfm}
procedure TfrmDetalhesTarefa.CarregarTarefa(
  ATitulo, ACategoria, ASituacao, ADescricao: string;
  ADataCriacao: TDateTime);
begin
  // Preenche os campos com as informações da tarefa.
  lblTituloValor.Caption := ATitulo;
  lblCategoriaValor.Caption := ACategoria;
  lblSituacaoValor.Caption := ASituacao;

  memDescricaoDetalhes.Lines.Text := ADescricao;

  // Formata a data e o horário de criação.
  lblDataValor.Caption :=
    FormatDateTime('dd/mm/yyyy hh:nn', ADataCriacao);
end;

end.
