object Form14: TForm14
  Left = 420
  Top = 189
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'T-SYSTEMS - CONSULTA POR NOME E USU'#193'RIO'
  ClientHeight = 484
  ClientWidth = 573
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel3: TBevel
    Left = -46
    Top = 32
    Width = 623
    Height = 9
    Shape = bsTopLine
  end
  object SpeedButton1: TSpeedButton
    Left = 400
    Top = 39
    Width = 89
    Height = 22
    Caption = 'Pesquisar'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000FFFFFF8C8C8C
      575757777777FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFABABAB737589AA878E5F5B5B777777FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF89B0CA4088DF
      7376A8AD8A8D5F5B5B777777FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFBDE3FF53B8FF4385D97979A7AD8A8D5F5B5B777777FF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA5D8FF
      53B8FF4385D97979A7AD8A8D5F5B5B969696FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8DCDFF53B8FF4483D67979A7987D8281
      8181A1A1A16C6C6C5757575757576262628C8C8CFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF8DCDFF53B8FF588CCF8C8C8C8B7574BC9A86CEB096E0C7AED2B4A48B75
      745757578C8C8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA5D8FFC9D0D4AD8A8DF1
      CFA9FFF5C3FFFED4FFFFDAFFFFDAF5EFE09F85815757578C8C8CFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFE2CECEEFC9A6FFF5C3FFF5C3FFFFDAFFFEEAFFFFFCFFFF
      FCF3EDDA7B61616C6C6CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0BDB3FFF5C3FF
      E4B1FFF9C7FFFFDAFFFEEAFFFFFCFFFFF7FFFFDAB79E8C575757FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFE5BEA5FFF5CAFFDEABFFF5C3FFFED4FFFFE6FFFEEAFFFF
      E6FFFFDACCB299575757FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5BEA5FFF5CAFF
      E5B9FFEEBDFFFCCDFFFED4FFFFDAFFFFDAFFFED4CCAC936C6C6CFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFE0C0B6FFF5CAFFF2D7FFE5B9FFF1BEFFF5C3FFF9C7FFF5
      C3FFF5C3B794818C8C8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCC5C5EFDAC2FF
      FFFCFFF7EAFFEEBDFFDEABFFE4B1FFF1BEF3D2A8907676FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFD8BCBAF1E5DDFFFEEAFFFCCDFFEEBDFFF5C3F5CF
      A4B9938AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDC
      C5C5D2B19ECEA88EE0B89EDCB3A08C8C8CFFFFFFFFFFFFFFFFFF}
    OnClick = SpeedButton1Click
  end
  object Label16: TLabel
    Left = 97
    Top = 42
    Width = 40
    Height = 16
    Caption = 'Nome:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = -46
    Top = 92
    Width = 623
    Height = 9
    Shape = bsTopLine
  end
  object Label2: TLabel
    Left = 8
    Top = 109
    Width = 65
    Height = 17
    AutoSize = False
    Caption = 'Mostrando:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 76
    Top = 109
    Width = 105
    Height = 17
    AutoSize = False
    Caption = 'Nenhum Registro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel4: TBevel
    Left = -14
    Top = 263
    Width = 591
    Height = 9
    Shape = bsTopLine
  end
  object Label1: TLabel
    Left = 70
    Top = 66
    Width = 68
    Height = 16
    Caption = 'T-Systems:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object fechar: TSpeedButton
    Left = 534
    Top = 452
    Width = 36
    Height = 29
    Glyph.Data = {
      0E060000424D0E06000000000000360000002800000016000000160000000100
      180000000000D8050000C30E0000C30E00000000000000000000FFFFFFF2F2F2
      F2F2F2D3D3D3E8E8E8F5F5F5DBDBDBDDDDDDECECECEEEEEED3D3D3EBEBEBF7F7
      F723230F4F4F00B2B2A8E9E9E9D6D6D6EBEBEBFAFAFAFFFFFFFFFFFF0000FFFF
      FFF0F0F0D8D8D8EDEDEDEAEAEADFDFDFDCDCDCF4F4F4E6E6E6D7D7D7F2F2F2E7
      E7E7DDDDDD4C4C0CFFFF006868119B9B9BF4F4F4E7E7E7DBDBDBE6E6E6FFFFFF
      0000D3D3D3E4E4E4EFEFEFE4E4E4D8D8D8EDEDEDF3F3F3D3D3D3E7E7E7F1F1F1
      DFDFDFDBDBDBECECEC4D4D0DFFFF008D8D00515105878781DFDFDFEDEDEDECEC
      ECD3D3D30000E6E6E6EDEDEDE1E1E1DBDBDBF5F5F5E3E3E3DCDCDCEAEAEAEAEA
      EAE0E0E0DBDBDBF6F6F6E3E3E34D4D0DFFFF008F8F007F7F0056560DA1A1A1E2
      E2E2DBDBDBF3F3F300004B4B4B5050504E4E4E4848484F4F4F5050504A4A4A4C
      4C4C444444F0F0F0F3F3F3D3D3D3E7E7E74E4E0EFFFF008F8F007F7F007D7D00
      4C4C0D3232324848484E4E4E0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBF4A4A4ADFDFDFDFDFDFE9E9E9EBEBEB4D4D0DFFFF008F8F007F7F
      007F7F00474700636363BFBFBFBFBFBF0000BFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBFBFBFB0B0B0BFBFBF4040403F3F3F3737373737373F3F3F434303FFFF008F
      8F007F7F007F7F00474700636363BFBFBFBFBFBF0000BFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBF3D3D3D8F8F8F3E3E3E7F7F7F7F7F7F7F7F7F7F7F7F474707
      FFFF008F8F007F7F007F7F00474700636363BFBFBFBFBFBF0000BFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBF3C3C304D4D141515137F7F7F7F7F7F7F7F7F7F7F
      7F474707FFFF008D8D007777007D7D00474700636363BFBFBFBFBFBF0000BFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF4646309A9A004545046161617F7F7F7F
      7F7F7F7F7F474707FFFF005F5F08171717676700474700636363BFBFBFBFBFBF
      0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF474727EDED0092920045450E
      6363637F7F7F7F7F7F474707FFFF004747276B6B6B676700474700636363BFBF
      BFBFBFBF0000AEAEAE57574531310A272700272700272700424200FFFF00F9F9
      009898004242006363637F7F7F474707FFFF007E7E002727006E6E0047470063
      6363BFBFBFBFBFBF00008989898C8C13CFCF01CFCF00CFCF00CFCF00D5D500FF
      FF00FFFF00EDED0098980045450E616161474707FFFF008F8F007F7F007F7F00
      474700636363BFBFBFBFBFBF0000898989A1A113FEFE2CFFFFAFFFFFAFFFFFAF
      FFFFAFFFFFAFFFFFDBFFFF6DE3E3004B4B095B5B5B474707FFFF008F8F007F7F
      007F7F00474700636363BFBFBFBFBFBF0000A7A7A76F6F4879790C7A7A0A7A7A
      0A7A7A0A8A8A09FFFF3EFFFF70E4E4005F5F005858587F7F7F474707FFFF008F
      8F007F7F007F7F00474700636363BFBFBFBFBFBF0000BFBFBFB1B1B1A9A9A9A9
      A9A9A9A9A9A9A9A94C4C2CFFFF0DE6E6075959085858537F7F7F7F7F7F474707
      FFFF008F8F007F7F007F7F00474700636363BFBFBFBFBFBF0000BFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBF505030E3E3005F5F035757577F7F7F7F7F7F7F7F
      7F474707FFFF008F8F007F7F007F7F00474700636363BFBFBFBFBFBF0000BFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF4242356E6E2521211B7F7F7F7F7F7F7F
      7F7F7F7F7F5E5E52999906D5D5008787007F7F00474700636363BFBFBFBFBFBF
      0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7070708888884444447F7F7F
      7F7F7F7F7F7F7F7F7F7F7F7F565656999906DBDB00898900474700636363BFBF
      BFBFBFBF0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF4444
      447F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F5E5E529B9B03D7D7004C4C0076
      7676BFBFBFBFBFBF0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBF4141415656565656565656565656565656565656565656562E2E2E888807
      65650C888888BFBFBFBFBFBF0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBF9696968989898989898989898989898989898989898989898989
      89898989898989B1B1B1BFBFBFBFBFBF0000}
    OnClick = fecharClick
  end
  object SpeedButton2: TSpeedButton
    Left = 400
    Top = 64
    Width = 89
    Height = 22
    Caption = 'Pesquisar'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000FFFFFF8C8C8C
      575757777777FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFABABAB737589AA878E5F5B5B777777FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF89B0CA4088DF
      7376A8AD8A8D5F5B5B777777FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFBDE3FF53B8FF4385D97979A7AD8A8D5F5B5B777777FF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA5D8FF
      53B8FF4385D97979A7AD8A8D5F5B5B969696FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8DCDFF53B8FF4483D67979A7987D8281
      8181A1A1A16C6C6C5757575757576262628C8C8CFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF8DCDFF53B8FF588CCF8C8C8C8B7574BC9A86CEB096E0C7AED2B4A48B75
      745757578C8C8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA5D8FFC9D0D4AD8A8DF1
      CFA9FFF5C3FFFED4FFFFDAFFFFDAF5EFE09F85815757578C8C8CFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFE2CECEEFC9A6FFF5C3FFF5C3FFFFDAFFFEEAFFFFFCFFFF
      FCF3EDDA7B61616C6C6CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0BDB3FFF5C3FF
      E4B1FFF9C7FFFFDAFFFEEAFFFFFCFFFFF7FFFFDAB79E8C575757FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFE5BEA5FFF5CAFFDEABFFF5C3FFFED4FFFFE6FFFEEAFFFF
      E6FFFFDACCB299575757FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5BEA5FFF5CAFF
      E5B9FFEEBDFFFCCDFFFED4FFFFDAFFFFDAFFFED4CCAC936C6C6CFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFE0C0B6FFF5CAFFF2D7FFE5B9FFF1BEFFF5C3FFF9C7FFF5
      C3FFF5C3B794818C8C8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCC5C5EFDAC2FF
      FFFCFFF7EAFFEEBDFFDEABFFE4B1FFF1BEF3D2A8907676FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFD8BCBAF1E5DDFFFEEAFFFCCDFFEEBDFFF5C3F5CF
      A4B9938AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDC
      C5C5D2B19ECEA88EE0B89EDCB3A08C8C8CFFFFFFFFFFFFFFFFFF}
    OnClick = SpeedButton2Click
  end
  object Bevel7: TBevel
    Left = -12
    Top = 447
    Width = 589
    Height = 9
    Shape = bsTopLine
  end
  object Bevel2: TBevel
    Left = -6
    Top = 128
    Width = 583
    Height = 9
    Shape = bsTopLine
  end
  object Label21: TLabel
    Left = 8
    Top = 7
    Width = 44
    Height = 13
    Caption = 'C'#243'digo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object dbcodigo: TDBText
    Left = 56
    Top = 8
    Width = 53
    Height = 13
    AutoSize = True
    DataField = 'C'#243'digo'
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 8
    Top = 360
    Width = 85
    Height = 16
    Caption = 'Observa'#231#245'es:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 8
    Top = 272
    Width = 40
    Height = 16
    Caption = 'Nome:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel
    Left = 296
    Top = 312
    Width = 41
    Height = 16
    Caption = 'Sisdia:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label11: TLabel
    Left = 296
    Top = 272
    Width = 35
    Height = 16
    Caption = 'Setor:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 312
    Width = 39
    Height = 16
    Caption = 'Senha'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 152
    Top = 312
    Width = 68
    Height = 16
    Caption = 'T-Systems:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 264
    Top = 40
    Width = 129
    Height = 21
    TabOrder = 1
    OnEnter = Edit1Enter
    OnKeyPress = Edit1KeyPress
  end
  object Edit2: TEdit
    Left = 264
    Top = 64
    Width = 129
    Height = 21
    TabOrder = 3
    OnEnter = Edit2Enter
    OnKeyPress = Edit2KeyPress
  end
  object ComboBox1: TComboBox
    Left = 144
    Top = 40
    Width = 113
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 0
    Text = 'Come'#231'a com...'
    OnEnter = ComboBox1Enter
    Items.Strings = (
      'Come'#231'a com...'
      'Cont'#233'm...')
  end
  object ComboBox2: TComboBox
    Left = 144
    Top = 64
    Width = 113
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 2
    Text = 'Come'#231'a com..'
    OnEnter = ComboBox2Enter
    Items.Strings = (
      'Come'#231'a com..'
      'Cont'#233'm..')
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 136
    Width = 553
    Height = 121
    Ctl3D = True
    DataSource = DataSource1
    Options = []
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 10
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'nome'
        Title.Caption = 'Nome'
        Width = 300
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'tsystems'
        Title.Alignment = taCenter
        Title.Caption = 'T-Systems'
        Width = 230
        Visible = True
      end>
  end
  object dbsisdia: TDBEdit
    Left = 296
    Top = 328
    Width = 129
    Height = 19
    BevelInner = bvNone
    Color = cl3DLight
    Ctl3D = False
    DataField = 'sisdia'
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 8
  end
  object dbnome: TDBEdit
    Left = 8
    Top = 288
    Width = 273
    Height = 19
    BevelInner = bvNone
    Color = cl3DLight
    Ctl3D = False
    DataField = 'nome'
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
  end
  object dbsetor: TDBEdit
    Left = 296
    Top = 288
    Width = 129
    Height = 19
    BevelInner = bvNone
    Color = cl3DLight
    Ctl3D = False
    DataField = 'setor'
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
  end
  object dbmemo: TDBMemo
    Left = 8
    Top = 377
    Width = 417
    Height = 56
    BevelInner = bvNone
    Color = cl3DLight
    Ctl3D = False
    DataField = 'obs'
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 100
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 9
  end
  object dbsenha: TDBEdit
    Left = 8
    Top = 328
    Width = 129
    Height = 19
    BevelInner = bvNone
    Color = cl3DLight
    Ctl3D = False
    DataField = 'senha'
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 6
  end
  object dbtsystem: TDBEdit
    Left = 152
    Top = 328
    Width = 129
    Height = 19
    BevelInner = bvNone
    Color = cl3DLight
    Ctl3D = False
    DataField = 'tsystems'
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 7
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 480
    Top = 296
  end
  object ADOQuery1: TADOQuery
    Connection = Login.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tsystems')
    Left = 448
    Top = 296
  end
end
