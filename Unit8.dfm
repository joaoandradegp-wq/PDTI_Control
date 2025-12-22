object AboutBox: TAboutBox
  Left = 286
  Top = 373
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Sobre o Phobos DTI Control'
  ClientHeight = 154
  ClientWidth = 435
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 417
    Height = 137
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentColor = True
    TabOrder = 0
    object ProgramIcon: TImage
      Left = 24
      Top = 32
      Width = 32
      Height = 32
      AutoSize = True
      Center = True
      Picture.Data = {
        055449636F6E0000010001002020040000000000E80200001600000028000000
        2000000040000000010004000000000000020000000000000000000000000000
        0000000000000000000080000080000000808000800000008000800080800000
        80808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
        FFFFFF0077777700077777777777777000777777F88888707888888888888887
        078FFFFF77777F8088777777777777F808888887000000F0870000000000000F
        8870000008888777778888880000000787000000804477F88706000080000000
        8000000085000000004760008000000080000000800AA0000300000080000000
        8000000084000000000000008000000080000000080000000000000880000000
        8000000000866436630700888888887F88788880000870000000080804477440
        4060000800008000000080085000000004760008088800000000088800AA0000
        3000000880000000000000008000000000000008807777777777777080000000
        0000008080877777777777708866436630700800808777777777777080870000
        0000800080877777777777708008000000080000808777777777777088800000
        0000888080877777777777708000000000000008808777777777777087777777
        7777770880888888888888708877777777777708808888888888888088777777
        7777770880741000000000008877777777777708088888888888888808777777
        7777770800000000000000080877777777777708000000000000000808777777
        7777770800000000000000080888888888888708000000000000000808888888
        8888880800000000000000080741000000000008000000000000000088888888
        88888880038001C00100008000000000F83FFC1F8000FE3F00007E3F00007E3F
        00007E3F00007E3F80007E3FC0000001E0020000F00600008000000000000000
        0000000100000003000040070000600F00000001000000000000000000000000
        000000000000000080000000FFFE0000FFFE0000FFFE0000FFFE0000FFFE0000
        FFFF0001}
      Stretch = True
      IsControl = True
    end
    object ProductName: TLabel
      Left = 88
      Top = 24
      Width = 93
      Height = 13
      Caption = 'Phobos DTI Control'
      IsControl = True
    end
    object Version: TLabel
      Left = 88
      Top = 40
      Width = 81
      Height = 13
      Caption = 'Vers'#227'o 1.0 Alpha'
      IsControl = True
    end
    object Comments: TLabel
      Left = 88
      Top = 56
      Width = 209
      Height = 13
      Caption = 'Desenvolvido para a Cardiesel e Grupo VDL'
      WordWrap = True
      IsControl = True
    end
    object Label1: TLabel
      Left = 88
      Top = 88
      Width = 217
      Height = 13
      Caption = 'Desenvolvedor: Jo'#227'o M'#225'rcio Bicalho Andrade'
      WordWrap = True
      IsControl = True
    end
    object Label2: TLabel
      Left = 88
      Top = 104
      Width = 164
      Height = 13
      Caption = 'Contato: joaomarcioba@gmail.com'
      IsControl = True
    end
    object OKButton: TButton
      Left = 327
      Top = 16
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = OKButtonClick
    end
  end
end
