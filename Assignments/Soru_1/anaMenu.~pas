unit anaMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, Grids, DBGrids;

type
  TForm1 = class(TForm)
    numberInput: TEdit;
    saveButton: TButton;
    negatifSayilarTablo: TDBGrid;
    negatifSayilarSource: TDataSource;
    negatifSayilarQuery: TADOQuery;
    Label1: TLabel;
    Label2: TLabel;
    pozitifSayilarTablo: TDBGrid;
    pozitifSayilarQuery: TADOQuery;
    pozitifSayilarSource: TDataSource;
    procedure saveButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  sql : string;

implementation

uses Math;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  sql:='select * from sayilar'
end;

procedure refreshData(adoQuery : TADOQuery);
begin
  adoQuery.SQL.Clear;
  adoQuery.SQL.Text:= sql;
  adoQuery.Open;
end;

procedure saveData(number : integer; adoQuery : TADOQuery);
begin
  adoQuery.SQL.Clear;
  adoQuery.SQL.Add('INSERT INTO sayilar(sayi)');
  adoQuery.SQL.Add('VALUES("'+ IntToStr(number)+ '")');
  adoQuery.ExecSQL;
  refreshData(adoQuery);
end;

procedure TForm1.saveButtonClick(Sender: TObject);
var
  number : integer;
begin
  number:= StrToInt(numberInput.Text);
  if (number = 0) then
  begin
    ShowMessage('Sayı nötrdür tekrar giriş yapın.');
  end;
  if (number > 0) then
  begin
    ShowMessage('Sayınız pozitif ve başarılı bir şekilde veritabanına kaydedildi.');
    saveData(number, pozitifSayilarQuery);
  end;
  if (number < 0) then
  begin
    ShowMessage('Sayınız negatif ve başarılı bir şekilde veritabanına kaydedildi.');
    saveData(number, negatifSayilarQuery);
  end;

  numberInput.Text:= '';
  numberInput.SetFocus;
end;

end.
