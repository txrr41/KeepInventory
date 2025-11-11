unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  VclTee.TeeGDIPlus, Data.DB, VCLTee.Series, VCLTee.TeEngine, VCLTee.TeeProcs,
  VCLTee.Chart, VCLTee.DBChart;

type
  TFormRelatorios = class(TForm)
    Panel1: TPanel;
    Panel7: TPanel;
    Label15: TLabel;
    Panel2: TPanel;
    Shape1: TShape;
    Panel3: TPanel;
    Panel4: TPanel;
    Shape3: TShape;
    Shape2: TShape;
    DBChart1: TDBChart;
    DBChart2: TDBChart;
    Series1: THorizBarSeries;
    Series2: TFastLineSeries;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel8: TPanel;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Panel9: TPanel;
    Label2: TLabel;
    Shape4: TShape;
    procedure Panel8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRelatorios: TFormRelatorios;

implementation

{$R *.dfm}

procedure TFormRelatorios.Panel8Click(Sender: TObject);
begin

end;

end.
