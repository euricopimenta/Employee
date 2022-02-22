object DBConnection: TDBConnection
  OldCreateOrder = False
  Height = 369
  Width = 417
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT '
      #9'id_empregado "Cod",'
      #9'tDepto.nm_departamento "Departamento",'
      #9'nm_empregado "Nome",'
      #9'tFunc.nm_funcao "Fun'#231#227'o",'
      #9'data_admissao "Admiss'#227'o",'
      #9'salario "Sal'#225'rio",'
      #9'comissao "Comiss'#227'o"'
      'FROM "MV"."EMPREGADOS" tEmpregados'
      
        'Left outer join "MV"."DEPARTAMENTOS" tDepto on tEmpregados.cod_d' +
        'epartamento = tDepto.id_departamento'
      
        'Left outer join "MV"."FUNCOES" tFunc on tEmpregados.cod_funcao =' +
        ' tFunc.id_funcao')
    Left = 40
    Top = 80
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'CharacterSet=UTF8'
      'MetaDefSchema=MV'
      'User_Name=postgres'
      'Password=masterkey'
      'MetaCurSchema=MV'
      'Database=postgres'
      'DriverID=PG')
    Connected = True
    Left = 40
    Top = 17
  end
end
