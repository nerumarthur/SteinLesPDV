object configDB: TconfigDB
  Left = 0
  Top = 0
  Caption = 'Configura'#231#227'o do Banco de Dados'
  ClientHeight = 161
  ClientWidth = 484
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 484
    Height = 161
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 18
      Width = 104
      Height = 13
      Caption = 'Local Banco de Dados'
    end
    object edLocal: TEdit
      Left = 24
      Top = 37
      Width = 289
      Height = 21
      TabOrder = 0
    end
    object Button1: TButton
      Left = 238
      Top = 80
      Width = 75
      Height = 25
      Caption = 'Configurar'
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object opnPastas: TOpenDialog
    DefaultExt = 'FDB'
    FileName = 'DADOS'
    Filter = '-'
    Left = 416
    Top = 64
  end
end
