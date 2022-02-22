unit Model.Empregado;


interface
  uses
    FireDAC.Comp.Client,
    FireDAC.Comp.DataSet,
    Model.DM.Conexao,
    Model.Funcao,
    Model.Departamento;

  Type TEmpregado = Class
  private
    FSalario: Currency;
    FComissao: Currency;
    FCod: Integer;
    FDataAdmissao: TDateTime;
    FNome: String;
    FFuncao: TFuncao;
    FDepartamento: TDepartamento;
    FDConnection : TFDConnection;
    procedure SetCod(const Value: Integer);
    procedure SetComissao(const Value: Currency);
    procedure SetDataAdmissao(const Value: TDateTime);
    procedure SetNome(const Value: String);
    procedure SetSalario(const Value: Currency);
    procedure SetFuncao(const Value: TFuncao);
    procedure SetDepartamento(const Value: TDepartamento);
    Procedure Insert;
    Procedure Update;
    Procedure setParametrosSQL;

  Public
    FDQuery : TFDQuery;
    Function getID : String;
    Procedure Salvar;
    Procedure Excluir;
    Procedure getData;

  published
    Property Cod  : Integer read FCod write SetCod;
    Property Nome : String read FNome write SetNome;
    Property Departamento : TDepartamento read FDepartamento write SetDepartamento;
    Property Funcao : TFuncao read FFuncao write SetFuncao;
    Property DataAdmissao : TDateTime read FDataAdmissao write SetDataAdmissao;
    Property Salario : Currency read FSalario write SetSalario;
    Property Comissao : Currency read FComissao write SetComissao;
    Constructor Create;
    Destructor Destroy ; Override;

  End;

implementation
uses
  Sysutils, Dialogs, Data.DB;


{ TEmpregado }

constructor TEmpregado.Create;
begin
  FFuncao := TFuncao.Create;
  FDepartamento := TDepartamento.Create;

  FDQuery := TFDQuery.Create(nil);
  FDConnection := TFDConnection.Create(nil);
end;

procedure TEmpregado.Excluir;
begin
  Try  //Delete
    FDQuery.ExecSQL(
    'DELETE FROM "MV"."EMPREGADOS" Where id_Empregado = :Cod', [FCod]);
  Except on E : Exception do
    raise Exception.Create('Erro ao excluír empregado '+E.Message);
  End

end;

procedure TEmpregado.getData;
Var
  xSql : TStringBuilder;
begin
  xSql := TStringBuilder.Create;
  Try
    xSql.Append(
    'SELECT  ' +
      'id_empregado "Cod", ' +
      'nm_empregado "Nome", ' +
      'tDepto.nm_departamento "Departamento", ' +
      'tFunc.nm_funcao "Função", ' +
      'data_admissao "Admissão", ' +
      'salario "Salário", ' +
      'comissao "Comissão" ' +
    'FROM "MV"."EMPREGADOS" tEmpregados ' +
    'Left outer join "MV"."DEPARTAMENTOS" tDepto on tEmpregados.cod_departamento = tDepto.id_departamento ' +
    'Left outer join "MV"."FUNCOES" tFunc on tEmpregados.cod_funcao = tFunc.id_funcao '
    );

    FDConnection.Params := DBConnection.FDConnection1.Params;
    FDQuery.Connection := FDConnection;
    FDQuery.SQL.Text := xSQL.ToString;
    FDQuery.Open;

  Except on E:Exception do
    raise Exception.Create(E.Message);
  End;

  xSql.DisposeOf;
end;

function TEmpregado.getID: String;
var
  qry : TFDQuery;
  fconn : TFDConnection;
begin
  qry := TFDQuery.Create(nil);
  fconn := TFDConnection.Create(nil);

  Try
    fconn.Params := DBConnection.FDConnection1.Params;
    qry.Connection := Fconn;
    qry.Open('Select Coalesce(MAX(id_Empregado),0)+1 ID from "MV"."EMPREGADOS"');

  Except
    raise Exception.Create('Erro ao buscar ID');
  End;
  Result := intToStr(qry.FieldValues['ID']);
  fconn.Free;
  qry.Free;
end;

procedure TEmpregado.Insert;
begin
  Try  //Insert
  FDQuery.SQL.Clear;
  FDQuery.SQL.Text :=
    'INSERT INTO "MV"."EMPREGADOS"( '   +
    'id_empregado, cod_departamento, cod_funcao, nm_empregado, data_admissao, salario, comissao) '  +
    'VALUES (:Cod, :codDept, :codFunc, :Nome, :dtAdmissao, :Salario, :Comissao);';

  SetParametrosSQL;
  FDQuery.ExecSQL;
  Except on E : Exception do
    raise Exception.Create('Erro ao criar empregado '+E.Message);
  End
end;

procedure TEmpregado.Update;
begin
  Try //Update
    FDQuery.SQL.Clear;
    FDQuery.SQL.Text :=
    'UPDATE "MV"."EMPREGADOS" ' +
    'SET cod_departamento = :codDept, cod_funcao = :codFunc, '+
    'nm_empregado = :Nome, data_admissao = :dtAdmissao, salario = :Salario, comissao = :Comissao '+
    'WHERE id_empregado = :Cod ;';

    SetParametrosSQL;
    FDQuery.ExecSQL;
  Except on E : Exception do
    raise Exception.Create('Erro ao alterar Empregado '+E.Message);
  End;

end;

procedure TEmpregado.Salvar;
begin
  if FCod = StrToInt(getID) then
    Insert
  Else
    Update;

end;

procedure TEmpregado.SetCod(const Value: Integer);
begin
  FCod := Value;
end;

procedure TEmpregado.SetComissao(const Value: Currency);
begin
  FComissao := Value;
end;

procedure TEmpregado.SetDataAdmissao(const Value: TDateTime);
begin
  FDataAdmissao := Value;
end;

procedure TEmpregado.SetDepartamento(const Value: TDepartamento);
begin
  FDepartamento := Value;
end;

procedure TEmpregado.SetFuncao(const Value: TFuncao);
begin
  FFuncao := Value;
end;

procedure TEmpregado.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TEmpregado.setParametrosSQL;
begin
  FDQuery.ParamByName('Cod').AsInteger := FCod;

  if FDepartamento.Cod > 0 then
    FDQuery.ParamByName('codDept').AsInteger := FDepartamento.Cod
  Else
  Begin // Setar como null, quando Zero
    FDQuery.ParamByName('codDept').DataType := ftInteger;
    FDQuery.ParamByName('codDept').Clear;
  End;

  if FFuncao.Cod > 0 then
    FDQuery.ParamByName('codFunc').AsInteger := FFuncao.Cod
  Else
  Begin // Setar como null, quando Zero
    FDQuery.ParamByName('codFunc').DataType := ftInteger;
    FDQuery.ParamByName('codFunc').Clear;
  End;

  FDQuery.ParamByName('Nome').AsString := FNome;
  FDQuery.ParamByName('dtAdmissao').AsDateTime := FDataAdmissao;
  FDQuery.ParamByName('Salario').AsCurrency := FSalario;
  FDQuery.ParamByName('Comissao').AsCurrency := FComissao;

  FDQuery.ExecSQL;
end;

procedure TEmpregado.SetSalario(const Value: Currency);
begin
  FSalario := Value;
end;

destructor TEmpregado.Destroy;
begin
   FFuncao.Free;
   FDepartamento.Free;

   FDQuery.Free;
   FDConnection.Free;
  inherited;
end;

end.
