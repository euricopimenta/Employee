unit Model.Funcao;

interface
Uses
  Model.DM.Conexao,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet;

type TFuncao = Class
  private
    FCod: Integer;
    FFuncao: String;
    FDConnection : TFDConnection;
    procedure SetCod(const Value: Integer);
    procedure SetFuncao(const Value: String);
    Procedure Insert;
    Procedure Update;    
  Public
    FDQuery : TFDQuery;
    Constructor Create;
    Function getID : String;
    Procedure Salvar;
    Procedure Excluir;
    Procedure getData;
    Destructor Destroy ; Override;
  published
    property Cod : Integer read FCod write SetCod;
    property Funcao : String read FFuncao write SetFuncao;
End;

implementation
uses
  Sysutils, Dialogs;

{ TFuncao }

constructor TFuncao.Create;  
begin
  FDQuery := TFDQuery.Create(nil);
  FDConnection := TFDConnection.Create(Nil);
  
  FDConnection.Params := DBConnection.FDConnection1.Params;
  FDQuery.Connection := FDConnection;
  
end;

procedure TFuncao.getData;
begin
  try
    FDQuery.Open('Select id_funcao "Cod", nm_funcao "Função" from "MV"."FUNCOES"');
  except on E: Exception do
    raise E.Create('Error funcao'+E.Message);
  end;
end;

function TFuncao.getID: String;
Var
  qry : TFDQuery;
  conn : TFDConnection;
begin
  qry := TFDQuery.Create(nil);
  conn := TFDConnection.Create(nil);
  Try
    conn.Params := DBConnection.FDConnection1.Params;
    qry.Connection := conn;
    qry.Open('Select Coalesce(MAX(id_funcao),0)+1 ID from "MV"."FUNCOES"');
  Except
    raise Exception.Create('Error ID Funcão');
  End;

  qry.Free;
  conn.Free;
end;

procedure TFuncao.Insert;
begin
 //
end;

procedure TFuncao.Update;
begin
 //
end;

procedure TFuncao.Salvar;
begin
 //
end;

procedure TFuncao.Excluir;
begin
  //
end;

procedure TFuncao.SetCod(const Value: Integer);
begin
  FCod := Value;
end;

procedure TFuncao.SetFuncao(const Value: String);
begin
  if Value = EmptyStr then
    raise Exception.Create('A função precisa de um nome');
  FFuncao := Value;

end;

destructor TFuncao.Destroy;
begin
  FDConnection.Free;
  FDQuery.Free;
  inherited;
end;

end.


