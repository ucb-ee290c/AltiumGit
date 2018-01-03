object BOMBuilderIntf: TBOMBuilderIntf
  Left = 5
  Top = 4
  Caption = 'BOM Builder Intface'
  ClientHeight = 366
  ClientWidth = 425
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object bDisplay: TButton
    Left = 24
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Display'
    TabOrder = 0
    OnClick = bDisplayClick
  end
  object bClose: TButton
    Left = 320
    Top = 328
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 1
    OnClick = bCloseClick
  end
  object Memo1: TMemo
    Left = 128
    Top = 32
    Width = 264
    Height = 272
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object OpenDialog1: TOpenDialog
    Left = 24
    Top = 304
  end
  object SaveDialog1: TSaveDialog
    Left = 80
    Top = 304
  end
end
