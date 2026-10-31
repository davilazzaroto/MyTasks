unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    lblTitulo: TLabel;
    edtTitulo: TEdit;
    lblDescricao: TLabel;
    memDescricao: TMemo;
    btnSalvar: TButton;
    btnExcluir: TButton;
    btnEditar: TButton;
    btnLimpar: TButton;
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnSalvarClick(Sender: TObject);
begin
  if Trim(edtTitulo.Text) = '' then
  begin
    ShowMessage('Informe o título da tarefa.');
    edtTitulo.SetFocus;
    Exit;
  end;

  ShowMessage(
    'Título: ' + edtTitulo.Text + sLineBreak +
    'Descrição: ' + memDescricao.Lines.Text
  );
end;

end.
