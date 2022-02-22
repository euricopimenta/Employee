unit Model.Departamento;

interface
uses
  Model.DM.Conexao,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet;

  type TDepartamento = Class
  private
    FLocal: String;
    FCod: Integer;
    FNome: String;
    FDConnection : TFDConnection;
    procedure SetCod(const Value: Integer);
    procedure SetLocal(const Value: String);
    procedure SetNome(const Value: String);
    Procedure Insert;
    Procedure Update;
  Public
    FDQuery : TFDQuery;
    Function getID : String;
    Procedure Salvar;
    Procedure Excluir;
    Procedure getData;
    Constructor Create;
    Destructor Destroy ; Override;
  published
    Property Cod : Integer read FCod write SetCod;
    Property Nome : String read FNome write SetNome;
    Property Local : String read FLocal write SetLocal;
  End;

implementation
uses
  Sysutils, Dialogs;

{ TDepartamento }

constructor TDepartamento.Create;
begin
  FDQuery := TFDQuery.Create(nil);
  FDConnection := TFDConnection.Create(Nil);

  FDConnection.Params := DBConnection.FDConnection1.Params;
  FDQuery.Connection := FDConnection;
end;

destructor TDepartamento.Destroy;
begin
  FDQuery.Free;
  inherited;
end;

procedure TDepartamento.Excluir;
begin
  Try  //Delete
    FDQuery.ExecSQL(
    'DELETE FROM "MV"."DEPARTAMENTOS" Where id_departamento = :Cod', [FCod]);
  Except on E : Exception do
    raise Exception.Create('Erro ao Excluír Departamento '+E.Message);
  End

end;

procedure TDepartamento.getData;
Var
  xSql : TStringBuilder;
begin
  xSql := TStringBuilder.Create;
  Try
    xSql.Append(
      'Select ' +
        'id_departamento "Cod", ' +
        'nm_departamento "Departamento", ' +
        'nm_local "Local" ' +
      'from "MV"."DEPARTAMENTOS" '+
      'Order By id_Departamento'
    );

    FDQuery.SQL.Text := xSQL.ToString;
    FDQuery.Open;
  Except on E:Exception do
    raise Exception.Create(E.Message);
  End;

  xSql.DisposeOf;
end;

function TDepartamento.getID: String;
var
  qry : TFDQuery;
  fconn : TFDConnection;
begin
  qry := TFDQuery.Create(nil);
  fconn := TFDConnection.Create(nil);
  Try
    fconn.Params := DBConnection.FDConnection1.Params;
    qry.Connection := fconn;
    qry.Open('Select Coalesce(MAX(id_Departamento),0)+1 ID from "MV"."DEPARTAMENTOS"');

  Except
    raise Exception.Create('Erro ao buscar ID Departamento');
  End;
  Result := intToStr(qry.FieldValues['ID']);
  qry.Free;
  fconn.Free;
end;

procedure TDepartamento.Insert;
begin
  Try  //Insert
  FDQuery.ExecSQL(
  'INSERT INTO "MV"."DEPARTAMENTOS"(id_departamento, nm_departamento, nm_local)'+
  'VALUES (:Cod, :Departamento, :nmLocal)',
  [FCod,FNome,FLocal]);

  Except on E : Exception do
    raise E.Create('Erro ao criar Departamento '+E.Message);
  End

end;

procedure TDepartamento.Update;
begin
  Try //Update
    FDQuery.ExecSQL(
    'UPDATE "MV"."DEPARTAMENTOS" '+
    'SET nm_departamento= :Departamento, nm_local = :nmLocal '+
    'WHERE id_departamento = :Cod',
    [FNome,FLocal,FCod]);

  Except on E : Exception do
    raise Exception.Create('Erro ao alterar Departamento '+E.Message);
  End;

end;

procedure TDepartamento.Salvar;
begin
  if FCod = StrToInt(getID) then
    Insert
  Else
    Update;

end;

procedure TDepartamento.SetCod(const Value: Integer);
begin
  FCod := Value;
end;

procedure TDepartamento.SetLocal(const Value: String);
begin
  FLocal := Value;
end;

procedure TDepartamento.SetNome(const Value: String);
begin
  if Value = '' then
    raise Exception.Create('O Departamento precisa de um nome');
  FNome := Value;
end;



end.
