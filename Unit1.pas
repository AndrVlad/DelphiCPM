unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Samples.Spin;

type
  TFCom31 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    SpinEdit1: TSpinEdit;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCom31: TFCom31;
  stopButtonPressed: Boolean;
  voltageSource: integer;
  voltageSourceVal: integer;
implementation

uses Unit2,pr1,TransmitReceiveCOM;

{$R *.dfm}


function GetLastErrorMessage: string;
var
  ErrorCode: DWORD;
  Buffer: array[0..255] of Char;
begin
  ErrorCode := GetLastError;
  FormatMessage(
    FORMAT_MESSAGE_FROM_SYSTEM,
    nil,
    ErrorCode,
    0,
    Buffer,
    Length(Buffer),
    nil
  );
  Result := Format('Error code: %d, Message: %s', [ErrorCode, Buffer]);
end;

// �������� ������� ��������� ���������� �� ��������� ��-���������
procedure TFCom31.Button1Click(Sender: TObject);
var
  msg: string;
begin

  if (voltageSource = 0) or (voltageSourceVal = 0) then
  begin
    ShowMessage('������! �� ������ �������� ��� �� ������� ����������');
    Exit;
  end;

  if (voltageSource > 15) then
  begin
     msg := msg+IntToHex(voltageSourceVal,2)+IntToHex(voltageSource-16,1)+'E';
     WriteCOM(msg,1);
  end
  else
  begin
     msg := msg+IntToHex(voltageSourceVal,2)+IntToHex(voltageSource,1)+'E';
     WriteCOM(msg,0);
  end;
  FCom31.Close;
end;

procedure TFCom31.Button2Click(Sender: TObject);
begin
  FCom31.Close;
end;

// ����� ��-��������� �� ������
procedure TFCom31.ComboBox1Change(Sender: TObject);
var
  CI:TStrings;
begin
  CI := ComboBox1.Items;
  voltageSource := ComboBox1.ItemIndex + 1;
end;

// ����� �������� ���������� ��-���������
procedure TFCom31.SpinEdit1Change(Sender: TObject);
begin
    voltageSourceVal := SpinEdit1.Value;
end;

end.
