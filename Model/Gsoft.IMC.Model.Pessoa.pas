unit Gsoft.IMC.Model.Pessoa;

interface

type TSexo =  (M = 0, F = 1);

type TAUtomovel =  (Carro, Moto, Trator, Onibus);

type TPessoa = class
  private
    FCodigo: Integer;
    FNome: String;
    FTelefone: String;
    FNascimento: TDateTime;
    FAltura: Double;
    FPeso: Double;
    FSexo: TSexo;
    FAtivo: Boolean;

  public
    property Codigo: Integer read FCodigo write FCodigo;
    property Nome: String read FNome write FNome;
    property Telefone: String read FTelefone write FTelefone;
    property Nascimento: TDateTime read FNascimento write FNascimento;
    property Altura: Double read FAltura write FAltura;
    property Peso: Double read FPeso write FPeso;
    property Sexo: TSexo read FSexo write FSexo;
    property Ativo: Boolean read FAtivo write FAtivo;

  protected

end;

implementation


end.
