program IMC;

uses
  Vcl.Forms,
  Gsoft.IMC.DAO.Pessoa in 'DAO\Gsoft.IMC.DAO.Pessoa.pas' {DmPessoa: TDataModule},
  Gsoft.IMC.DAO.Conexao in 'DAO\Gsoft.IMC.DAO.Conexao.pas' {DmDados: TDataModule},
  Gsoft.IMC.Model.Pessoa in 'Model\Gsoft.IMC.Model.Pessoa.pas',
  Gsoft.IMC.View.Menu in 'View\Gsoft.IMC.View.Menu.pas' {FrmMain},
  Gsoft.IMC.Pessoa.View.Consulta in 'View\Gsoft.IMC.Pessoa.View.Consulta.pas' {FrmConsultaPessoa},
  Gsoft.IMC.View.Tabela in 'View\Gsoft.IMC.View.Tabela.pas' {FrmTabela};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDmDados, DmDados);
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
