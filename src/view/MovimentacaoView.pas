unit MovimentacaoView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.WinXCtrls, Vcl.WinXCalendars,
  Vcl.Buttons;

type
  TForm4 = class(TForm)
    PanelMoviment: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    SearchBox1: TSearchBox;
    Panel6: TPanel;
    Label4: TLabel;
    Panel7: TPanel;
    Label5: TLabel;
    CalendarPicker1: TCalendarPicker;
    CalendarPicker2: TCalendarPicker;
    Shape1: TShape;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel8: TPanel;
    DBGrid1: TDBGrid;
    SpeedButton1: TSpeedButton;
    Shape2: TShape;
    SpeedButton2: TSpeedButton;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape3: TShape;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

end.
