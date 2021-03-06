unit Gsoft.IMC.View.Menu;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.DBCtrls,
  Vcl.Mask,
  System.TypInfo,
  AdvGlowButton,
  Vcl.ExtCtrls,
  AdvGrid,
  AsgLinks,
  Gsoft.IMC.DAO.Pessoa,
  Gsoft.IMC.Pessoa.View.Consulta,
  Gsoft.IMC.Model.Pessoa,
  Gsoft.IMC.View.Tabela;

type
  TFrmMain = class(TForm)
    Panel1: TPanel;
    BtnIncluir: TAdvGlowButton;
    BtnAlterar: TAdvGlowButton;
    BtnGravar: TAdvGlowButton;
    BtnConsultar: TAdvGlowButton;
    BtnExcluir: TAdvGlowButton;
    BtnTabela: TAdvGlowButton;
    Panel2: TPanel;
    BtnCalcularIMC: TAdvGlowButton;
    Panel3: TPanel;
    PnlCadastro: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Panel5: TPanel;
    PnIMC: TPanel;
    Label8: TLabel;
    PnResultado: TPanel;
    Label9: TLabel;
    MedNascimento: TMaskEdit;
    EdtPeso: TEdit;
    EdtAltura: TEdit;
    ChbAtivo: TCheckBox;
    EdtCodigo: TEdit;
    EdtNome: TEdit;
    CmbSexo: TComboBox;
    medTelefone: TMaskEdit;
    procedure BtnIncluirClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure BtnTabelaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnCalcularIMCClick(Sender: TObject);
  private
    { Private declarations }
    Pessoa : TPessoa;
    procedure GravarPessoa;
    procedure EditarPessoa;
    procedure PreencherPessoa;
    procedure PreencherTela;
    procedure LimparCampos;


  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

procedure TFrmMain.BtnAlterarClick(Sender: TObject);
begin
  Self.PnlCadastro.Enabled := True;
  if not Assigned(Self.Pessoa) then
  begin
    ShowMessage('N?o existe pessoa para ser alterada!');
  end;
end;

procedure TFrmMain.GravarPessoa();
begin
  Self.PreencherPessoa();
  Self.Pessoa := DmPessoa.Inserir(Self.Pessoa);
  Self.PreencherTela();
end;

procedure TFrmMain.EditarPessoa();
begin
  Self.PreencherPessoa();
  Self.Pessoa := DmPessoa.Alterar(Self.Pessoa);
  Self.PreencherTela();
end;

procedure TFrmMain.PreencherPessoa();
begin
  Self.Pessoa.Nome        := EdtNome.Text;
  Self.Pessoa.Telefone    := MedTelefone.Text;
  Self.Pessoa.Nascimento  := StrToDateTime(MedNascimento.Text);
  Self.Pessoa.Altura      := StrToFloat(EdtAltura.Text);
  Self.Pessoa.Peso        := StrToFloat(EdtPeso.Text);
  Self.Pessoa.Sexo        := TSexo(GetEnumValue(TypeInfo(TSexo),CmbSexo.text)) ;
  Self.Pessoa.Ativo       := ChbAtivo.Checked;
end;

procedure TFrmMain.PreencherTela();
begin
  EdtCodigo.Text        := Self.Pessoa.Codigo.ToString();
  EdtNome.Text          := Self.Pessoa.Nome;
  MedTelefone.Text      := Self.Pessoa.Telefone;
  MedNascimento.Text    := DateTimeToStr(Self.Pessoa.Nascimento);
  EdtAltura.Text        := FloatToStr(Self.Pessoa.Altura);
  EdtPeso.Text          := FloatToStr(Self.Pessoa.Peso);
  CmbSexo.ItemIndex     := Integer(Self.Pessoa.Sexo);
  ChbAtivo.Checked      := Self.Pessoa.Ativo;
end;

procedure TFrmMain.LimparCampos();
begin
  EdtCodigo.Text        := EmptyStr;
  EdtNome.Text          := EmptyStr;
  MedTelefone.Text      := EmptyStr;
  MedNascimento.Text    := EmptyStr;
  EdtAltura.Text        := EmptyStr;
  EdtPeso.Text          := EmptyStr;
  CmbSexo.ItemIndex     := -1;
  ChbAtivo.Checked      := False;
end;



procedure TFrmMain.BtnCalcularIMCClick(Sender: TObject);
var
  Peso, Altura, Imc : Double;
  Avaliacao : String;
begin
  if Assigned(Self.Pessoa) then
  begin
    Peso   := Self.Pessoa.Peso;
    Altura := Self.Pessoa.Altura;

    IMC := Peso / (Altura * Altura);

    PnIMC.Caption := FormatFloat('0.00', IMC);
    PnResultado.Caption := DmPessoa.GerarResultadoIMC(Imc);
  end
  else
  begin
    ShowMessage('Consulte uma pessoa para calcular o IMC!');
  end;

end;

procedure TFrmMain.BtnConsultarClick(Sender: TObject);
begin
    FrmConsultaPessoa := TFrmConsultaPessoa.Create(Self);
  try
    FrmConsultaPessoa.ShowModal;
    if FrmConsultaPessoa.PessoaSelecionada > 0 then
    begin
      Self.Pessoa := DmPessoa.Selecionar(FrmConsultaPessoa.PessoaSelecionada);
      Self.PreencherTela();
    end;

  finally

    FreeAndNil(FrmConsultaPessoa);
  end;
end;

procedure TFrmMain.BtnExcluirClick(Sender: TObject);
begin
   if Assigned(Self.Pessoa) then
  begin
    if Pessoa.Codigo > 0 then
    begin
       If (DmPessoa.Excluir(Self.Pessoa.Codigo)) then
       begin
         ShowMessage('Registro excluido com sucesso!');
         Self.LimparCampos
       end;
    end
    else
    begin
      Self.LimparCampos();
    end;
  end
  else
  begin
    ShowMessage('Pessoa n?o selecionada')
  end;

end;

procedure TFrmMain.BtnGravarClick(Sender: TObject);
begin
  Self.PnlCadastro.Enabled := False;
  if  Assigned(Self.Pessoa) then
  begin
    if Pessoa.Codigo > 0 then
    begin
      Self.EditarPessoa();
    end
//    else
//    begin
//      Self.GravarPessoa();
//    end;
  end
  else
  begin
    Self.Pessoa := TPessoa.Create();
    Self.GravarPessoa();
  end;

end;

procedure TFrmMain.BtnIncluirClick(Sender: TObject);
begin
  Self.PnlCadastro.Enabled := True;
  if EdtNome.CanFocus then
  begin
    EdtNome.SetFocus;
  end;
end;

procedure TFrmMain.BtnTabelaClick(Sender: TObject);
begin
  FrmTabela := TFrmTabela.Create(Self);
  try
    FrmTabela.ShowModal;
  finally
    FreeAndNil(FrmTabela);
  end;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  DmPessoa := TDmPessoa.Create(Self);
end;

procedure TFrmMain.FormDestroy(Sender: TObject);
begin
  FreeAndNil(DmPessoa);
end;

procedure TFrmMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key = VK_ESCAPE then
   Close;
end;

end.
