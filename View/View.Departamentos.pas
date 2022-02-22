unit View.Departamentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  View.Effects;

type
  TfrmDepartamentos = class(TForm)
    shpFooter: TShape;
    pnlClient: TPanel;
    Shape1: TShape;
    edtCod: TEdit;
    Label1: TLabel;
    Shape2: TShape;
    edtNome: TEdit;
    Label2: TLabel;
    Shape3: TShape;
    dbgDepto: TDBGrid;
    LBTNSalvar: TLabel;
    LBTNExcluir: TLabel;
    Label4: TLabel;
    edtLocal: TEdit;
    Shape4: TShape;
    dtsDepto: TDataSource;
    procedure addEffects(Sender: TObject);
    procedure LBTNExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LBTNSalvarClick(Sender: TObject);
    procedure dbgDeptoDblClick(Sender: TObject);
  private
    { Private declarations }
    Procedure Restart;
    Procedure carregaObj;
  public
    { Public declarations }
    Destructor Destroy ; Override;
  end;

var
  frmDepartamentos: TfrmDepartamentos;

implementation
Uses
  Model.Departamento;

Var
  objDepto : TDepartamento;

{$R *.dfm}
procedure TfrmDepartamentos.FormCreate(Sender: TObject);
begin
  Restart;
end;

procedure TfrmDepartamentos.LBTNSalvarClick(Sender: TObject);
begin

  Try
    carregaObj;
    objDepto.Salvar;
  Finally
    objDepto.Free;
    Restart;
  End;

end;

procedure TfrmDepartamentos.LBTNExcluirClick(Sender: TObject);
begin
  carregaObj;
  If
    MessageDlg('Confirma exclusão do item selecionado ?',mtWarning,mbYesNo,0,mbNo) = idYes
  then
    Try
      objDepto.Excluir;
    Finally
      Restart;
    End;
end;

procedure TfrmDepartamentos.addEffects(Sender: TObject);
begin
  GrowTextEffect(Sender);
  hoverEffect(Sender);
  ColorTextEffect(Sender,'$00E2E3D6','$00FFFFFF');
end;

procedure TfrmDepartamentos.carregaObj;
begin
  Try
    objDepto.Cod := StrToInt(edtCod.Text);
    objDepto.Nome := edtNome.Text;
    objDepto.Local := edtLocal.Text;
  Finally

  End;
end;

procedure TfrmDepartamentos.dbgDeptoDblClick(Sender: TObject);
begin
  edtCod.Text := dbgDepto.Columns.Items[0].Field.Value;
  edtNome.Text := dbgDepto.Columns.Items[1].Field.Value;
  edtLocal.Text := dbgDepto.Columns.Items[2].Field.Value;
end;

procedure TfrmDepartamentos.Restart;
begin
  edtCod.Clear;
  edtNome.Clear;
  edtLocal.Clear;

  objDepto := TDepartamento.Create;
  edtCod.Text := objDepto.getID;

  dtsDepto.DataSet := objDepto.FDQuery;
  objDepto.getData;

  dbgDepto.Columns.Items[1].Width := 400;
  dbgDepto.Columns.Items[2].Width := 300;
end;

destructor TfrmDepartamentos.Destroy;
begin
  Try
    objDepto.Free;
  Finally

  End;

  inherited;
end;


end.
