object Form1: TForm1
  Left = 192
  Top = 125
  Width = 551
  Height = 320
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 24
    Top = 104
    Width = 497
    Height = 161
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object startButton: TButton
    Left = 56
    Top = 24
    Width = 425
    Height = 65
    Caption = 'T'#305'kla'
    TabOrder = 1
    OnClick = startButtonClick
  end
  object DataSource1: TDataSource
    Left = 160
    Top = 168
  end
  object ADOQuery1: TADOQuery
    Parameters = <>
    Left = 192
    Top = 168
  end
end
