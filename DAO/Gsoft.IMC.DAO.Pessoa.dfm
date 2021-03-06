object DmPessoa: TDmPessoa
  OldCreateOrder = False
  Height = 165
  Width = 451
  object QryPessoa: TUniQuery
    Connection = DmDados.Connection
    SQL.Strings = (
      'Select * from Pessoas')
    Left = 72
    Top = 48
    object QryPessoaCodigo: TIntegerField
      FieldName = 'Codigo'
      ReadOnly = True
      Required = True
    end
    object QryPessoaNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object QryPessoaTelefone: TStringField
      FieldName = 'Telefone'
    end
    object QryPessoaNascimento: TDateTimeField
      FieldName = 'Nascimento'
    end
    object QryPessoaPeso: TFloatField
      FieldName = 'Peso'
    end
    object QryPessoaAltura: TFloatField
      FieldName = 'Altura'
    end
    object QryPessoaSexo: TStringField
      FieldName = 'Sexo'
      FixedChar = True
      Size = 1
    end
    object QryPessoaAtivo: TBooleanField
      FieldName = 'Ativo'
    end
  end
  object TbPessoa: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO pessoas'
      '  (Nome, Telefone, Nascimento, Peso, Altura, Sexo, Ativo)'
      'VALUES'
      '  (:Nome, :Telefone, :Nascimento, :Peso, :Altura, :Sexo, :Ativo)'
      'SET :Codigo = SCOPE_IDENTITY()')
    SQLDelete.Strings = (
      'DELETE FROM pessoas'
      'WHERE'
      '  Codigo = :Old_Codigo')
    SQLUpdate.Strings = (
      'UPDATE pessoas'
      'SET'
      
        '  Nome = :Nome, Telefone = :Telefone, Nascimento = :Nascimento, ' +
        'Peso = :Peso, Altura = :Altura, Sexo = :Sexo, Ativo = :Ativo'
      'WHERE'
      '  Codigo = :Old_Codigo')
    SQLLock.Strings = (
      'SELECT * FROM pessoas'
      'WITH (UPDLOCK, ROWLOCK, HOLDLOCK)'
      'WHERE'
      '  Codigo = :Old_Codigo')
    SQLRefresh.Strings = (
      
        'SELECT Nome, Telefone, Nascimento, Peso, Altura, Sexo, Ativo FRO' +
        'M pessoas'
      'WHERE'
      '  Codigo = :Codigo')
    SQLRecCount.Strings = (
      'SET :PCOUNT = (SELECT COUNT(*) FROM pessoas'
      ')')
    Connection = DmDados.Connection
    SQL.Strings = (
      'select * from pessoas where codigo = :Codigo')
    Left = 184
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Codigo'
        Value = -1
      end>
    object TbPessoaCodigo: TIntegerField
      FieldName = 'Codigo'
      ReadOnly = True
      Required = True
    end
    object TbPessoaNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object TbPessoaTelefone: TStringField
      FieldName = 'Telefone'
    end
    object TbPessoaNascimento: TDateTimeField
      FieldName = 'Nascimento'
    end
    object TbPessoaPeso: TFloatField
      FieldName = 'Peso'
    end
    object TbPessoaAltura: TFloatField
      FieldName = 'Altura'
    end
    object TbPessoaSexo: TStringField
      FieldName = 'Sexo'
      FixedChar = True
      Size = 1
    end
    object TbPessoaAtivo: TBooleanField
      FieldName = 'Ativo'
    end
  end
  object QClassificaIMC: TUniQuery
    Connection = DmDados.Connection
    SQL.Strings = (
      'SELECT * FROM ClassificacaoIMC'
      '  WHERE :IMC BETWEEN FaixaMin AND FaixaMax')
    Left = 288
    Top = 56
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IMC'
        ParamType = ptInput
        Value = nil
      end>
    object QClassificaIMCFaixaMin: TFloatField
      FieldName = 'FaixaMin'
    end
    object QClassificaIMCFaixaMax: TFloatField
      FieldName = 'FaixaMax'
    end
    object QClassificaIMCResultado: TStringField
      FieldName = 'Resultado'
      Size = 50
    end
  end
end
