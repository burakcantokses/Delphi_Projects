object Form1: TForm1
  Left = 598
  Top = 359
  Width = 318
  Height = 436
  Caption = #214'dev 1'
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
  object Label1: TLabel
    Left = 8
    Top = 88
    Width = 109
    Height = 13
    Caption = 'Negatif Say'#305'lar Tablosu'
  end
  object Label2: TLabel
    Left = 8
    Top = 240
    Width = 108
    Height = 13
    Caption = 'Pozisitf Say'#305'lar Tablosu'
  end
  object numberInput: TEdit
    Left = 16
    Top = 8
    Width = 137
    Height = 54
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -43
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object saveButton: TButton
    Left = 160
    Top = 8
    Width = 121
    Height = 57
    Caption = 'Kaydet'
    TabOrder = 1
    OnClick = saveButtonClick
  end
  object negatifSayilarTablo: TDBGrid
    Left = 8
    Top = 104
    Width = 281
    Height = 120
    DataSource = negatifSayilarSource
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object pozitifSayilarTablo: TDBGrid
    Left = 8
    Top = 264
    Width = 281
    Height = 120
    DataSource = pozitifSayilarSource
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object negatifSayilarSource: TDataSource
    DataSet = negatifSayilarQuery
    Left = 120
    Top = 160
  end
  object negatifSayilarQuery: TADOQuery
    Active = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\Projects\Delphi\' +
      'Delphi_Projects\Assignments\Soru_1\negatif.mdb;Persist Security ' +
      'Info=False'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from sayilar')
    Left = 80
    Top = 160
  end
  object pozitifSayilarQuery: TADOQuery
    ConnectionString = 
      'Provider=Microsoft.ACE.OLEDB.12.0;Data Source=D:\Projects\Delphi' +
      '\Delphi_Projects\Assignments\Soru_1\pozitif.accdb;Persist Securi' +
      'ty Info=False'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from sayilar')
    Left = 88
    Top = 320
  end
  object pozitifSayilarSource: TDataSource
    DataSet = pozitifSayilarQuery
    Left = 120
    Top = 320
  end
end
