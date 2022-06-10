object DmDados: TDmDados
  OldCreateOrder = False
  Height = 134
  Width = 349
  object Connection: TUniConnection
    ProviderName = 'sQL Server'
    Database = 'DEVELOPERS'
    Username = 'sa'
    Server = 'servidor.gsoft.com.br\sql2019'
    Connected = True
    ConnectDialog = ConnectDialog
    LoginPrompt = False
    Left = 32
    Top = 40
    EncryptedPassword = 'BFFFB8FF8CFF90FF99FF8BFFCEFFCDFFCFFFCEFFCFFFCAFFC6FFCFFF'
  end
  object Monitor: TUniSQLMonitor
    Left = 264
    Top = 40
  end
  object Provider: TSQLServerUniProvider
    Left = 200
    Top = 40
  end
  object ConnectDialog: TUniConnectDialog
    DatabaseLabel = 'Database'
    PortLabel = 'Port'
    ProviderLabel = 'Provider'
    Caption = 'Connect'
    UsernameLabel = 'User Name'
    PasswordLabel = 'Password'
    ServerLabel = 'Server'
    ConnectButton = 'Connect'
    CancelButton = 'Cancel'
    Left = 120
    Top = 40
  end
end
