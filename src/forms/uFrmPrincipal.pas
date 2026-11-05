unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.Menus, Vcl.ExtCtrls, System.ImageList, Vcl.ImgList,
  Vcl.VirtualImageList, Vcl.BaseImageCollection, Vcl.ImageCollection,
  Vcl.Imaging.pngimage,System.IniFiles;

type
  TfrmPrincipal = class(TForm)
    popTarefas: TPopupMenu;
    mnuConcluir: TMenuItem;
    mnuReabrir: TMenuItem;
    pnlCabecalho: TPanel;
    pnlCadastro: TPanel;
    pnlListagem: TPanel;
    btnCategorias: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    btnLimpar: TButton;
    btnSalvar: TButton;
    edtCategoriaId: TEdit;
    edtTitulo: TEdit;
    lblCategoria: TLabel;
    lblDescricao: TLabel;
    lblTitulo: TLabel;
    memDescricao: TMemo;
    dbgTarefas: TDBGrid;
    pnlFiltro: TPanel;
    lblFiltrar: TLabel;
    cmbFiltroStatus: TComboBox;
    lblNomeSistema: TLabel;
    lblSubtitulo: TLabel;
    pnlTituloCadastro: TPanel;
    lblTituloCadastro: TLabel;
    lblTarefasCadastradas: TLabel;
    imgCollection: TImageCollection;
    imgLista: TVirtualImageList;
    imgCabecalho: TImage;
    pnlRodape: TPanel;
    lblRodape: TLabel;
    cmbFiltroCategoria: TComboBox;
    lblCategoriaFiltro: TLabel;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure edtCategoriaIdDblClick(Sender: TObject);
    procedure btnCategoriasClick(Sender: TObject);
    procedure cmbFiltroStatusChange(Sender: TObject);
    procedure mnuConcluirClick(Sender: TObject);
    procedure mnuReabrirClick(Sender: TObject);
    procedure popTarefasPopup(Sender: TObject);
    procedure dbgTarefasDblClick(Sender: TObject);
    procedure cmbFiltroCategoriaChange(Sender: TObject);
  private
    FTarefaIdEdicao: Integer;
    FModoEdicao: Boolean;

    procedure LimparCampos;


    procedure CadastrarTarefa(ACategoriaId: Integer);
    procedure AtualizarTarefa(ACategoriaId: Integer);
    procedure AtualizarListagem;
    procedure AlterarStatusTarefa(ANovoStatus: Integer);
    procedure CarregarCategoriasFiltro;
  public
  end;



var
  frmPrincipal: TfrmPrincipal;

implementation


uses
  uDmPrincipal, uValidacoes,uFrmConsultaCategorias,
  uFrmCategorias,uFrmDetalhesTarefa;

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

procedure TfrmPrincipal.mnuConcluirClick(Sender: TObject);
begin
  AlterarStatusTarefa(1);
end;

procedure TfrmPrincipal.mnuReabrirClick(Sender: TObject);
begin
  AlterarStatusTarefa(0);
end;

procedure TfrmPrincipal.popTarefasPopup(Sender: TObject);
begin
var
  Concluida: Boolean;
begin
  if dmPrincipal.qryListarTarefas.IsEmpty then
  begin
    mnuConcluir.Enabled := False;
    mnuReabrir.Enabled := False;
    Exit;
  end;

  Concluida :=
    dmPrincipal.qryListarTarefas.FieldByName('CONCLUIDA').AsInteger = 1;

  // Habilita apenas a operação adequada ao status atual.
  mnuConcluir.Enabled := not Concluida;
  mnuReabrir.Enabled := Concluida;
end;
end;

procedure TfrmPrincipal.CadastrarTarefa(ACategoriaId: Integer);
begin
  with dmPrincipal.qryCadastrarTarefas do
  begin
    Close;

    ParamByName('TITULO').AsString := Trim(edtTitulo.Text);
    ParamByName('DESCRICAO').AsString := Trim(memDescricao.Lines.Text);
    ParamByName('CATEGORIA_ID').AsInteger := ACategoriaId;

    ExecSQL;
  end;
end;

procedure TfrmPrincipal.cmbFiltroCategoriaChange(Sender: TObject);
begin
  AtualizarListagem;
end;

procedure TfrmPrincipal.cmbFiltroStatusChange(Sender: TObject);
begin
  AtualizarListagem;
end;

procedure TfrmPrincipal.dbgTarefasDblClick(Sender: TObject);
begin
  // Verifica se existe uma tarefa selecionada.
  if dmPrincipal.qryListarTarefas.IsEmpty then
  begin
    ShowMessage('Selecione uma tarefa para visualizar.');
    Exit;
  end;

  // Cria a janela de detalhes.
  with TfrmDetalhesTarefa.Create(Self) do
  try
    // Envia as informações da tarefa selecionada.
    CarregarTarefa(
      dmPrincipal.qryListarTarefas.FieldByName('TITULO').AsString,
      dmPrincipal.qryListarTarefas.FieldByName('CATEGORIA').AsString,
      dmPrincipal.qryListarTarefas.FieldByName('STATUS_TAREFA').AsString,
      dmPrincipal.qryListarTarefas.FieldByName('DESCRICAO').AsString,
      dmPrincipal.qryListarTarefas.FieldByName('DATA_CRIACAO').AsDateTime
    );

    // Exibe a janela e aguarda o usuário fechá-la.
    ShowModal;
  finally
    Free;
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
procedure TfrmPrincipal.AtualizarListagem;
var
  StatusFiltro: Integer;
  CategoriaFiltro: Integer;
begin
  // Identifica a situação selecionada.
  case cmbFiltroStatus.ItemIndex of
    1: StatusFiltro := 0;  // Pendentes
    2: StatusFiltro := 1;  // Concluídas
  else
    StatusFiltro := -1;    // Todas
  end;

  // Identifica a categoria selecionada.
  CategoriaFiltro := -1;

  if cmbFiltroCategoria.ItemIndex >= 0 then
    CategoriaFiltro := NativeInt(
      cmbFiltroCategoria.Items.Objects[cmbFiltroCategoria.ItemIndex]
    );

  // Atualiza a listagem aplicando os dois filtros.
  with dmPrincipal.qryListarTarefas do
  begin
    Close;

    ParamByName('STATUS').AsInteger := StatusFiltro;
    ParamByName('CATEGORIA_ID').AsInteger := CategoriaFiltro;

    Open;
  end;
end;

procedure TfrmPrincipal.AlterarStatusTarefa(ANovoStatus: Integer);
var
  TarefaId: Integer;
  Mensagem: string;
begin
  // Verifica se existe uma tarefa selecionada.
  if dmPrincipal.qryListarTarefas.IsEmpty then
  begin
    ShowMessage('Selecione uma tarefa.');
    Exit;
  end;

  TarefaId :=
    dmPrincipal.qryListarTarefas.FieldByName('ID').AsInteger;

  // Verifica se a tarefa já possui o status solicitado.
  if dmPrincipal.qryListarTarefas.FieldByName('CONCLUIDA').AsInteger =
    ANovoStatus then
  begin
    ShowMessage('A tarefa já está nessa situação.');
    Exit;
  end;

  // Define a mensagem conforme a operação.
  if ANovoStatus = 1 then
    Mensagem := 'Deseja realmente concluir esta tarefa?'
  else
    Mensagem := 'Deseja realmente reabrir esta tarefa?';

  // Solicita confirmação antes de alterar.
  if MessageDlg(
    Mensagem,
    mtConfirmation,
    [mbYes, mbNo],
    0
  ) <> mrYes then
    Exit;

  try
    // Atualiza o status da tarefa no banco.
    with dmPrincipal.qryAlterarStatusTarefa do
    begin
      Close;

      ParamByName('ID').AsInteger := TarefaId;
      ParamByName('CONCLUIDA').AsInteger := ANovoStatus;

      ExecSQL;
    end;

    // Atualiza a listagem mantendo o filtro selecionado.
    AtualizarListagem;

    if ANovoStatus = 1 then
      ShowMessage('Tarefa concluída com sucesso!')
    else
      ShowMessage('Tarefa reaberta com sucesso!');

  except
    on E: Exception do
      ShowMessage('Erro ao alterar situação da tarefa: ' + E.Message);
  end;
end;

procedure TfrmPrincipal.CarregarCategoriasFiltro;
begin
  cmbFiltroCategoria.Items.Clear;

  // Opção para exibir tarefas de todas as categorias.
  cmbFiltroCategoria.Items.AddObject(
    'Todas as categorias',
    TObject(NativeInt(-1))
  );

  with dmPrincipal.qryListarCategorias do
  begin
    Close;

    // Retorna todas as categorias cadastradas.
    ParamByName('PESQUISA').AsString := '%';

    Open;
    First;

    while not Eof do
    begin
      cmbFiltroCategoria.Items.AddObject(
        FieldByName('NOME').AsString,
        TObject(NativeInt(FieldByName('ID').AsInteger))
      );

      Next;
    end;
  end;

  cmbFiltroCategoria.ItemIndex := 0;
end;

procedure TfrmPrincipal.btnCategoriasClick(Sender: TObject);
begin  // Abre o cadastro de categorias em uma janela modal.
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
    AtualizarListagem;

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
    AtualizarListagem;

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
  CarregarCategoriasFiltro;
  AtualizarListagem;
end;

end.

