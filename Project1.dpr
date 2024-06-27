program Project1;

uses
  Vcl.Forms,
  pr1 in 'pr1.pas' {winMain},
  devStat in 'devStat.pas' {deviceStatus},
  commandTest in 'commandTest.pas' {testComm},
  Unit1 in 'Unit1.pas' {FCom31},
  Unit2 in 'Unit2.pas' {FControls},
  TransmitReceiveCOM in 'TransmitReceiveCOM.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TwinMain, winMain);
  Application.Run;
end.
