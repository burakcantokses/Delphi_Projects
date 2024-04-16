unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, DB, ADODB;

type
  TForm2 = class(TForm)
    kayitOlButton: TButton;
    kullaniciAdiInput: TEdit;
    sifreInput: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    isimInput: TEdit;
    Label3: TLabel;
    soyisimInput: TEdit;
    Label4: TLabel;
    tekrarSifreInput: TEdit;
    Label5: TLabel;
    sifreGoster: TBitBtn;
    randomSifre: TBitBtn;
    girisYapLabel: TLabel;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    procedure girisYapLabelClick(Sender: TObject);
    procedure kayitOlButtonClick(Sender: TObject);
    procedure sifreGosterClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure randomSifreClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  sifreGosterKontrol : Boolean;
  sql : string;

implementation

uses Unit1, Math;

{$R *.dfm}

procedure veriTemizle();
begin
  Form2.isimInput.Text:='';
  Form2.soyisimInput.Text:='';
  Form2.kullaniciAdiInput.Text:='';
  Form2.sifreInput.Text:='';
  Form2.tekrarSifreInput.Text:='';

  Form2.isimInput.SetFocus;
end;

procedure TForm2.girisYapLabelClick(Sender: TObject);
begin
  Form1.Show;
  Form2.Hide;
end;

function cokluVeriKontrolEt(kullaniciAdi : string; query : TADOQuery): Boolean;
begin
  sql:= 'SELECT * FROM kullanicilar WHERE Kullanici_Adi = :kAdiParam';
  query.SQL.Clear;
  query.SQL.Text:= sql;
  query.Parameters.ParamByName('kAdiParam').Value:= kullaniciAdi;
  query.Open;
  Result:= query.IsEmpty;
end;

procedure veriKaydet(isim, soyisim, kullaniciAdi, sifre : string; query : TADOQuery);
var
  kopyaVeri : Boolean;
begin
  if (cokluVeriKontrolEt(kullaniciAdi, query) = False) then
  begin
    ShowMessage('Bu kullanici adinda birisi kayitli. Baska bir kullanici adi deneyin.');
    veriTemizle();
    Exit;
  end;

  sql:= 'INSERT INTO kullanicilar(Isim, Soyisim, Kullanici_Adi, Sifre) VALUES(:isimParam, :soyisimParam, :kAdiParam, :sifreParam)';
  query.SQL.Clear;
  query.SQL.Text:=sql;
  query.Parameters.ParamByName('isimParam').Value:=isim;
  query.Parameters.ParamByName('soyisimParam').Value:=soyisim;
  query.Parameters.ParamByName('kAdiParam').Value:=kullaniciAdi;
  query.Parameters.ParamByName('sifreParam').Value:=sifre;

  query.ExecSQL;
  ShowMessage('Kayýdýnýz baþarýlý bir þekilde oluþtu.');

end;

procedure TForm2.kayitOlButtonClick(Sender: TObject);
var
  isim, soyisim, kullaniciAdi, sifre, sifreTekrar : string;
begin
  isim := isimInput.Text;
  soyisim := soyisimInput.Text;
  kullaniciAdi := kullaniciAdiInput.Text;
  sifre := sifreInput.Text;
  sifreTekrar := tekrarSifreInput.Text;

  if (isim = '') then begin ShowMessage('Ýsim alaný boþ olamaz.'); isimInput.SetFocus; Exit; end;
  if (soyisim = '') then begin ShowMessage('Soyisim alaný boþ olamaz.'); soyisimInput.SetFocus; Exit; end;
  if (kullaniciAdi = '') then begin ShowMessage('Kullanýcý adý alaný boþ olamaz.'); kullaniciAdiInput.SetFocus; Exit; end;
  if (sifre = '') then begin ShowMessage('Þifre alaný boþ olamaz.'); sifreInput.SetFocus; Exit; end;
  if (sifreTekrar = '') then begin ShowMessage('Tekrar þifre alaný boþ olamaz.'); tekrarSifreInput.SetFocus; Exit; end;

  if (sifre <> sifreTekrar) then begin ShowMessage('Þifreler eþleþmiyor.'); sifreInput.SetFocus; Exit; end;

  veriKaydet(isim, soyisim, kullaniciAdi, sifre, ADOQuery1);
  Form2.Hide;
  Form1.Show;
end;


procedure TForm2.sifreGosterClick(Sender: TObject);
begin
  if (sifreGosterKontrol = False) then 
  begin
    sifreInput.PasswordChar := #0;
    sifreGosterKontrol := True;
  end
  else
  begin
    sifreInput.PasswordChar := '*';
    sifreGosterKontrol := False;
  end;
end;


procedure TForm2.FormCreate(Sender: TObject);
begin
  sifreGosterKontrol:=false;
end;


procedure TForm2.randomSifreClick(Sender: TObject);
var
  i: Integer;
  generatedPassword: String;
  specialChars : Array of Char;
  specialString : String;
  letterChars : Array of Char;
  letters : String;
  randomNumber : Integer;
begin
  generatedPassword := '';
  specialString:='!#$%&()*+,-./:;<=>?@[\]^_`{|}~';
  letters:='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';

  SetLength(specialChars, Length(specialString));
  SetLength(letterChars, Length(letters));
  Randomize;
  
  for i := 1 to Length(specialString) do
    specialChars[i - 1] := specialString[i];

  for i := 1 to Length(letters) do
    letterChars[i - 1] := letters[i];

  for i := 1 to 10 do
  begin
    randomNumber := RandomRange(1, 3);
    case randomNumber of
      1:
        begin
          generatedPassword:= generatedPassword + specialChars[Random(Length(specialChars))];
          Continue;
        end;
      2:
        begin
          generatedPassword:= generatedPassword + letterChars[Random(Length(letterChars))];
          Continue;
        end;
      3:
        begin
          generatedPassword:= generatedPassword + IntToStr(Random(10));
          Continue;
        end;
      else
        ShowMessage('Bilinmeyen bir hata olustu.');
        Exit;
       end;
  end;

  sifreInput.Text:= generatedPassword;

end;



end.
