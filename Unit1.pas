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

implementation

{$R *.dfm}

procedure TFCom31.Button1Click(Sender: TObject);
begin
  ShowMessage('������� ����������');
  FCom31.Close;
end;

procedure TFCom31.Button2Click(Sender: TObject);
begin
  FCom31.Close;
end;

end.
