unit SetTexp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, TransmitReceiveCOM;

type
  TWriteTexp = class(TForm)
    ComboBox1: TComboBox;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure ComboBox1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WriteTexp: TWriteTexp;
  TExp: Byte = 0;

implementation

{$R *.dfm}

procedure TWriteTexp.Button1Click(Sender: TObject);
var
  msg: string;
begin
  msg := '0'+IntToHex(TExp,1)+'0'+'9';
  WriteCOM(msg,0);
  WriteTexp.Close;
end;

procedure TWriteTexp.Button2Click(Sender: TObject);
begin
  WriteTexp.Close;
end;

procedure TWriteTexp.ComboBox1Change(Sender: TObject);
var
  CI:TStrings;
begin
  CI := ComboBox1.Items;
  TExp := ComboBox1.ItemIndex;
end;

end.
