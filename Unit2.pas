unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFControls = class(TForm)
    GroupBox1: TGroupBox;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure ComboBox1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    //procedure InquiryPort(Sender: TObject);
  private
    { Private declarations }
  public
    Phndl: THandle;
    PortName: string;
    DCB: TDcb;
    procedure InquiryPort(Sender: TObject);

  end;

var
  FControls: TFControls;

implementation

{$R *.dfm}

procedure TFControls.Button1Click(Sender: TObject);
begin

  Phndl := CreateFile(PChar(PortName),
  GENERIC_READ or GENERIC_WRITE, 0, nil,
  OPEN_EXISTING, FILE_FLAG_OVERLAPPED, 0);

  if Phndl <> INVALID_HANDLE_VALUE then
    ShowMessage('���� ������')
  else
    ShowMessage('���� �� ������� �������');

  GetCommState(Phndl, DCB);

  DCB.BaudRate := 115200;
  DCB.Parity := NOPARITY;
  DCB.ByteSize := 8;
  DCB.StopBits := ONESTOPBIT;

  if (SetCommState(Phndl, DCB)) then
    ShowMessage('��������� ������');

  PurgeComm(Phndl, PURGE_TXCLEAR or PURGE_RXCLEAR);
  {

  if (PurgeComm(Phndl, PURGE_TXCLEAR or PURGE_RXCLEAR)) then
    ShowMessage('����� ������');  }

end;

procedure TFControls.Button2Click(Sender: TObject);
begin
  ShowMessage('�������� �����');
  CloseHandle(Phndl);

end;

procedure TFControls.ComboBox1Change(Sender: TObject);
var
  CI: TStrings;
  item_ind: integer;
begin
  CI:=ComboBox1.Items;
  item_ind:=ComboBox1.ItemIndex;
  PortName:=CI[item_ind];

end;

procedure TFControls.InquiryPort(Sender: TObject);
var
  i: integer;
begin

  for i := 0 to 31 do
  begin
  Phndl := CreateFile(PChar('COM' + IntToStr(i + 1)),
  GENERIC_READ or GENERIC_WRITE, 0, nil,
  OPEN_EXISTING, FILE_FLAG_OVERLAPPED, 0);

  if Phndl <> INVALID_HANDLE_VALUE then
  ComboBox1.Items.Add('COM' + IntToStr(i + 1));
  CloseHandle(Phndl);
end;
end;

end.
