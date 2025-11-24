unit MovimentacoesView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.WinXCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Skia, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.Client, FireDAC.Stan.Param, PedidoMoviController, PendenciaController, MovimentacaoModel, PermissoesHelper, UsuarioModel, LogService,
  Vcl.Imaging.pngimage;

type
  TFormMovi = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    SearchBox1: TSearchBox;
    DataSource1: TDataSource;
    DbGridPendencias: TDBGrid;
    PanelPendencias: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Label5: TLabel;
    Panel11: TPanel;
    Label6: TLabel;
    Shape6: TShape;
    Shape5: TShape;
    DBGridMovi: TDBGrid;
    Panel12: TPanel;
    Label8: TLabel;
    Image1: TImage;
    Image2: TImage;
    Panel3: TPanel;
    BtnPendencias: TSpeedButton;
    Shape11: TShape;
    BtnAceitarPendencia: TSpeedButton;
    BtnRecusarPendencia: TSpeedButton;
    Label1: TLabel;
    Image4: TImage;
    Panel7: TPanel;
    Label3: TLabel;
    Label12: TLabel;
    Image3: TImage;
    procedure FormCreate(Sender: TObject);
    procedure BtnPendenciasClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure AtualizarGridPendencias;
    procedure BtnAceitarPendenciaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnRecusarPendenciaClick(Sender: TObject);
    procedure AtualizarGrid;
    procedure BtnExcluirMoviClick(Sender: TObject);

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
    DataSource1.DataSet := FPendenciaController.ListarMovimentacoes;
    DbGridPendencias.DataSource := DataSource1;
end;

procedure TFormMovi.AtualizarGridPendencias;
begin
 DataSource1.DataSet := FPedidoMoviController.ListarMovimentacoes;
 DbGridMovi.DataSource := DataSource1;
end;

procedure TFormMovi.BtnPendenciasClick(Sender: TObject);
begin
PanelPendencias.Visible := True;
AtualizarGridPendencias;
end;


procedure TFormMovi.FormCreate(Sender: TObject);
begin
AtualizarGrid;
end;

procedure TFormMovi.FormShow(Sender: TObject);
begin
    TLogService.Instance.LogAcesso('Movimentações');
    AtualizarGrid;
    TPermissoesHelper.AplicarPermissoesMovimentacoes(Self);
end;

procedure TFormMovi.Image1Click(Sender: TObject);
begin
PanelPendencias.Visible := False;
AtualizarGrid;
end;

procedure TFormMovi.BtnAceitarPendenciaClick(Sender: TObject);
var
  Ids: Integer;
begin

Ids := DataSource1.DataSet.FieldByName('id').AsInteger;
  FPendenciaController.AlterarStatus(Ids);
  AtualizarGridPendencias;
end;

procedure TFormMovi.BtnExcluirMoviClick(Sender: TObject);
var
  Usuario: TUsuarioModel;
begin
  Usuario := TPermissoesHelper.GetUsuarioLogado;

  if not (Usuario.PermMovimentacoes and Usuario.PermMovExcluir) then
  begin
    ShowMessage('Você não tem permissão para excluir movimentações!');
    Exit;
  end;

end;

procedure TFormMovi.BtnRecusarPendenciaClick(Sender: TObject);
var
Ids: Integer;
begin
  Ids := DataSource1.DataSet.FieldByName('id').AsInteger;
  FPendenciaController.AlterarStatusRecusado(Ids);
  AtualizarGridPendencias;
end;

end.
