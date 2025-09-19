unit HomeView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Skia;

type
  TFormHome = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
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
   Panel1.Color := clbtnface;
   Panel1.Width := 161;
   end else if Panel1.Width = 161 then begin
   Panel1.Color := clsilver;
   Panel1.Width := 49;
   end;





end;

end.
