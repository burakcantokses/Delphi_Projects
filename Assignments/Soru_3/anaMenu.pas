unit anaMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, Grids, DBGrids;

type
  TForm1 = class(TForm)
    kisaKenarInput: TEdit;
    uzunKenarInput: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    kaydetButton: TButton;
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    procedure kaydetButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  var
    cevre, alan : double;
implementation

{$R *.dfm}

procedure cevreHesap(kisaKenar, uzunKenar : integer);
begin
  cevre:= (kisaKenar*2) + (uzunKenar*2);
end;

procedure alanHesap(kisaKenar, uzunKenar : integer);
begin
  alan:= kisaKenar*uzunKenar;
end;

procedure tabloYenile(query : TADOQuery);
var
  sql : string;
begin
  sql:= 'select * from dikdortgenHesap';
  query.SQL.Clear;
  query.SQL.Text:= sql;
  query.Open;
  ShowMessage('Veriler baþarýlý bir þekilde kaydedildi.');
end;

procedure veriKaydet(kisaKenar, uzunKenar : integer; alan, cevre : double; query : TADOQuery);
begin
  query.SQL.Clear;
  query.SQL.Add('INSERT INTO dikdortgenHesap(KisaKenar, UzunKenar, Alan, Cevre)');
  query.SQL.Add('VALUES(:kisaKenar, :uzunKenar, :alan, :cevre)');
  query.Parameters.ParamByName('kisaKenar').Value:= kisaKenar;
  query.Parameters.ParamByName('uzunKenar').Value:= uzunKenar;
  query.Parameters.ParamByName('alan').Value:= alan;
  query.Parameters.ParamByName('cevre').Value:= cevre;
  query.ExecSQL;
  tabloYenile(query);
end;

procedure TForm1.kaydetButtonClick(Sender: TObject);
var
  kisaKenar, uzunKenar : integer;
begin
  kisaKenar:= StrToInt(kisaKenarInput.Text);
  uzunKenar:= StrToInt(uzunKenarInput.Text);
  cevreHesap(kisaKenar, uzunKenar);
  alanHesap(kisaKenar, uzunKenar);
  veriKaydet(kisaKenar, uzunKenar, alan, cevre, ADOQuery1);

end;


end.
