object FrmCaixaTela: TFrmCaixaTela
  Left = 0
  Top = 0
  Caption = 'Caixa'
  ClientHeight = 572
  ClientWidth = 932
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
    Width = 932
    Height = 572
    Align = alClient
    Color = clBlack
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = 504
    ExplicitTop = 248
    ExplicitWidth = 185
    ExplicitHeight = 41
    object DBGrid1: TDBGrid
      Left = 120
      Top = 112
      Width = 673
      Height = 313
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object Panel2: TPanel
      Left = 224
      Top = 496
      Width = 185
      Height = 41
      Caption = 'Abrir Caixa'
      Color = 15787726
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
    end
    object Panel3: TPanel
      Left = 496
      Top = 496
      Width = 185
      Height = 41
      Caption = 'Fechar Caixa'
      Color = 15787726
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
    end
  end
end
