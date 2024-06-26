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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCom31: TFCom31;
  stopButtonPressed: Boolean;

implementation

uses Unit2,pr1;

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

procedure TFCom31.Button1Click(Sender: TObject);
var
  buffer: array[0..255] of Byte;
  bytesWritten: DWORD;
  OverWrite: POverlapped;
begin
  //ShowMessage('������ ����������');
  //bytesWritten := 0;
  buffer[0]:=$42;

  if FControls.Phndl = INVALID_HANDLE_VALUE then
  ShowMessage('������ ����������� �����')
  else
  ShowMessage('���������� ����� ������������');

  if(not WriteFile(FControls.Phndl, buffer, 1, bytesWritten, nil))
  and (GetLastError <> ERROR_IO_PENDING) then
    ShowMessage(GetLastErrorMessage)
    //ShowMessage('������ � ������� ��������')
  else
    ShowMessage('TRUE � ������� ��������');

  if bytesWritten > 0 then
      ShowMessage('������ ����������')
    else
      ShowMessage('������ ��������');




  FCom31.Close;
end;

procedure TFCom31.Button2Click(Sender: TObject);
begin
  FCom31.Close;
end;

end.
