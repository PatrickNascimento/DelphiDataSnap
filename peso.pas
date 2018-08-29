unit peso;

interface

 type
   Tpeso = class
  private
    Fpeso: string;
    procedure Setpeso(const Value: string);
  public
    property peso : string read Fpeso write Setpeso;
  end;

implementation

{ Tpeso }

procedure Tpeso.Setpeso(const Value: string);
begin
  Fpeso := Value;
end;

end.
