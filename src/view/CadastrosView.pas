unit CadastrosView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.WinXCtrls, Vcl.Mask;

type
  TFormCadastro = class(TForm)
    PanelCadastro: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Label1: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel4: TPanel;
    Panel5: TPanel;
    Shape1: TShape;
    Panel6: TPanel;
    Panel7: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    SearchBox1: TSearchBox;
    Panel10: TPanel;
    SpeedButton1: TSpeedButton;
    Panel9: TPanel;
    Label6: TLabel;
    Shape5: TShape;
    SpeedButton5: TSpeedButton;
    Panel8: TPanel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Shape4: TShape;
    SpeedButton4: TSpeedButton;
    Label13: TLabel;
    Shape2: TShape;
    SpeedButton2: TSpeedButton;
    Shape3: TShape;
    SpeedButton3: TSpeedButton;
    Label12: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    Label14: TLabel;
    Shape6: TShape;
    Shape7: TShape;
    Shape9: TShape;
    Panel3: TPanel;
    Edit1: TEdit;
    Edit3: TEdit;
    Edit5: TEdit;
    MaskEdit1: TMaskEdit;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    MaskEdit2: TMaskEdit;
    Label18: TLabel;
    Label19: TLabel;
    MaskEdit3: TMaskEdit;
    Label20: TLabel;
    Edit2: TEdit;
    Label21: TLabel;
    Edit4: TEdit;
    Label22: TLabel;
    Edit6: TEdit;
    Label23: TLabel;
    Edit7: TEdit;
    Label24: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastro: TFormCadastro;

implementation

{$R *.dfm}

procedure TFormCadastro.SpeedButton1Click(Sender: TObject);
begin
if Panel3.Visible = False then begin
  Panel3.Visible := True;
end else  begin
  Panel3.Visible := False;
end;


end;

end.
