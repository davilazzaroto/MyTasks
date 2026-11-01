program Gerenciador_Tarefas;

uses
  Vcl.Forms,
  uFrmPrincipal in 'src\forms\uFrmPrincipal.pas' {frmPrincipal},
  Vcl.Themes,
  Vcl.Styles,
  uDmPrincipal in 'src\datamodules\uDmPrincipal.pas' {dmPrincipal: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Luna');
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.Run;
end.
