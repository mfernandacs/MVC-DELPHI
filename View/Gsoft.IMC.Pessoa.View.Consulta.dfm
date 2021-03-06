object FrmConsultaPessoa: TFrmConsultaPessoa
  Left = 0
  Top = 0
  Caption = 'Consulta de Pessoas'
  ClientHeight = 320
  ClientWidth = 727
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 727
    Height = 276
    Align = alClient
    BorderWidth = 5
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 276
    Width = 727
    Height = 44
    Align = alBottom
    BorderWidth = 5
    TabOrder = 1
    object EdtPesquisa: TEdit
      Left = 6
      Top = 6
      Width = 531
      Height = 32
      Align = alLeft
      BevelEdges = []
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnChange = EdtPesquisaChange
      ExplicitHeight = 27
    end
    object BtnGravar: TAdvGlowButton
      Left = 545
      Top = 6
      Width = 176
      Height = 32
      Align = alRight
      Caption = 'Selecionar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      ParentFont = False
      Picture.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D00000006624B474400FF00FF00FFA0BDA7930000017F494441543811636018
        11C0ADFBA818CCA34C3006B97478FF594D0D718143A9732ECD0599C10C22C8C5
        20C314A5B9D7657AA86B7CFEFE5B9ECB24EA1CB96631044F3A6D58BBF6F6CDBB
        EFFFFE5F7EEAF55BA00BCB07A76129732F5550E4B29A35B76EC1BC89D330DF9E
        332271D32F24E1B32974D209AD8A95376FDC79F7F7FFFAF36FDFA7CCBED88A55
        7DE8A473A2652B6F5C5E7EF2E5C7CC79972BB1290A9E724ABB6AD5CD3B50C3DE
        C4CDBCD0844D1D488CE91FC35F191E0E162E7375513E677DF1E2E4599750620B
        E4325551FEB5492E2ACA571E7EF8B0EDEC93598BD20DEA409A7162900B8049E0
        36C8059B2EBC7B074C028D20C5A0A451B3F63638CCD69C7BF30667988114A3E3
        8089678D1BD6DFB979EFC3BFFF2B4FBFFE103FE3C2F44A246FC6CFBCD882AE87
        203F74FA69B3A60DB7EF800CDD7DEDE32F908B375C78FB3E69D6850E829A7129
        08EE3BA55DBD1A129B206F26CDBCD8C0400260C4A63674D269334941AE65C0FC
        B9767E9A014A2461534F949873EB0971A2140E394500DD4CE828858136E10000
        000049454E44AE426082}
      TabOrder = 1
      OnClick = BtnGravarClick
      Appearance.ColorChecked = 16111818
      Appearance.ColorCheckedTo = 16367008
      Appearance.ColorDisabled = 15921906
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 16111818
      Appearance.ColorDownTo = 16367008
      Appearance.ColorHot = 16117985
      Appearance.ColorHotTo = 16372402
      Appearance.ColorMirrorHot = 16107693
      Appearance.ColorMirrorHotTo = 16775412
      Appearance.ColorMirrorDown = 16102556
      Appearance.ColorMirrorDownTo = 16768988
      Appearance.ColorMirrorChecked = 16102556
      Appearance.ColorMirrorCheckedTo = 16768988
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
    end
  end
  object DbgPessoas: TDBGrid
    Left = 0
    Top = 0
    Width = 727
    Height = 276
    Align = alClient
    DataSource = DsPessoa
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnKeyDown = DbgPessoasKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 393
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Telefone'
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nascimento'
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sexo'
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Visible = True
      end>
  end
  object DsPessoa: TDataSource
    DataSet = DmPessoa.QryPessoa
    Left = 440
    Top = 104
  end
end
