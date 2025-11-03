unit AnaliseOcorrenciaView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.WinXCtrls, Vcl.Buttons, Vcl.NumberBox, Vcl.Mask,
  Vcl.CustomizeDlg;

type
  TFormAnaliseOcorrencia = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    Panel4: TPanel;
    Label1: TLabel;
    CbGravidadeA: TComboBox;
    Panel5: TPanel;
    Label5: TLabel;
    Panel6: TPanel;
    Label6: TLabel;
    EdtVAQPatri: TMaskEdit;
    Label3: TLabel;
    EdtDepreciacao: TNumberBox;
    Label8: TLabel;
    EdtNovoValorA: TMaskEdit;
    Label9: TLabel;
    CbResponsabilidadeA: TComboBox;
    Label10: TLabel;
    CheckBoxManutencao: TCheckBox;
    EdCustoReparo: TMaskEdit;
    Label11: TLabel;
    Panel2: TPanel;
    SearchBox1: TSearchBox;
    Panel7: TPanel;
    DBGridAnalise: TDBGrid;
    Shape2: TShape;
    Shape1: TShape;
    Label7: TLabel;
    EdtValorAtualA: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAnaliseOcorrencia: TFormAnaliseOcorrencia;

implementation

{$R *.dfm}

end.
