program Employee;

uses
  Vcl.Forms,
  View.Main in 'View\View.Main.pas' {frmMain},
  Vcl.Themes,
  Vcl.Styles,
  Model.Empregado in 'Model\Model.Empregado.pas',
  Model.Funcao in 'Model\Model.Funcao.pas',
  Model.Departamento in 'Model\Model.Departamento.pas',
  View.Empregados in 'View\View.Empregados.pas' {frmEmpregados},
  View.Effects in 'View\View.Effects.Pas',
  Model.DM.Conexao in 'Model\Model.DM.Conexao.pas' {DBConnection: TDataModule},
  View.Departamentos in 'View\View.Departamentos.pas' {frmDepartamentos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDBConnection, DBConnection);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
