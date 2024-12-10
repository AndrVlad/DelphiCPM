program Project1;
uses
  Vcl.Forms,
  pr1 in 'pr1.pas' {winMain},
  devStat in 'devStat.pas' {deviceStatus},
  commandTest in 'commandTest.pas' {testComm},
  Unit1 in 'Unit1.pas' {FCom31},
  Unit2 in 'Unit2.pas' {FControls},
  TransmitReceiveCOM in 'TransmitReceiveCOM.pas',
  TurnOnFilter in 'TurnOnFilter.pas' {Form3},
  WriteSample in 'WriteSample.pas' {Form4},
  ModbusTransmitReceive in 'ModbusTransmitReceive.pas',
  LowThreshold in 'LowThreshold.pas' {LowThresholdW},
  SetTexp in 'SetTexp.pas' {WriteTexp},
  TurnOnVVI in 'TurnOnVVI.pas' {Form5},
  SetPorog in 'SetPorog.pas' {PorogSet},
  SetOkno in 'SetOkno.pas' {OknoSet},
  TurnOffFilter in 'TurnOffFilter.pas' {Form6},
  WriteAngleLSB in 'WriteAngleLSB.pas' {Form7},
  WriteAngleMSB in 'WriteAngleMSB.pas' {Form8},
  WriteSpeed in 'WriteSpeed.pas' {Form9},
  WriteCrystallNum in 'WriteCrystallNum.pas' {Form10},
  Calculator in 'Calculator.pas' {Form11},
  AngleTThread in 'AngleTThread.pas';

{$R *.res}
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TwinMain, winMain);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TLowThresholdW, LowThresholdW);
  Application.CreateForm(TWriteTexp, WriteTexp);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TPorogSet, PorogSet);
  Application.CreateForm(TOknoSet, OknoSet);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TForm9, Form9);
  Application.CreateForm(TForm10, Form10);
  Application.CreateForm(TForm11, Form11);
  Application.Run;
end.
