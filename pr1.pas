unit pr1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Menus,
  Vcl.DBCtrls;

type
  TwinMain = class(TForm)
    MainMenu: TMainMenu;
    StatusBar1: TStatusBar;
    config: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    ListBox1: TListBox;
    procedure ListBox1Click(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  winMain: TwinMain;

implementation

{$R *.dfm}





procedure TwinMain.ListBox1Click(Sender: TObject);
  var LI:TStrings;
  i:integer;
  s:string;
begin
  LI:=ListBox1.Items;
  i:=ListBox1.ItemIndex;
  s:=LI[i];
  ShowMessage(s);
end;

end.
