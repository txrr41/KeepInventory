unit MovimentacoesView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.WinXCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Skia, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.Client, FireDAC.Stan.Param, PedidoMoviController, PendenciaController, MovimentacaoModel, PermissoesHelper, UsuarioModel, LogService;

type
  TFormMovi = class(TForm)
    Panel1: TPanel;
    Label7: TLabel;
    Panel2: TPanel;
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
    DbGridPendencias: TDBGrid;
    PanelPendencias: TPanel;
    Image1: TImage;
    Label8: TLabel;
    Panel9: TPanel;
    DBGridMovi: TDBGrid;
    Panel10: TPanel;
    Shape5: TShape;
    Label5: TLabel;
    BtnAceitarPendencia: TSpeedButton;
    Panel11: TPanel;
    Shape6: TShape;
    Label6: TLabel;
    BtnRecusarPendencia: TSpeedButton;
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

  // Verifica se tem permiss�o de movimenta��es E de excluir
  if not (Usuario.PermMovimentacoes and Usuario.PermMovExcluir) then
  begin
    ShowMessage('Voc� n�o tem permiss�o para excluir movimenta��es!');
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
