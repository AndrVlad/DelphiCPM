unit ModbusTransmitReceive;

interface

procedure WriteEthernet(msg: string; commandType: Byte);
procedure SendMsgEthernet(var msg: array of Word);
procedure InitPLC(addr: string; startRegNum: Word);
procedure SetRegNum(num: Word);

implementation

uses
  IdModbusClient,
  Vcl.Dialogs, pr1;

var
  PLC: TIdModBusClient;
  RegNum: Word;

procedure WriteEthernet(msg: string; commandType: Byte);
var
  RegisterData: array[0..2] of Word;
  FirstByte: Byte;
begin

    case commandType of
    0: FirstByte := 5;
    1: FirstByte := 7;
  end;

  RegisterData[2] := 0;

  RegisterData[0] := Ord(msg[1]) Shl 8;
  RegisterData[0] := RegisterData[0] + Ord(Chr(FirstByte));
  RegisterData[1] := Ord(msg[3]) Shl 8;
  RegisterData[1] := RegisterData[1] + Ord(msg[2]);
  RegisterData[2] := RegisterData[2] + Ord(msg[4]);

  if PLC.WriteRegisters(RegNum, RegisterData) then
    MessageDlg('Успешная запись в регистры!', mtCustom, [mbOk], 0)
  else
    MessageDlg('Ошибка при записи в регистры', mtError, [mbOk], 0);

end;

procedure SendMsgEthernet(var msg: array of Word);
begin
if PLC.WriteRegisters(513, msg) then
    MessageDlg('Успешная запись в регистры!', mtCustom, [mbOk], 0)
  else
    MessageDlg('Ошибка при записи в регистры', mtError, [mbOk], 0);
end;

procedure InitPLC(addr: string; startRegNum: Word);
begin
  PLC := TIdModBusClient.Create;
  PLC.Host := addr;
  SetRegNum(startRegNum);
end;

procedure SetRegNum(num: Word);
begin
  RegNum := num;
end;

end.
