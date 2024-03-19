unit anaMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, Grids, DBGrids;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    startButton: TButton;
    ADOConnection1: TADOConnection;
    procedure startButtonClick(Sender: TObject);
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

{$R *.dfm}

procedure refreshData(query : TADOQuery);
begin
  query.SQL.Clear;
  query.SQL.Text:= sql;
  query.Open;
end;

procedure saveData(biggestNumber : integer; query : TADOQuery);
begin
  query.SQL.Clear;
  query.SQL.Add('INSERT INTO sayilar (sayi)');
  query.SQL.Add('VALUES(:number)');
  query.Parameters.ParamByName('number').Value:=biggestNumber;
  query.ExecSQL;
  query.Close;
  refreshData(query);
end;

function setNumberAndGetBiggestNumber(size : integer): integer;
var
  currentNumber, biggestNumber, i : integer;
begin
  for i:=1 to size do
  begin
    currentNumber:=StrToInt(InputBox('Sayý girin', IntToStr(i) + '. Sayýyý Girin:', ''));
    if (i = 1) then biggestNumber:=currentNumber;
    if (i <> 1) and (currentNumber>biggestNumber) then biggestNumber:=currentNumber;
  end;
  Result:=biggestNumber;
end;

procedure TForm1.startButtonClick(Sender: TObject);
var
  questionSize, biggestNumber : integer;
begin
  questionSize:= StrToInt(InputBox('Sayý Girin', 'Kaç sayý girilsin?', '5'));
  biggestNumber:=setNumberAndGetBiggestNumber(questionSize);
  saveData(biggestNumber, ADOQuery1);
  ShowMessage('En büyük sayý ' + IntToStr(biggestNumber) + ' veri tabanýna baþarýlý bir þekilde kayedildi.');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ADOQuery1.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=bilgiler.mdb;Persist Security Info=False';
  sql:= 'SELECT * FROM sayilar';
  ADOQuery1.SQL.Text := sql;
  ADOQuery1.Active:=true;
  ADOQuery1.Open;

  DataSource1.DataSet:= ADOQuery1;
  DBGrid1.DataSource:=DataSource1;
end;

end.
