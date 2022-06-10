unit Gsoft.IMC.DAO.Conexao;

interface

uses
  System.SysUtils,
  System.Classes,
  UniProvider,
  SQLServerUniProvider,
  DASQLMonitor,
  UniSQLMonitor,
  Data.DB,
  DBAccess,
  Uni,
  UniDacVcl;

type
  TDmDados = class(TDataModule)
    Connection: TUniConnection;
    Monitor: TUniSQLMonitor;
    Provider: TSQLServerUniProvider;
    ConnectDialog: TUniConnectDialog;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmDados: TDmDados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
