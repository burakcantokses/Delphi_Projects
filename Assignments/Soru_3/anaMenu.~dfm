object Form1: TForm1
  Left = 192
  Top = 125
  Width = 761
  Height = 285
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
  object Label1: TLabel
    Left = 408
    Top = 16
    Width = 65
    Height = 13
    Caption = 'K'#305'sa Kenar'
  end
  object Label2: TLabel
    Left = 40
    Top = 16
    Width = 97
    Height = 13
    Caption = 'Uzun Kenar'
  end
  object kisaKenarInput: TEdit
    Left = 408
    Top = 32
    Width = 305
    Height = 21
    TabOrder = 0
  end
  object uzunKenarInput: TEdit
    Left = 40
    Top = 32
    Width = 305
    Height = 21
    TabOrder = 1
  end
  object kaydetButton: TButton
    Left = 40
    Top = 64
    Width = 673
    Height = 25
    Caption = 'Kaydet'
    TabOrder = 2
    OnClick = kaydetButtonClick
  end
  object DBGrid1: TDBGrid
    Left = 40
    Top = 104
    Width = 673
    Height = 120
    DataSource = DataSource1
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Kimlik'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KisaKenar'
        Width = 135
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UzunKenar'
        Width = 135
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Alan'
        Width = 135
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cevre'
        Width = 135
        Visible = True
      end>
  end
  object ADOQuery1: TADOQuery
    Active = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\Projects\Delphi\' +
      'Delphi_Projects\Assignments\Soru_3\bilgiler.mdb;Persist Security' +
      ' Info=False'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from dikdortgenHesap')
    Left = 208
    Top = 160
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 248
    Top = 160
  end
end
