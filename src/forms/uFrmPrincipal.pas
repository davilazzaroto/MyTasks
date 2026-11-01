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
    lblCategoria: TLabel;
    edtCategoriaId: TEdit;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    procedure LimparCampos;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  uDmPrincipal;

{$R *.dfm}

procedure TfrmPrincipal.LimparCampos;
begin
  edtTitulo.Clear;
  edtCategoriaId.Clear;
  memDescricao.Clear;

  edtTitulo.SetFocus;
end;

procedure TfrmPrincipal.btnLimparClick(Sender: TObject);
begin
  LimparCampos;
end;

procedure TfrmPrincipal.btnSalvarClick(Sender: TObject);
var
  CategoriaId: Integer;

begin
  // Verifica se o título foi informado
  if Trim(edtTitulo.Text) = '' then
  begin
    ShowMessage('Informe o título da tarefa.');
    edtTitulo.SetFocus;
    Exit;
  end;

  // Verifica se a categoria foi informada
  if Trim(edtCategoriaId.Text) = '' then
  begin
    ShowMessage('Informe o código da categoria.');
    edtCategoriaId.SetFocus;
    Exit;
  end;

  // Verifica se o código da categoria é válido
  if not TryStrToInt(Trim(edtCategoriaId.Text), CategoriaId) then
  begin
    ShowMessage('O código da categoria deve ser numérico.');
    edtCategoriaId.SetFocus;
    Exit;
  end;

  if CategoriaId <= 0 then
  begin
    ShowMessage('Informe um código de categoria válido.');
    edtCategoriaId.SetFocus;
    Exit;
  end;
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

    try
    with dmPrincipal.qryTarefas do
    begin
      Close;

      ParamByName('TITULO').AsString := Trim(edtTitulo.Text);
      ParamByName('DESCRICAO').AsString := Trim(memDescricao.Lines.Text);
      ParamByName('CATEGORIA_ID').AsInteger := CategoriaId;

      ExecSQL;
    end;

    ShowMessage('Tarefa cadastrada com sucesso!');

    LimparCampos;
    edtTitulo.SetFocus;

  except
    on E: Exception do
      ShowMessage('Erro ao cadastrar tarefa: ' + E.Message);
  end;
end;
end;

procedure TfrmPrincipal.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    if ActiveControl is TMemo then
      Exit;

    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

end.

