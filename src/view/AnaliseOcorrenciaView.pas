unit AnaliseOcorrenciaView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.WinXCtrls, Vcl.Buttons, Vcl.NumberBox, Vcl.Mask,
  Vcl.CustomizeDlg;

type
  TForm5 = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    Panel4: TPanel;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Panel5: TPanel;
    Label5: TLabel;
    Panel6: TPanel;
    Label6: TLabel;
    EdtVAQPatri: TMaskEdit;
    Label3: TLabel;
    NumberBox1: TNumberBox;
    Label8: TLabel;
    MaskEdit1: TMaskEdit;
    Label9: TLabel;
    ComboBox2: TComboBox;
    Label10: TLabel;
    CheckBox1: TCheckBox;
    MaskEdit2: TMaskEdit;
    Label11: TLabel;
    Panel2: TPanel;
    SearchBox1: TSearchBox;
    Panel7: TPanel;
    DBGrid1: TDBGrid;
    Shape2: TShape;
    Shape1: TShape;
    Label7: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

end.
