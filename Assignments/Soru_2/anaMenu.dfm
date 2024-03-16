object Form1: TForm1
  Left = 192
  Top = 124
  Width = 1438
  Height = 452
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object showInputBox: TButton
    Left = 64
    Top = 88
    Width = 73
    Height = 25
    Caption = 'T'#305'kla'
    TabOrder = 0
    OnClick = showInputBoxClick
  end
  object DBGrid1: TDBGrid
    Left = 224
    Top = 16
    Width = 1169
    Height = 377
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Kimlik'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Kisi'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HangiSicaklikDegeri'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SonucDeger'
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Tarih'
        Width = 100
        Visible = True
      end>
  end
  object celciusToFah: TRadioButton
    Left = 32
    Top = 32
    Width = 150
    Height = 17
    Caption = 'Celsius -> Fahrenheit'
    Checked = True
    TabOrder = 2
    TabStop = True
  end
  object fahToCelcius: TRadioButton
    Left = 32
    Top = 56
    Width = 150
    Height = 17
    Caption = 'Fahrenheit -> Celcius'
    TabOrder = 3
  end
  object ADOTable1: TADOTable
    Active = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\Projects\Delphi\' +
      'Delphi_Projects\Assignments\Soru_2\data1.mdb;Persist Security In' +
      'fo=False'
    CursorType = ctStatic
    TableName = 'bilgiler'
    Left = 312
    Top = 328
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 272
    Top = 328
  end
end
