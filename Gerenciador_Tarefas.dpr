program Gerenciador_Tarefas;

uses
  Vcl.Forms,
  uFrmPrincipal in 'src\forms\uFrmPrincipal.pas' {frmPrincipal},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Luna');
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
