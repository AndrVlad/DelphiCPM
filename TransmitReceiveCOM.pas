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
  Rbuffer: array[0..255] of Byte;
  //OverWrite: POverlapped;

function BytesToString(const Bytes: array of Byte): string;
var
  I: Integer;
begin
  Result := '';
  for I := Low(Bytes) to High(Bytes) do
    Result := Result + Chr(Bytes[I]);
end;

procedure WriteCOM;
type
  buffer = array of Byte;
var
  bytesWritten: DWORD;
  Wbuffer: array[0..4] of Byte;
begin

  Wbuffer[0] := Ord(Chr(5));
  Wbuffer[1] := Ord('9');
  Wbuffer[2] := Ord('4');
  Wbuffer[3] := Ord('1');
  Wbuffer[4] := Ord('E');

  if Phndl = INVALID_HANDLE_VALUE then
  ShowMessage('������ ����������� �����');

  if(not WriteFile(Phndl, Wbuffer, SizeOf(Wbuffer), bytesWritten, nil))
  and (GetLastError <> ERROR_IO_PENDING) then
    //ShowMessage(GetLastErrorMessage)
    ShowMessage('������ � ������� ��������');
  {else
    ShowMessage('TRUE � ������� ��������');}

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

  if Phndl = INVALID_HANDLE_VALUE then
    ShowMessage('���� �� ������� �������');

  GetCommState(Phndl, DCB);

  DCB.BaudRate := 9600;
  DCB.Parity := NOPARITY;
  DCB.ByteSize := 8;
  DCB.StopBits := ONESTOPBIT;

  if (SetCommState(Phndl, DCB)) then
    ShowMessage('��������� ������');

  PurgeComm(Phndl, PURGE_TXCLEAR or PURGE_RXCLEAR);

end;

procedure ReadCOM;
var
  Rbuffer: array[0..255] of Byte;
  testBuffer: array[0..255] of Byte;
  bytesReaden: DWORD;
  Data: string;
begin
  FIllChar(Rbuffer,SizeOf(Rbuffer),0);
  if not SetCommMask(Phndl, EV_RXCHAR) then
  ShowMessage('����� �� ��������');

  if (not ReadFile(Phndl,Rbuffer,SizeOf(Rbuffer),bytesReaden,nil)) then
    ShowMessage('������ � ������� ������');

  if bytesReaden = 0 then
  ShowMessage('������ �� �������');

  Data := BytesToString(RBuffer);
  //testBuffer[0] := 05;
  //Data := BytesToString(testBuffer);
  ShowMessage(Data);

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
