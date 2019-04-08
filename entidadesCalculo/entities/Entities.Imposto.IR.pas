unit Entities.Imposto.IR;

interface

uses
  Entities.Imposto.Interfaces, Entities.Imposto.Calculo,
  Generics.Collections, Entities.Funcionario;

type
  TImpostoIR = class sealed( TCalculoImposto)
  private
  public
    constructor Create( );
    destructor Destroy(); override;

    class function New() : iCalculo;

    function Exec() : Double; override;
  end;

implementation

{ TImpostoIR }


constructor TImpostoIR.Create( );
begin
  inherited Create();
end;

destructor TImpostoIR.Destroy;
begin

  inherited;
end;

//O c�lculo de IR ser� deduzido da base, sal�rio 100 reais para cada dependente que possuir
//calcula IR e por fim desconta 15% do sal�rio do funcion�rio.
function TImpostoIR.Exec: Double;
begin
  FResultado := FSalario - CalcDeducao( FDependente );
  FResultado := FResultado - CalcAliquota( FResultado );

  result := FResultado;
end;

class function TImpostoIR.New() : iCalculo;
begin
  result := TImpostoIR.Create();
end;


end.

