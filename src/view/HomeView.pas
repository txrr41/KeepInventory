unit HomeView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Skia, Vcl.StdCtrls,
  Vcl.ComCtrls, CadastrosView, ListarEmpresasController, Data.DB;

type
  TFormHome = class(TForm)
    Panel1: TPanel;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image6: TImage;
    Image5: TImage;
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
    procedure Image1Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image8Click(Sender: TObject);

  private
   ActiveForm: TForm;
  public
    { Public declarations }
  end;

var
  FormHome: TFormHome;

implementation

{$R *.dfm}




procedure TFormHome.Image1Click(Sender: TObject);
begin


   if Panel1.Width = 49 then begin

   Panel1.Width := 177;
   end else if Panel1.Width = 177 then begin

   Panel1.Width := 49;
   end;

end;


procedure TFormHome.Image3Click(Sender: TObject);
var
Cad: TFormCadastro;
Controller: TListEmpController;
DataS: TDataSource;
begin
Cad := TFormCadastro.Create(Self.Panel3);
Cad.Parent := Self.Panel3;
Cad.Align := alClient;
Cad.BorderStyle := bsNone;
Cad.Show

end;

procedure TFormHome.Image8Click(Sender: TObject);
begin
Halt;
end;

end.
