unit anaMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    DBGrid1: TDBGrid;
    iller: TComboBox;
    ilceler: TComboBox;
    kaydet: TButton;
    ADOTable1: TADOTable;
    procedure FormCreate(Sender: TObject);
    procedure illerChange(Sender: TObject);
    procedure kaydetClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function GetComputerName: string;
begin
  Result := GetEnvironmentVariable('COMPUTERNAME');
end;


procedure getCities(query: TADOQuery; iller: TComboBox);
begin
  query.SQL.Clear;
  query.SQL.Add('SELECT * FROM iller');
  query.Open;

  iller.Clear;
  while not query.Eof do
  begin
    iller.Items.Add(query.FieldByName('adi').AsString);
    query.Next;
  end;
end;

procedure getDistricts(sehirAdi: string; query: TADOQuery; ilceler: TComboBox);
begin
  query.SQL.Clear;
  query.SQL.Add('SELECT ilceler.Adi');
  query.SQL.Add('FROM iller INNER JOIN ilceler ON iller.Plaka = ilceler.Plaka');
  query.SQL.Add('WHERE iller.Adi = :sehirAdi');
  query.Parameters.ParamByName('sehirAdi').Value := sehirAdi;
  query.Open;

  ilceler.Clear;
  while not query.Eof do
  begin
    ilceler.Items.Add(query.FieldByName('Adi').AsString);
    query.Next;
  end;
end;

procedure saveData(adres: string; table: TADOTable);
begin
  table.Insert;
  table.FieldByName('kullanici').AsString := GetComputerName;
  table.FieldByName('adres').AsString := adres;
  table.Post;
end;



procedure TForm1.FormCreate(Sender: TObject);
begin
getCities(ADOQuery1, iller);
ilceler.Enabled:=false;
end;

procedure TForm1.illerChange(Sender: TObject);
begin
getDistricts(iller.Text, ADOQuery1, ilceler);
ilceler.Enabled:=true;
end;

procedure TForm1.kaydetClick(Sender: TObject);
var
  adres: string;
  soruSonucu: Integer;
begin
  if (iller.Text = '') or (iller.Text = '') then
  begin
    ShowMessage('Lütfen il seçin.');
    iller.SetFocus;
    Exit;
  end;

  if (ilceler.Text = '') or (ilceler.Text = '') then
  begin
    ShowMessage('Lütfen ilçe seçin.');
    ilceler.SetFocus;
    Exit;
  end;

  adres := iller.Text + ' iline ait ' + ilceler.Text + ' ilçesi kaydedilsin mi?';

  soruSonucu := MessageDlg(adres, mtConfirmation, [mbYes, mbNo], 0);

  case soruSonucu of
    mrYes:
      begin
        adres:= iller.Text + ' Ýli ' + ilceler.Text + ' Ýlçesi';
        saveData(adres, ADOTable1);
        ShowMessage('Adres kaydedildi.');
      end;
    mrNo:
      begin
        ShowMessage('Kaydetme iþlemi iptal edildi.');
      end;
  end;
end;


end.
