
unit Gsoft.IMC.Pessoa.View.Consulta;

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
  Data.DB,
  Vcl.StdCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.ExtCtrls,
  Gsoft.IMC.DAO.Pessoa,
  AdvGlowButton;

type
  TFrmConsultaPessoa = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    EdtPesquisa: TEdit;
    DsPessoa: TDataSource;
    BtnGravar: TAdvGlowButton;
    DbgPessoas: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure EdtPesquisaChange(Sender: TObject);
    procedure DbgPessoasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnGravarClick(Sender: TObject);
    //procedure DsPessoaDataChange(Sender: TObject; Field: TField);
  private
    procedure Selecionar;
    { Private declarations }
  public
    { Public declarations }
    PessoaSelecionada : Integer;
  end;

var
  FrmConsultaPessoa: TFrmConsultaPessoa;

implementation

{$R *.dfm}

procedure TFrmConsultaPessoa.BtnGravarClick(Sender: TObject);
begin
  Self.Selecionar();
  Self.Close();
end;

procedure TFrmConsultaPessoa.DbgPessoasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
  begin
    Self.Selecionar();
    Self.Close();
  end;
  if key = VK_ESCAPE then
  begin
   Self.Close;
  end;
end;


procedure TFrmConsultaPessoa.Selecionar();
begin
  if DmPessoa.QryPessoa.RecordCount > 0 then
  begin
    PessoaSelecionada := DmPessoa.QryPessoaCodigo.AsInteger;
  end;
end;

procedure TFrmConsultaPessoa.EdtPesquisaChange(Sender: TObject);
begin
  DmPessoa.AbrirConsulta('Where nome like '+QuotedStr('%'+EdtPesquisa.Text+'%'));
end;

procedure TFrmConsultaPessoa.FormCreate(Sender: TObject);
begin
  DmPessoa.AbrirConsulta('');

end;

end.
