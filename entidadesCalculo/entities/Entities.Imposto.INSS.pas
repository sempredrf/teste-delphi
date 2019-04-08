unit Entities.Imposto.INSS;

interface

uses
  Entities.Imposto.Interfaces, Entities.Imposto.Calculo,
  Generics.Collections, Entities.Funcionario;

type
  TImpostoINSS = class sealed( TCalculoImposto)
  private
  public
    constructor Create( );
    destructor Destroy(); override;

    class function New() : iCalculo;

    function Exec() : Double; override;
  end;

implementation

{ TImpostoINSS }


constructor TImpostoINSS.Create( );
begin
  inherited Create();
end;

destructor TImpostoINSS.Destroy;
begin

  inherited;
end;

//O c�lculo de INSS ser� descontado 8% do valor do funcion�rio caso o dependente calcula INSS
function TImpostoINSS.Exec: Double;
begin
  FResultado := 0;

  if FDependente > 0 then
    FResultado := CalcAliquota( FSalario );

  result := FResultado;
end;

class function TImpostoINSS.New() : iCalculo;
begin
  result := TImpostoINSS.Create();
end;


end.

