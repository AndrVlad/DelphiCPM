unit TransmitReceiveCOM;

interface
procedure ReadCOM;
procedure InitCOM(PortName: string);
procedure WriteCOM;

implementation

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Samples.Spin,Unit2;

var
  Phndl: THandle;
  DCB: TDcb;
  OverWrite: POverlapped;

procedure WriteCOM;
var
  buffer: array[0..255] of Byte;
  bytesWritten: DWORD;

begin
  //ShowMessage('������ ����������');
  //bytesWritten := 0;
  buffer[0]:=$42;

  if Phndl = INVALID_HANDLE_VALUE then
  ShowMessage('������ ����������� �����')
  else
  ShowMessage('���������� ����� ������������');

  if(not WriteFile(Phndl, buffer, 1, bytesWritten, nil))
  and (GetLastError <> ERROR_IO_PENDING) then
    //ShowMessage(GetLastErrorMessage)
    ShowMessage('������ � ������� ��������')
  else
    ShowMessage('TRUE � ������� ��������');

  if bytesWritten > 0 then
      ShowMessage('������ ����������')
    else
      ShowMessage('������ ��������');
  //FCom31.Close;
end;

procedure InitCOM(PortName: string);
begin
  Phndl := CreateFile(PChar(PortName),
  GENERIC_READ or GENERIC_WRITE, 0, nil,
  OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);

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

end;

procedure ReadCOM;
var
  buffer: array[0..255] of Byte;
  bytesReaden: DWORD;
begin
  if not SetCommMask(Phndl, EV_RXCHAR) then
  ShowMessage('����� �� ��������');

  ReadFile(Phndl,buffer,SizeOf(buffer),bytesReaden,nil);

end;

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


end.
