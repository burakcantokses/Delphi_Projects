object Form1: TForm1
  Left = 552
  Top = 193
  Width = 686
  Height = 483
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
  object Label2: TLabel
    Left = 136
    Top = 24
    Width = 13
    Height = 13
    Caption = 'Ad'
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 670
    Height = 177
    Align = alTop
    BorderStyle = bsNone
    DataSource = DataSource1
    Font.Charset = TURKISH_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = TURKISH_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Kimlik'
        Width = 123
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Ad'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Soyad'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Memleket'
        Width = 150
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 184
    Width = 649
    Height = 241
    Caption = 'Arama Yap'
    TabOrder = 1
    object Label1: TLabel
      Left = 32
      Top = 32
      Width = 15
      Height = 14
      Caption = 'Ad'
      Font.Charset = TURKISH_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 32
      Top = 96
      Width = 33
      Height = 14
      Caption = 'Soyad'
      Font.Charset = TURKISH_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 32
      Top = 48
      Width = 313
      Height = 43
      Font.Charset = TURKISH_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object ARA: TButton
      Left = 32
      Top = 160
      Width = 313
      Height = 41
      Caption = 'ARA'
      Font.Charset = TURKISH_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = ARAClick
    end
    object GroupBox2: TGroupBox
      Left = 384
      Top = 40
      Width = 249
      Height = 169
      Caption = 'Se'#231'ilen M'#252#351'teri Bilgileri'
      Enabled = False
      TabOrder = 2
      object adLabel: TLabel
        Left = 16
        Top = 24
        Width = 5
        Height = 18
        Font.Charset = TURKISH_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object soyadLabel: TLabel
        Left = 16
        Top = 56
        Width = 5
        Height = 18
        Font.Charset = TURKISH_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object memleketLabel: TLabel
        Left = 16
        Top = 88
        Width = 5
        Height = 18
        Font.Charset = TURKISH_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
  end
  object Edit2: TEdit
    Left = 40
    Top = 304
    Width = 313
    Height = 43
    Font.Charset = TURKISH_CHARSET
    Font.Color = clWindowText
    Font.Height = -29
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object ADOQuery1: TADOQuery
    Active = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=F:\Universite\Manav' +
      'gat_MYO\Veri_Tabani_II\27.03.2024\odev\bilgiler.mdb;Persist Secu' +
      'rity Info=False'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM musteriler')
    Left = 608
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 608
    Top = 40
  end
end
