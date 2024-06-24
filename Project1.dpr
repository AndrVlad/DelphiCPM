program Project1;

uses
  Vcl.Forms,
  pr1 in 'pr1.pas' {winMain},
  devStat in 'devStat.pas' {deviceStatus},
  commandTest in 'commandTest.pas' {testComm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TwinMain, winMain);
  Application.Run;
end.
