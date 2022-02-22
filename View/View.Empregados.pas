unit View.Empregados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  View.Effects, Vcl.ComCtrls, Vcl.WinXPickers, Vcl.DBCtrls, Vcl.Mask;

type
  TfrmEmpregados = class(TForm)
    shpFooter: TShape;
    pnlClient: TPanel;
    Shape1: TShape;
    edtCod: TEdit;
    Label1: TLabel;
    Shape2: TShape;
    edtNome: TEdit;
    Label2: TLabel;
    Shape3: TShape;
    dbgEmpregados: TDBGrid;
    LBTNSalvar: TLabel;
    LBTNExcluir: TLabel;
    Label4: TLabel;
    Shape4: TShape;
    dtsEmpregados: TDataSource;
    dtEditAdmissao: TDateTimePicker;
    Label3: TLabel;
    Shape5: TShape;
    dtsDepto: TDataSource;
    Label5: TLabel;
    Shape6: TShape;
    dtsFuncao: TDataSource;
    Label6: TLabel;
    Shape7: TShape;
    Label7: TLabel;
    Shape8: TShape;
    dblDepartamentos: TDBLookupComboBox;
    dblFuncao: TDBLookupComboBox;
    edtSalario: TEdit;
    edtComissao: TEdit;
    procedure addEffects(Sender: TObject);
    procedure LBTNExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LBTNSalvarClick(Sender: TObject);
    procedure dbgEmpregadosDblClick(Sender: TObject);
  private
    { Private declarations }
    Procedure Restart;
    Procedure carregaObj;
  public
    { Public declarations }
    Destructor Destroy ; Override;
    Function Moeda(AString : String) : Currency;
  end;

var
  frmEmpregados: TfrmEmpregados;

implementation
Uses
  Model.Empregado;

Var
  objEmpregado : TEmpregado;

{$R *.dfm}
procedure TfrmEmpregados.FormCreate(Sender: TObject);
begin
  Restart;
end;

procedure TfrmEmpregados.LBTNSalvarClick(Sender: TObject);
begin

  Try
    carregaObj;
    objEmpregado.Salvar;
  Finally
    objEmpregado.Free;
    Restart;
  End;

end;

function TfrmEmpregados.Moeda(AString: String): Currency;
Var
  valor : Currency ;
begin
  if not tryStrtoCurr(AString,valor) then
    valor := 0.00;

  Result := Valor;
end;

procedure TfrmEmpregados.LBTNExcluirClick(Sender: TObject);
begin
  carregaObj;
  If
    MessageDlg('Confirma exclusão do item selecionado ?',mtWarning,mbYesNo,0,mbNo) = idYes
  then
    Try
      objEmpregado.Excluir;
    Finally
      Restart;
    End;
end;

procedure TfrmEmpregados.addEffects(Sender: TObject);
begin
  GrowTextEffect(Sender);
  hoverEffect(Sender);
  ColorTextEffect(Sender,'$00B5B6A9','$00FFFFFF');
end;

procedure TfrmEmpregados.carregaObj;
begin
  Try
    objEmpregado.Cod := StrToInt(edtCod.Text);
    objEmpregado.Nome := edtNome.Text;
    objEmpregado.DataAdmissao := dtEditAdmissao.Date;
    objEmpregado.Salario := Moeda(edtSalario.Text);
    objEmpregado.Comissao := StrToCurrDef(edtComissao.Text,0);

    if dblDepartamentos.Text <> EmptyStr  then
    Begin
      objEmpregado.Departamento.Cod := dblDepartamentos.DataSource.DataSet.Fields[0].AsInteger;
      objEmpregado.Departamento.Nome := dblDepartamentos.DataSource.DataSet.Fields[1].AsString;
    End;

    if dblFuncao.Text <> EmptyStr then
    Begin
      objEmpregado.Funcao.Cod := dblFuncao.ListSource.DataSet.Fields[0].AsInteger;
      objEmpregado.Funcao.Funcao := dblFuncao.ListSource.DataSet.Fields[1].AsString;
    End;

  Except on E : Exception do
    raise E.Create('Erro ao preencher objeto TEmpregado : ' + E.Message);
  End;

end;

procedure TfrmEmpregados.dbgEmpregadosDblClick(Sender: TObject);
Var
  nmDepartamento, nmFuncao : String;
begin
  nmDepartamento := VarToStr(objEmpregado.FDQuery.FieldValues['Departamento']);
  nmFuncao := VarToStr(objEmpregado.FDQuery.FieldValues['Função']);

  edtCod.Text := objEmpregado.FDQuery.FieldValues['Cod'];
  edtNome.Text := objEmpregado.FDQuery.FieldValues['Nome'];
  dtEditAdmissao.Date := objEmpregado.FDQuery.FieldValues['Admissão'];
  edtSalario.Text := CurrToStrF(objEmpregado.FDQuery.FieldValues['Salário'],ffCurrency,2);
  edtComissao.Text := CurrToStrF(objEmpregado.FDQuery.FieldValues['Comissão'],ffCurrency,2);
  dtsDepto.DataSet.Locate('Departamento',nmDepartamento,[]);
  dtsFuncao.DataSet.Locate('Função',nmFuncao,[]);
end;

procedure TfrmEmpregados.Restart;
begin
  //Reset Fields
  edtCod.Clear;
  edtNome.Clear;
  edtSalario.Clear;
  edtComissao.Clear;
  dblDepartamentos.ListFieldIndex := -1;
  dblFuncao.ListFieldIndex := -1;

  //Cria Objeto
  objEmpregado := TEmpregado.Create;
  edtCod.Text := objEmpregado.getID;
  objEmpregado.getData;
  dtsEmpregados.DataSet := objEmpregado.FDQuery;

  //Carrega Departamentos
  dtsDepto.DataSet := objEmpregado.Departamento.FDQuery;
  objEmpregado.Departamento.getData;
  dblDepartamentos.KeyField := 'Departamento';

  //Carrega Funcoes
  dtsFuncao.DataSet := objEmpregado.Funcao.FDQuery;
  objEmpregado.Funcao.getData;
  dblFuncao.KeyField := 'Função';

  //Configura largura das Colunas
  dbgEmpregados.Columns.Items[1].Width := 400;
  dbgEmpregados.Columns.Items[2].Width := 300;

end;

destructor TfrmEmpregados.Destroy;
begin
  Try
    objEmpregado.Free;
  Finally

  End;

  inherited;
end;


end.
