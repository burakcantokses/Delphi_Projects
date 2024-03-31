unit mainMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, DB, ADODB;

type
  TForm1 = class(TForm)
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    ARA: TButton;
    GroupBox2: TGroupBox;
    adLabel: TLabel;
    soyadLabel: TLabel;
    memleketLabel: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ARAClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  sql : string;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
sql:= 'SELECT * FROM musteriler';
GroupBox2.Hide;
end;

procedure tabloTemizle(query : TADOQuery);
begin
  query.SQL.Clear;
  query.SQL.Text:= sql;
  query.Open;
  Form1.GroupBox2.Enabled:= false;
  Form1.GroupBox2.Hide;
  Form1.adLabel.Caption:= '';
  Form1.soyadLabel.Caption:= '';
  Form1.memleketLabel.Caption:= '';
end;

procedure veriDoldur(ad, soyad, memleket : string);
begin
Form1.GroupBox2.Enabled:= true;
Form1.GroupBox2.Show;
Form1.adLabel.Caption:= ad;
Form1.soyadLabel.Caption:= soyad;
Form1.memleketLabel.Caption:= memleket;
end;

procedure ayniVeriSenaryo(query: TADOQuery);
var
  ad, soyad, memleket, mesaj: string;
  i: integer;
begin
  query.First;
  for i := 0 to query.RecordCount - 1 do 
  begin
    ad := query.FieldByName('ad').AsString;
    soyad := query.FieldByName('soyad').AsString;
    memleket := query.FieldByName('memleket').AsString;
    mesaj := 'Müþteri Ad: ' + ad + ' Müþteri Soyad: ' + soyad + ' Müþteri Memleketi: ' + memleket + ' Sýradaki müþteriye geçilsin mi?';

    if MessageDlg(mesaj, mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    begin
      veriDoldur(ad, soyad, memleket);
      break;
    end;
    query.Next;
  end;
end;



procedure veriAra(ad, soyad: string; query: TADOQuery);
var
  araSql: string;
begin
  query.SQL.Clear;
  araSql := 'SELECT * FROM musteriler WHERE ad = :adParam and soyad = :soyadParam';
  query.SQL.Text := araSql;
  query.Parameters.ParamByName('adParam').Value := ad;
  query.Parameters.ParamByName('soyadParam').Value := soyad;
  query.Open;

  if not (query.IsEmpty) then
  begin
    if (query.RecordCount = 1) then
    begin
      Exit;
    end;
    if (query.RecordCount > 1) then
    begin
      if (MessageDlg(inttostr(query.RecordCount) + ' tane ayný veri bulundu. Devam edilsin mi?', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
        Exit;
    end;
  end
  else
  begin
    ShowMessage('Veri bulunamadý.');
    tabloTemizle(query);
    Exit;
  end;
  ayniVeriSenaryo(query);
end;


procedure TForm1.ARAClick(Sender: TObject);
var
  ad, soyad : string;
begin
  ad:= Edit1.Text;
  soyad:= Edit2.Text;
  if (ARA.Caption = 'ARA') then
    begin
    if (ad = '') then
    begin
      ShowMessage('Ad alaný boþ býrakýlamaz.');
      Edit1.SetFocus;
      Exit;
    end;
    if (soyad = '') then
    begin
      ShowMessage('Soyad alaný boþ býrakýlamaz.');
      Edit2.SetFocus;
      Exit;
    end;
    veriAra(ad, soyad, ADOQuery1);
    ARA.Caption:= 'Temizle';
    Exit;
  end;
  if (ARA.Caption = 'Temizle') then
  begin
    Edit1.Text:= '';
    Edit2.Text:= '';
    tabloTemizle(ADOQuery1);
    ARA.Caption:= 'ARA';
    Exit;
  end;

end;

end.
