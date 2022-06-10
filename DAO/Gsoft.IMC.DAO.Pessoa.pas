unit Gsoft.IMC.DAO.Pessoa;

interface

uses
  System.SysUtils,
  System.Classes,
  Gsoft.IMC.Model.Pessoa,
  Gsoft.IMC.DAO.Conexao,
  Data.DB,
  MemDS,
  DBAccess,
  Uni,
  System.TypInfo, // USADO PARA CONVERSÂO DO ENUM
  System.Generics.Collections;

type
  TDmPessoa = class(TDataModule)
    QryPessoa:                TUniQuery;
    TbPessoa:                 TUniQuery;
    TbPessoaCodigo:           TIntegerField;
    TbPessoaNome:             TStringField;
    TbPessoaTelefone:         TStringField;
    TbPessoaNascimento:       TDateTimeField;
    TbPessoaPeso:             TFloatField;
    TbPessoaAltura:           TFloatField;
    TbPessoaSexo:             TStringField;
    TbPessoaAtivo:            TBooleanField;
    QryPessoaCodigo:          TIntegerField;
    QryPessoaNome:            TStringField;
    QryPessoaTelefone:        TStringField;
    QryPessoaNascimento:      TDateTimeField;
    QryPessoaPeso:            TFloatField;
    QryPessoaAltura:          TFloatField;
    QryPessoaSexo:            TStringField;
    QryPessoaAtivo:           TBooleanField;
    QClassificaIMC:           TUniQuery;
    QClassificaIMCFaixaMin:   TFloatField;
    QClassificaIMCFaixaMax:   TFloatField;
    QClassificaIMCResultado:  TStringField;
  private
    { Private declarations }

    function DataToObjeto():TPessoa; //Para criar automatico CRTL+SHIFT+C
    procedure ObjetoToData(APessoa: TPessoa);
    procedure AbrirTabela(Codigo : integer);

  public
    { Public declarations }
    function Inserir(APessoa: TPessoa):TPessoa;
    function Alterar(APessoa : TPessoa):TPessoa;
    function Excluir(ACodigo : Integer):Boolean;
    function Selecionar (Codigo : Integer): TPessoa;
    procedure AbrirConsulta(APesquisa: String);
    function GerarResultadoIMC(AImc: Double): String;
  end;

var
  DmPessoa: TDmPessoa;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDmPessoa }

procedure TDmPessoa.AbrirConsulta(APesquisa: String);
begin
  Self.QryPessoa.Close();
  Self.QryPessoa.SQL.Clear();
  Self.QryPessoa.SQL.Add('Select * from Pessoas');
  Self.QryPessoa.SQL.Add(APesquisa);
  Self.QryPessoa.Open();
end;

procedure TDmPessoa.AbrirTabela(Codigo : integer);
begin
  Self.TbPessoa.Close();
  Self.TbPessoa.ParamByName('Codigo').AsInteger := Codigo;
  Self.TbPessoa.Open();
end;

function TDmPessoa.Alterar(APessoa: TPessoa): TPessoa;
begin
  Self.AbrirTabela(APessoa.Codigo);
  Self.TbPessoa.Edit();
  Self.ObjetoToData(APessoa);
  Self.TbPessoa.Post();
  Result := Self.Selecionar(APessoa.Codigo);
end;



function TDmPessoa.DataToObjeto: TPessoa;
begin
  Result := TPessoa.Create();
  Result.Codigo       := Self.TbPessoaCodigo.AsInteger;
  Result.Nome         := Self.TbPessoaNome.AsString;
  Result.Telefone     := Self.TbPessoaTelefone.AsString;
  Result.Nascimento   := Self.TbPessoaNascimento.AsDateTime;
  Result.Altura       := Self.TbPessoaAltura.AsFloat;
  Result.Peso         := Self.TbPessoaPeso.AsFloat;
  Result.Sexo         := TSexo(GetEnumValue(TypeInfo(TSexo),Self.TbPessoaSexo.AsString));
  Result.Ativo        := Self.TbPessoaAtivo.AsBoolean;
end;

function TDmPessoa.GerarResultadoIMC(AImc : Double): String;
begin
  QClassificaIMC.Close;
  QClassificaIMC.ParamByName('IMC').AsFloat := AImc;
  QClassificaIMC.Open;

  Result := QClassificaIMCResultado.AsString;
end;

function TDmPessoa.Excluir(ACodigo: Integer): Boolean;
begin
  try
    Self.Selecionar(ACodigo);
    TbPessoa.Delete();
    Result := True;
  except
    Result := False;
  end;


end;

function TDmPessoa.Inserir(APessoa: TPessoa): TPessoa;
begin
  Self.AbrirTabela(-1);
  Self.TbPessoa.Append();
  Self.ObjetoToData(APessoa);
  Self.TbPessoa.Post();
  //Self.TbPessoa.Refresh();
  Self.TbPessoa.Last();
  Result := Self.DataToObjeto();
end;

procedure TDmPessoa.ObjetoToData(APessoa: TPessoa);
begin
  Self.TbPessoaNome.AsString          := APessoa.Nome;
  Self.TbPessoaTelefone.AsString      := APessoa.Telefone;
  Self.TbPessoaNascimento.AsDateTime  := APessoa.Nascimento;
  Self.TbPessoaAltura.AsFloat         := APessoa.Altura;
  Self.TbPessoaPeso.AsFloat           := APessoa.Peso;
  Self.TbPessoaSexo.AsString          := (GetEnumName(TypeInfo(TSexo),Integer(APessoa.Sexo))); //
  Self.TbPessoaAtivo.AsBoolean        := APessoa.Ativo;
end;

function TDmPessoa.Selecionar(Codigo: Integer): TPessoa;
begin
  Self.AbrirTabela(Codigo);

  if TbPessoa.RecordCount < 1  then
    raise Exception.Create('Cadastro de pessoa não encontrado')  ;

  Result := Self.DataToObjeto();
end;
end.
