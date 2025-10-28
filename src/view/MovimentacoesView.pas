unit MovimentacoesView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.WinXCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Skia, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.Client, FireDAC.Stan.Param, PedidoMoviController, PendenciaController, MovimentacaoModel;

type
  TFormMovi = class(TForm)
    Panel1: TPanel;
    Label7: TLabel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    PanelPendencias: TPanel;
    Image1: TImage;
    Label8: TLabel;
    Panel9: TPanel;
    DBGridMovi: TDBGrid;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel6: TPanel;
    Shape1: TShape;
    Label2: TLabel;
    BtnExcluirMovi: TSpeedButton;
    Panel7: TPanel;
    Shape2: TShape;
    BtnPesquisarMovi: TSpeedButton;
    Label3: TLabel;
    Panel8: TPanel;
    Shape4: TShape;
    BtnPendencias: TSpeedButton;
    Label4: TLabel;
    Panel5: TPanel;
    Shape3: TShape;
    Label1: TLabel;
    BtnAddMovi: TSpeedButton;
    SearchBox1: TSearchBox;
    DataSource1: TDataSource;
    Panel10: TPanel;
    Panel11: TPanel;
    Shape5: TShape;
    Shape6: TShape;
    Label5: TLabel;
    Label6: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure BtnPendenciasClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure AtualizarGrid;
    procedure SpeedButton1Click(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMovi: TFormMovi;

implementation

{$R *.dfm}


procedure TFormMovi.AtualizarGrid;
begin
 DataSource1.DataSet := FPedidoMoviController.ListarMovimentacoes;
    DbGridMovi.DataSource := DataSource1;
end;

procedure TFormMovi.BtnPendenciasClick(Sender: TObject);
begin
PanelPendencias.Visible := True;
AtualizarGrid;
end;


procedure TFormMovi.Image1Click(Sender: TObject);
begin
PanelPendencias.Visible := False;
end;

procedure TFormMovi.SpeedButton1Click(Sender: TObject);
var
Ids: Integer;
begin
Ids := DataSource1.DataSet.FieldByName('id').AsInteger;
  FPendenciaController.AlterarStatus(Ids);
end;

end.
