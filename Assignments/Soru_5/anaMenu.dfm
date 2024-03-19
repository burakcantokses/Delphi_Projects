object Form1: TForm1
  Left = 192
  Top = 125
  Width = 1030
  Height = 411
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
  object GroupBox1: TGroupBox
    Left = 24
    Top = 16
    Width = 465
    Height = 305
    Caption = 'Adres Kay'#305't'
    TabOrder = 0
    object iller: TComboBox
      Left = 128
      Top = 48
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      OnChange = illerChange
    end
    object ilceler: TComboBox
      Left = 128
      Top = 104
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 1
    end
    object kaydet: TButton
      Left = 128
      Top = 152
      Width = 145
      Height = 25
      Caption = 'Kaydet'
      TabOrder = 2
      OnClick = kaydetClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 496
    Top = 16
    Width = 473
    Height = 305
    Caption = 'Veri Taban'#305
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 16
      Top = 24
      Width = 441
      Height = 265
      DataSource = DataSource1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'Kimlik'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Kullanici'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Adres'
          Width = 150
          Visible = True
        end>
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 520
    Top = 248
  end
  object ADOQuery1: TADOQuery
    Active = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=adres.mdb;Persist S' +
      'ecurity Info=False'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from bilgiler')
    Left = 24
    Top = 288
  end
  object ADOTable1: TADOTable
    Active = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=adres.mdb;Persist S' +
      'ecurity Info=False'
    CursorType = ctStatic
    TableName = 'bilgiler'
    Left = 552
    Top = 248
  end
end
