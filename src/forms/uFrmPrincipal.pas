unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids;

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
    dbgTarefas: TDBGrid;
    btnCategorias: TButton;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure edtCategoriaIdDblClick(Sender: TObject);
    procedure btnCategoriasClick(Sender: TObject);
  private
    FTarefaIdEdicao: Integer;
    FModoEdicao: Boolean;

    procedure LimparCampos;

    procedure CadastrarTarefa(ACategoriaId: Integer);
    procedure AtualizarTarefa(ACategoriaId: Integer);

  public
  end;



var
  frmPrincipal: TfrmPrincipal;

implementation


uses
  uDmPrincipal, uValidacoes,uFrmConsultaCategorias,
  uFrmCategorias;

{$R *.dfm}

procedure TfrmPrincipal.LimparCampos;
begin
  edtTitulo.Clear;
  edtCategoriaId.Clear;
  memDescricao.Clear;

  // Retorna o botão ao modo de cadastro.
  btnSalvar.Caption := 'Salvar';

  edtTitulo.SetFocus;
end;

procedure TfrmPrincipal.CadastrarTarefa(ACategoriaId: Integer);
begin
  with dmPrincipal.qryTarefas do
  begin
    Close;

    ParamByName('TITULO').AsString := Trim(edtTitulo.Text);
    ParamByName('DESCRICAO').AsString := Trim(memDescricao.Lines.Text);
    ParamByName('CATEGORIA_ID').AsInteger := ACategoriaId;

    ExecSQL;
  end;
end;

procedure TfrmPrincipal.edtCategoriaIdDblClick(Sender: TObject);
begin
 // Cria a janela de consulta de categorias.
  with TfrmConsultaCategorias.Create(Self) do
  try
    // Aguarda a seleção de uma categoria.
    if ShowModal = mrOk then
    begin
      // Preenche o campo com o código selecionado.
      edtCategoriaId.Text := IntToStr(CategoriaIdSelecionada);
    end;
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.AtualizarTarefa(ACategoriaId: Integer);
begin
  with dmPrincipal.qryAtualizarTarefa do
  begin
    Close;

    ParamByName('ID').AsInteger := FTarefaIdEdicao;
    ParamByName('TITULO').AsString := Trim(edtTitulo.Text);
    ParamByName('DESCRICAO').AsString := Trim(memDescricao.Lines.Text);
    ParamByName('CATEGORIA_ID').AsInteger := ACategoriaId;

    ExecSQL;
  end;
end;

procedure TfrmPrincipal.btnCategoriasClick(Sender: TObject);
begin
  // Abre o cadastro de categorias em uma janela modal.
  with TfrmCategorias.Create(Self) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.btnEditarClick(Sender: TObject);

begin
  if dmPrincipal.qryListarTarefas.IsEmpty then
  begin
    ShowMessage('Selecione uma tarefa para editar.');
    Exit;
  end;
  FTarefaIdEdicao :=
    dmPrincipal.qryListarTarefas.FieldByName('ID').AsInteger;

  edtTitulo.Text :=
    dmPrincipal.qryListarTarefas.FieldByName('TITULO').AsString;

  edtCategoriaId.Text :=
    dmPrincipal.qryListarTarefas.FieldByName('CATEGORIA_ID').AsString;

  memDescricao.Text :=
    dmPrincipal.qryListarTarefas.FieldByName('DESCRICAO').AsString;

  FModoEdicao := True;

  // Indica que o formulário está em modo de edição.
  btnSalvar.Caption := 'Atualizar';

  edtTitulo.SetFocus;
end;

procedure TfrmPrincipal.btnExcluirClick(Sender: TObject);
var
  TarefaId: Integer;
begin
  // Verifica se existe alguma tarefa na listagem
  if dmPrincipal.qryListarTarefas.IsEmpty then
  begin
    ShowMessage('Não existem tarefas para excluir.');
    Exit;
  end;
   // Obtém o código da tarefa selecionada
  TarefaId :=
    dmPrincipal.qryListarTarefas.FieldByName('ID').AsInteger;

   // Solicita confirmação antes de excluir
  if MessageDlg(
    'Deseja realmente excluir a tarefa ' + IntToStr(TarefaId) + '?',
    mtConfirmation,
    [mbYes, mbNo],
    0
  ) <> mrYes then
    Exit;

  try
    with dmPrincipal.qryExcluirTarefa do
    begin
      ParamByName('ID').AsInteger := TarefaId;
      ExecSQL;
    end;

    // Atualiza a listagem
    dmPrincipal.qryListarTarefas.Close;
    dmPrincipal.qryListarTarefas.Open;

    LimparCampos;

    ShowMessage('Tarefa excluída com sucesso!');

  except
    on E: Exception do
      ShowMessage('Erro ao excluir tarefa: ' + E.Message);
  end;
end;

procedure TfrmPrincipal.btnLimparClick(Sender: TObject);
begin
  LimparCampos;
end;


procedure TfrmPrincipal.btnSalvarClick(Sender: TObject);
var
  CategoriaId: Integer;
  EstavaEditando: Boolean;
begin
  // Verifica se o título foi preenchido.
  if not TextoObrigatorio(edtTitulo.Text) then
  begin
    ShowMessage('Informe o título da tarefa.');
    edtTitulo.SetFocus;
    Exit;
  end;
  // Verifica se o título respeita o tamanho permitido no banco.
  if not TextoDentroLimite(edtTitulo.Text, 100) then
  begin
    ShowMessage('O título deve ter no máximo 100 caracteres.');
    edtTitulo.SetFocus;
    Exit;
  end;

  // Verifica se a descrição respeita o tamanho permitido no banco.
  if not TextoDentroLimite(memDescricao.Text, 500) then
  begin
    ShowMessage('A descrição deve ter no máximo 500 caracteres.');
    memDescricao.SetFocus;
    Exit;
  end;

  // Valida se a categoria foi informada
  if not TextoObrigatorio(edtCategoriaId.Text) then
  begin
    ShowMessage('Informe o código da categoria.');
    edtCategoriaId.SetFocus;
    Exit;
  end;

  // Valida se o código da categoria é um inteiro positivo
  if not InteiroPositivoValido(edtCategoriaId.Text) then
  begin
    ShowMessage('Informe um código de categoria inteiro e maior que zero.');
    edtCategoriaId.SetFocus;
    Exit;
  end;

  // Converte o código após confirmar que ele é válido.
  CategoriaId := StrToInt(Trim(edtCategoriaId.Text));

  // Verifica se a categoria informada existe no banco.
  if not dmPrincipal.CategoriaExiste(CategoriaId) then
  begin
    ShowMessage('A categoria informada não está cadastrada.');
    edtCategoriaId.SetFocus;
    Exit;
  end;

  // Guarda o modo atual antes de limpar os campos.
  EstavaEditando := FModoEdicao;

  try
    // Decide se deve cadastrar ou atualizar
    if EstavaEditando then
      AtualizarTarefa(CategoriaId)
    else
      CadastrarTarefa(CategoriaId);

    // Atualiza os registros exibidos no DBGrid
    dmPrincipal.qryListarTarefas.Close;
    dmPrincipal.qryListarTarefas.Open;

    LimparCampos;

    if EstavaEditando then
      ShowMessage('Tarefa atualizada com sucesso!')
    else
      ShowMessage('Tarefa cadastrada com sucesso!');

  except
    on E: Exception do
      ShowMessage('Erro ao salvar tarefa: ' + E.Message);
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

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  dmPrincipal.qryListarTarefas.Open;
end;

end.

