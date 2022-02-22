unit View.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  dxGDIPlusClasses, View.Effects;

type
  TfrmMain = class(TForm)
    pnlHeader: TPanel;
    LBTNDepartamentos: TLabel;
    LBTNRelatorio: TLabel;
    LBTNEmpregados: TLabel;
    pnlView: TPanel;
    Image1: TImage;
    Shape1: TShape;
    LBTNSair: TLabel;
    shpTag: TShape;
    Procedure Hover(Sender : TObject);
    Procedure unlockMenu;
    procedure tagFocus(Sender: TObject);
    procedure LBTNEmpregadosClick(Sender: TObject);
    procedure LBTNRelatorioClick(Sender: TObject);
    procedure LBTNDepartamentosClick(Sender: TObject);
    procedure LBTNSairClick(Sender: TObject);
    procedure pnlViewMouseEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  frmMain: TfrmMain;

implementation
Uses
  View.Empregados,
  View.Departamentos;

Var
  vEmpregados : TfrmEmpregados;

{$R *.dfm}

{ TForm1 }


procedure TfrmMain.LBTNDepartamentosClick(Sender: TObject);
begin
  if pnlView.ControlCount = 0 then
  Begin
    tagFocus(Sender);

    frmDepartamentos := TfrmDepartamentos.Create(Self) ;
    frmDepartamentos.Parent := pnlView;
    frmDepartamentos.Show;
  End;

end;

procedure TfrmMain.LBTNEmpregadosClick(Sender: TObject);
begin
  if pnlView.ControlCount = 0 then
  Begin
    tagFocus(Sender);
    vEmpregados := TfrmEmpregados.Create(Self);
    vEmpregados.Parent := pnlView;
    vEmpregados.Show;
  End;

end;

procedure TfrmMain.LBTNRelatorioClick(Sender: TObject);
begin
  if pnlView.ControlCount = 0 then
  Begin
   tagFocus(Sender);
  End;
end;

procedure TfrmMain.LBTNSairClick(Sender: TObject);
begin
  if pnlView.ControlCount > 0 then
  Begin
    pnlView.Controls[0].Destroy;
    unlockMenu;
  End
  Else if
    MessageDlg('Encerrar aplicação ?',mtConfirmation,mbYesNo,0,mbYes) = idYes
  then
    Application.Terminate



end;

{$REGION ' >>> UI <<< '}
  procedure TfrmMain.tagFocus(Sender: TObject);
  begin
    if pnlView.ControlCount = 0 then
    Begin
      //Visibilidade
      shpTag.Visible := True;
      TLabel(Sender).Transparent := True;
      LBTNSair.Caption := 'Voltar';

      //Posição
      shpTag.Left := TLabel(Sender).Left + 37;
    End
    Else
      Exit ;

  end;

  procedure TfrmMain.unlockMenu;
  begin
    if pnlView.ControlCount = 0 then
    Begin
      LBTNSair.Caption := 'Sair';
      shpTag.Visible := False;
    End;

  end;

  procedure TfrmMain.hover(Sender: TObject);
  begin
    if (pnlView.ControlCount = 0) or (TLabel(Sender).Name = 'LBTNSair') then
      hoverEffect(Sender);
  End;

  procedure TfrmMain.pnlViewMouseEnter(Sender: TObject);
  begin
    unlockMenu;
  end;


{$ENDREGION}


end.
