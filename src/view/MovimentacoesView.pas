unit MovimentacoesView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.CheckLst, PedidoMoviView,
  Vcl.Skia;

type
  TForm4 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    Panel4: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Shape1: TShape;
    Shape2: TShape;
    Shape4: TShape;
    BtnPesquisarMovi: TSpeedButton;
    BtnPendencias: TSpeedButton;
    Label2: TLabel;
    SearchBox1: TSearchBox;
    BtnExcluirMovi: TSpeedButton;
    Panel5: TPanel;
    Label1: TLabel;
    Shape3: TShape;
    Label3: TLabel;
    Label4: TLabel;
    BtnAddMovi: TSpeedButton;
    PanelPendencias: TPanel;
    Panel10: TPanel;
    Shape5: TShape;
    SpeedButton1: TSpeedButton;
    Label5: TLabel;
    Panel11: TPanel;
    Shape6: TShape;
    SpeedButton5: TSpeedButton;
    Label6: TLabel;
    Panel9: TPanel;
    CheckListBox1: TCheckListBox;
    Image1: TImage;
    Label7: TLabel;
    Label8: TLabel;
    procedure BtnPendenciasClick(Sender: TObject);
    procedure BtnAddMoviClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.BtnAddMoviClick(Sender: TObject);
begin
    FormPedidoMovi.ShowModal;
end;

procedure TForm4.BtnPendenciasClick(Sender: TObject);
begin
  PanelPendencias.Visible := True;
end;

end.
