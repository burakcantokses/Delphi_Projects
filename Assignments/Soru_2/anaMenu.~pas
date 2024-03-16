unit anaMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, Grids, DBGrids, ADODB;

type
  TForm1 = class(TForm)
    showInputBox: TButton;
    ADOTable1: TADOTable;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    fahToCelcius: TRadioButton;
    celciusToFah: TRadioButton;
    procedure showInputBoxClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


function fahreneiht(value : Double): Double;
var
  fahreneihtValue : Double;
begin
  fahreneihtValue:= value*1.8+32;
  Result:= fahreneihtValue;
end;

function celcius(value : Double): Double;
var
  celciusValue : Double;
begin
  celciusValue:= (value-32)/1.8;
  Result:= celciusValue;
end;

function calculateData(tempTo : string; value : Double): Double;
begin
  if (tempTo='Celcius') then Result:=celcius(value);
  if (tempTo='Fahreneiht') then Result:=fahreneiht(value);
end;

function GetComputerName: string;
begin
  Result := GetEnvironmentVariable('COMPUTERNAME');
end;

procedure saveData(temp, tempTo: string; firstValue, resultValue: Double; adoTable: TADOTable);
var
  date: TDateTime;
  user: string;
begin
  date := Now;
  user := GetComputerName;
  temp:= FloatToStr(firstValue) + ' ' + temp;
  tempTo:= FloatToStr(resultValue) + ' ' + tempTo;

  adoTable.Append;
  adoTable.FieldByName('Kisi').AsString := user;
  adoTable.FieldByName('HangiSicaklikDegeri').AsString := temp;
  adoTable.FieldByName('SonucDeger').AsString := tempTo;
  adoTable.FieldByName('Tarih').AsDateTime := date;
  adoTable.Post;
end;

procedure TForm1.showInputBoxClick(Sender: TObject);
var
  inputValue, temp, tempTo: string;
  firstValue, resultValue: Double;

begin
  if (celciusToFah.Checked = true) then
  begin
    temp:='Celcius';
    tempTo:='Fahreneiht';
  end;

  if (fahToCelcius.Checked = true) then
  begin
    temp:='Fahreneiht';
    tempTo:='Celcius';
  end;

  while True do
  begin
    inputValue := InputBox('Sýcaklýk Deðeri', 'Lütfen ' + temp + ' deðerini girin:', '30');
    if (Length(inputValue) > 0) and TryStrToFloat(inputValue, firstValue) then
    begin
      firstValue:= StrToFloat(inputValue);
      Break;
    end
    else
      ShowMessage('Geçersiz giriþ! Lütfen sadece rakamlardan oluþan ve boþ deðer olmayan bir sayý girin.');
  end;
  resultValue:=calculateData(tempTo, firstValue);
  ShowMessage(FloatToStr(resultValue));
  saveData(temp, tempTo, firstValue, resultValue, ADOTable1);
end;



end.


