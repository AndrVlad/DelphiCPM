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
    ComboBox1: TComboBox;
    ListBox2: TListBox;
    Label2: TLabel;
    Label3: TLabel;
    ListBox3: TListBox;
    ListBox4: TListBox;
    TFCom31: TForm;
    procedure ListBox1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure CreateShowForm(var inForm:TForm);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  winMain: TwinMain;

implementation

{$R *.dfm}
uses Unit1;

procedure TwinMain.ComboBox1Change(Sender: TObject);

  var LI:TStrings;
  item_ind:integer;
  s:string;
begin

  ListBox1.Visible:=False;
  ListBox2.Visible:=False;
  ListBox3.Visible:=False;
  ListBox4.Visible:=False;

  LI:=ComboBox1.Items;
  item_ind:=ComboBox1.ItemIndex;

  case item_ind of
  0: ListBox1.Visible:=True;
  1: ListBox2.Visible:=True;
  2: ListBox3.Visible:=True;
  3: ListBox4.Visible:=True;

  end;
end;

procedure TwinMain.ListBox1Click(Sender: TObject);
  var LI:TStrings;
  item_ind:integer;
  s:string;
begin
  LI:=ListBox1.Items;
  item_ind:=ListBox1.ItemIndex;

  case item_ind of
  0: ;
  end;

  LI:=ListBox1.Items;
  item_ind:=ListBox1.ItemIndex;
  s:=LI[item_ind];
  ShowMessage(s);

end;

procedure TwinMain.ListBox3Click(Sender: TObject);
var LI:TStrings;
  item_ind:integer;
  s:string;
begin
  LI:=ListBox3.Items;
  item_ind:=ListBox3.ItemIndex;

  case item_ind of
  0: CreateShowForm();
  end;

  LI:=ListBox3.Items;
  item_ind:=ListBox3.ItemIndex;
  s:=LI[item_ind];
  ShowMessage(s);
end;

procedure CreateShowForm(var inForm:TForm);
var i:integer;
begin

end;

end.
