unit HomeView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Skia, Vcl.StdCtrls,
  Vcl.ComCtrls, CadastrosView, EmpresaController, Data.DB, PedidoMoviView, MovimentacoesView, RegistroOcorrenciaView, AnaliseOcorrenciaView,
  Vcl.Imaging.pngimage;

type
  TFormHome = class(TForm)
    Panel1: TPanel;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image6: TImage;
    Image1: TImage;
    Image7: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Image8: TImage;
    Label7: TLabel;
    Label8: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    Image5: TImage;
    Label9: TLabel;
    procedure Image1Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);

    procedure Image6Click(Sender: TObject);
    procedure Image10Click(Sender: TObject);
    procedure Image11Click(Sender: TObject);

  private
   ActiveForm: TForm;
  public
    { Public declarations }
  end;

var
  FormHome: TFormHome;

implementation

{$R *.dfm}




procedure TFormHome.Image10Click(Sender: TObject);
var Ocorr: TFormRegistrarOcorrencia;
begin
  Ocorr := TFormRegistrarOcorrencia.Create(Self.Panel3);
  Ocorr.Parent := Self.Panel3;
  Ocorr.Align := AlClient;
  Ocorr.BorderStyle := bsNone;
  Ocorr.Show;

end;

procedure TFormHome.Image11Click(Sender: TObject);
var Analise: TFormAnaliseOcorrencia;
begin
  Analise := TFormAnaliseOcorrencia.Create(Self.Panel3);
  Analise.Parent := Self.Panel3;
  Analise.Align := AlClient;
  Analise.BorderStyle := bsNone;
  Analise.Show;

end;

procedure TFormHome.Image1Click(Sender: TObject);
begin


   if Panel1.Width = 49 then begin

   Panel1.Width := 200;
   end else if Panel1.Width = 200 then begin

   Panel1.Width := 49;
   end;

end;


procedure TFormHome.Image3Click(Sender: TObject);
var Cad: TFormCadastro;
    Controller: TEmpresaController;
    DataS: TDataSource;
begin
  Cad := TFormCadastro.Create(Self.Panel3,'');
  Cad.Parent := Self.Panel3;
  Cad.Align := alClient;
  Cad.BorderStyle := bsNone;
  Cad.Show;
  Controller := TEmpresaController.Create;
  Cad.DataSEmpresa.DataSet := Controller.ListarEmpresa;
  Cad.DbGrid1.DataSource := Cad.DataSEmpresa;
end;

procedure TFormHome.Image5Click(Sender: TObject);
var Movi: TFormPedidoMovi;
begin
  Movi := TFormPedidoMovi.Create(Self.Panel3);
  Movi.Parent := Self.Panel3;
  Movi.Align := AlClient;
  Movi.BorderStyle := bsNone;
  Movi.Show;

end;

procedure TFormHome.Image6Click(Sender: TObject);
var Movi: TFormMovi;
begin
  Movi := TFormMovi.Create(Self.Panel3);
  Movi.Parent := Self.Panel3;
  Movi.Align := AlClient;
  Movi.BorderStyle := bsNone;
  Movi.Show;

end;

procedure TFormHome.Image8Click(Sender: TObject);
begin
Halt;
end;

end.


