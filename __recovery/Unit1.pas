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

procedure TFCom31.Button1Click(Sender: TObject);
var
  buffer: array[0..255] of Byte;
  bytesWritten: DWORD;
begin
  //ShowMessage('Данные отправлены');
  //bytesWritten := 0;
  buffer[0]:=$41;



  if(not WriteFile(FControls.Phndl, buffer, SizeOf(buffer), bytesWritten, nil))
  and (GetLastError <> ERROR_IO_PENDING) then
    ShowMessage('Ошибка в функции отправки')
  else
    ShowMessage('TRUE в функции отправки');

  if bytesWritten > 0 then
      ShowMessage('Данные отправлены')
    else
      ShowMessage('Ошибка отправки');


  FCom31.Close;
end;

procedure TFCom31.Button2Click(Sender: TObject);
begin
  FCom31.Close;
end;

end.
