unit TurnOnFilter;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm3 = class(TForm)
    ComboBox1: TComboBox;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  FilterNum: integer;

implementation

uses TransmitReceiveCOM;
{$R *.dfm}

// обработка выбора номера фильтра из списка
procedure TForm3.ComboBox1Change(Sender: TObject);
var
  CI:TStrings;
begin
  CI := ComboBox1.Items;
  FilterNum := ComboBox1.ItemIndex + 1;
end;

// обработка кнопки Отправить
procedure TForm3.Button1Click(Sender: TObject);
var
  msg: string;
begin
  if not (FilterNum > 0) then
  begin
    ShowMessage('Ошибка! Ни один из фильтров не выбран!');
    Exit;
  end;

  msg:= '00'+IntToHex(FilterNum,1)+'0';
  WriteCOM(msg,0);
  FilterNum := 0;
end;

// обработка кнопки Отмена
procedure TForm3.Button2Click(Sender: TObject);
begin
  Form3.Close;
end;

end.
