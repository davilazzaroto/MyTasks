unit uFrmCategorias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids;

type
  TfrmCategorias = class(TForm)
    lblNome: TLabel;
    edtNome: TEdit;
    btnSalvar: TButton;
    btnExcluir: TButton;
    btnEditar: TButton;
    btnLimpar: TButton;
    dbgCategorias: TDBGrid;
    lblDescricao: TLabel;
    memDescricao: TMemo;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private

    FCategoriaIdEdicao: Integer;
    FModoEdicao: Boolean;

    procedure LimparCampos;
    procedure AtualizarListagem;
    procedure CadastrarCategoria;
    procedure AtualizarCategoria;
  public
    { Public declarations }
  end;

var
  frmCategorias: TfrmCategorias;

implementation

uses
    uDmPrincipal, uValidacoes;


{$R *.dfm}

procedure TfrmCategorias.LimparCampos;
begin
  // Limpa os campos do formulário.
  edtNome.Clear;
  memDescricao.Clear;

  // Encerra o modo de edição.
  FCategoriaIdEdicao := 0;
  FModoEdicao := False;

  // Retorna o botão ao modo de cadastro.
  btnSalvar.Caption := 'Salvar';

  edtNome.SetFocus;
end;

procedure TfrmCategorias.AtualizarListagem;
begin
  // Recarrega os registros exibidos no DBGrid.
  dmPrincipal.qryListarCategoriasCadastro.Close;
  dmPrincipal.qryListarCategoriasCadastro.Open;
end;


procedure TfrmCategorias.CadastrarCategoria;
begin
  with dmPrincipal.qryCadastrarCategoria do
  begin
    Close;

    ParamByName('NOME').AsString := Trim(edtNome.Text);
    ParamByName('DESCRICAO').AsString := Trim(memDescricao.Lines.Text);

    ExecSQL;
  end;
end;

procedure TfrmCategorias.AtualizarCategoria;
begin
  with dmPrincipal.qryAtualizarCategoria do
  begin
    Close;

    ParamByName('ID').AsInteger := FCategoriaIdEdicao;
    ParamByName('NOME').AsString := Trim(edtNome.Text);
    ParamByName('DESCRICAO').AsString := Trim(memDescricao.Lines.Text);

    ExecSQL;
  end;
end;

procedure TfrmCategorias.btnEditarClick(Sender: TObject);
begin
    // Verifica se existe uma categoria selecionada.
  if dmPrincipal.qryListarCategoriasCadastro.IsEmpty then
  begin
    ShowMessage('Selecione uma categoria para editar.');
    Exit;
  end;

  // Armazena o ID da categoria em edição.
  FCategoriaIdEdicao :=
    dmPrincipal.qryListarCategoriasCadastro.FieldByName('ID').AsInteger;

  // Preenche os campos com os dados selecionados.
  edtNome.Text :=
    dmPrincipal.qryListarCategoriasCadastro.FieldByName('NOME').AsString;

  memDescricao.Text :=
    dmPrincipal.qryListarCategoriasCadastro.FieldByName('DESCRICAO').AsString;

  FModoEdicao := True;
  // Indica visualmente que o usuário está editando uma categoria.
  btnSalvar.Caption := 'Atualizar';

  edtNome.SetFocus;

end;

procedure TfrmCategorias.btnExcluirClick(Sender: TObject);
var
  CategoriaId: Integer;
begin
  // Verifica se existem categorias na listagem.
  if dmPrincipal.qryListarCategoriasCadastro.IsEmpty then
  begin
    ShowMessage('Não existem categorias para excluir.');
    Exit;
  end;

  CategoriaId :=
    dmPrincipal.qryListarCategoriasCadastro.FieldByName('ID').AsInteger;

  // Solicita confirmação antes da exclusão.
  if MessageDlg(
    'Deseja realmente excluir a categoria ' + IntToStr(CategoriaId) + '?',
    mtConfirmation,
    [mbYes, mbNo],
    0
  ) <> mrYes then
    Exit;

  try
    with dmPrincipal.qryExcluirCategoria do
    begin
      Close;
      ParamByName('ID').AsInteger := CategoriaId;
      ExecSQL;
    end;

    AtualizarListagem;
    LimparCampos;

    ShowMessage('Categoria excluída com sucesso!');

  except
    on E: Exception do
      ShowMessage('Erro ao excluir categoria: ' + E.Message);
  end;
end;

procedure TfrmCategorias.btnLimparClick(Sender: TObject);
begin
  LimparCampos;
end;

procedure TfrmCategorias.btnSalvarClick(Sender: TObject);
var
  EstavaEditando: Boolean;
begin
  // Verifica se o nome da categoria foi preenchido.
  if not TextoObrigatorio(edtNome.Text) then
  begin
    ShowMessage('Informe o nome da categoria.');
    edtNome.SetFocus;
    Exit;
  end;

  // Valida o limite de caracteres do nome.
  if not TextoDentroLimite(edtNome.Text, 100) then
  begin
    ShowMessage('O nome deve ter no máximo 100 caracteres.');
    edtNome.SetFocus;
    Exit;
  end;

  // Valida o limite de caracteres da descrição.
  if not TextoDentroLimite(memDescricao.Lines.Text, 255) then
  begin
    ShowMessage('A descrição deve ter no máximo 255 caracteres.');
    memDescricao.SetFocus;
    Exit;
  end;

    // Guarda o modo atual antes de limpar os campos.
  EstavaEditando := FModoEdicao;

  try
    // Decide se deve cadastrar ou atualizar a categoria.
    if EstavaEditando then
      AtualizarCategoria
    else
      CadastrarCategoria;

    // Atualiza os registros exibidos no DBGrid.
    AtualizarListagem;

    // Limpa os campos e encerra o modo de edição.
    LimparCampos;

    // Exibe a mensagem correspondente à operação.
    if EstavaEditando then
      ShowMessage('Categoria atualizada com sucesso!')
    else
      ShowMessage('Categoria cadastrada com sucesso!');

  except
    on E: Exception do
      ShowMessage('Erro ao salvar categoria: ' + E.Message);
  end;
end;

procedure TfrmCategorias.FormShow(Sender: TObject);
begin
  // Carrega os registros ao abrir o cadastro de categorias.
  dmPrincipal.qryListarCategoriasCadastro.Close;
  dmPrincipal.qryListarCategoriasCadastro.Open;
end;

end.
