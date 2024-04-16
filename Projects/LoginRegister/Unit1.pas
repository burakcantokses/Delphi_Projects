unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB;

type
  TForm1 = class(TForm)
    girisYapButton: TButton;
    kullaniciAdiInput: TEdit;
    sifreInput: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    kayitOlLabel: TLabel;
    procedure kayitOlLabelClick(Sender: TObject);
    procedure girisYapButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  sql : string;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm1.kayitOlLabelClick(Sender: TObject);
begin
  Form2.Show;
  Form1.Hide;
end;

procedure veriTemizle();
begin
  Form1.kullaniciAdiInput.Text:='';
  Form1.sifreInput.Text:='';

  Form1.kullaniciAdiInput.SetFocus;
end;

procedure girisYap(kullaniciAdi, sifre : string; query : TADOQuery);
begin
  sql:= 'SELECT * FROM kullanicilar WHERE Kullanici_Adi = :kAdiParam and sifre = :sifreParam';
  query.SQL.Clear;
  query.SQL.Text:= sql;
  query.Parameters.ParamByName('kAdiParam').Value:= kullaniciAdi;
  query.Parameters.ParamByName('sifreParam').Value:= sifre;
  query.Open;

  if (query.IsEmpty) then
  begin
    ShowMessage('Kayýt bulunamadi');
    Exit;
  end;
  ShowMessage('Kayýt bulundu');
end;

procedure TForm1.girisYapButtonClick(Sender: TObject);
var
  kullaniciAdi, sifre : string;
begin
  kullaniciAdi := kullaniciAdiInput.Text;
  sifre := sifreInput.Text;

  if (kullaniciAdi = '') then begin ShowMessage('Kullanýcý adý alaný boþ olamaz.'); kullaniciAdiInput.SetFocus; Exit; end;
  if (sifre = '') then begin ShowMessage('Þifre alaný boþ olamaz.'); sifreInput.SetFocus; Exit; end;

  girisYap(kullaniciAdi, sifre, Form2.ADOQuery1);

end;

end.
