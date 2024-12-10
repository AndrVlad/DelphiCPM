unit WriteSpeed;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm9 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    ComboBox1: TComboBox;
    procedure ComboBox1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;
  SpeedVal: Byte;

implementation

uses TransmitReceiveCOM, pr1, ModbusTransmitReceive;

{$R *.dfm}

// Обработчик кнопки "Отправить"
procedure TForm9.Button1Click(Sender: TObject);
var
  msg: string;
  temp: Integer;
begin

  if (SpeedVal = -1) then
  begin
    ShowMessage('Ошибка! Ничего не задано');
    Exit;
  end;

     msg := msg+IntToHex(SpeedVal,2)+'61';

  SpeedVal:=0;

  case ConnectionType of
  1: WriteCOM(msg,0);
  2: WriteEthernet(msg,0);
  end;
  winMain.Memo1.Lines.Add(#13#10);
  //ShowMessage('Отправлено '+msg);

  Form9.Close;
end;

// Обработчик кнопки "Отмена"
procedure TForm9.Button2Click(Sender: TObject);
begin
  Form9.Close;
end;

// Обработчик выбора номера кристалла
procedure TForm9.ComboBox1Change(Sender: TObject);
var
  CI:TStrings;
begin
  CI := ComboBox1.Items;
  SpeedVal := ComboBox1.ItemIndex;
  Button1.Enabled := True;
end;

end.
