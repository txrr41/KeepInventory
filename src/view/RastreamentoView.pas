unit RastreamentoView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.OleCtrls, SHDocVw, Vcl.ExtCtrls,
  FireDAC.Comp.Client, System.Generics.Collections, RastreioModel,
  RastreioController, MSHTML, System.Win.Registry, DB, Vcl.Buttons,
  Vcl.Imaging.pngimage;

type
  TFormRastreamento = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    WebBrowser1: TWebBrowser;
    Panel10: TPanel;
    Label5: TLabel;
    Panel11: TPanel;
    Label4: TLabel;
    Panel12: TPanel;
    Label3: TLabel;
    ComboBoxPatrimonios: TComboBox;
    BtnLocalizar: TSpeedButton;
    Shape5: TShape;
    Panel9: TPanel;
    Panel7: TPanel;
    Label15: TLabel;
    Image1: TImage;
    Labelinfo: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    FController: TRastreioController;
    FRastreios: TObjectList<TRastreioModel>;
    procedure CarregarMapa;
    procedure CarregarComboPatrimonios;
    procedure AtualizarPosicaoMapa(const Latitude, Longitude: Double;
      const Descricao: string);
      procedure ConfigurarModoNavegador;

  public
    property Controller: TRastreioController read FController write FController;
  end;

var
  FormRastreamento: TFormRastreamento;

implementation

{$R *.dfm}

procedure TFormRastreamento.FormCreate(Sender: TObject);
begin
   FRastreios := TObjectList<TRastreioModel>.Create;

  // ✅ CRIA O CONTROLLER (PRECISA PASSAR A CONEXÃO!)
  // Substitua DataModule1.FDConnection pelo seu DataModule
  FController := TRastreioController.Create(DataModule2.FDConnection);

  ConfigurarModoNavegador;

  WebBrowser1.Navigate('about:blank');
  Application.ProcessMessages;
  Sleep(200);

  CarregarMapa;
  CarregarComboPatrimonios;
end;

procedure TFormRastreamento.FormDestroy(Sender: TObject);
begin
  FRastreios.Free;
end;

procedure TFormRastreamento.SpeedButton1Click(Sender: TObject);
var
  PatrimonioId: Integer;
  Latitude, Longitude: Double;
  Descricao: string;
begin
  if ComboBoxPatrimonios.ItemIndex = -1 then
  begin
    ShowMessage('Selecione um patrimônio!');
    Exit;
  end;

  PatrimonioId := NativeInt(ComboBoxPatrimonios.Items.Objects[ComboBoxPatrimonios.ItemIndex]);

  if FController.LocalizarPatrimonio(PatrimonioId, Latitude, Longitude, Descricao) then
  begin
    AtualizarPosicaoMapa(Latitude, Longitude, Descricao);
    LabelInfo.Caption := 'Localização atualizada: ' + Descricao;
    LabelInfo.Font.Color := clGreen;
  end
  else
  begin
    ShowMessage(Descricao);
    LabelInfo.Caption := Descricao;
    LabelInfo.Font.Color := clRed;
  end;
end;

procedure TFormRastreamento.CarregarMapa;
var
  HTML: string;
  Doc: Variant;
begin
  HTML :=
    '<!DOCTYPE html>' +
    '<html>' +
    '<head>' +
    '  <meta http-equiv="X-UA-Compatible" content="IE=edge">' +
    '  <meta charset="utf-8">' +
    '  <style>' +
    '    body, html { margin: 0; padding: 0; height: 100%; }' +
    '    #map { height: 100%; width: 100%; }' +
    '  </style>' +
    '  <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"/>' +
    '  <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>' +
    '</head>' +
    '<body>' +
    '  <div id="map"></div>' +
    '  <script>' +
    // ✅ DECLARA AS VARIÁVEIS GLOBALMENTE (FORA DO SETTIMEOUT)
    '    var map;' +
    '    var marker;' +
    '    setTimeout(function() {' +
    '      map = L.map("map").setView([-25.4284, -49.2733], 13);' +
    '      L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {' +
    '        attribution: "&copy; OpenStreetMap contributors"' +
    '      }).addTo(map);' +
    '      marker = L.marker([-25.4284, -49.2733]).addTo(map);' +
    '      marker.bindPopup("Curitiba - PR").openPopup();' +
    '    }, 1000);' +
    // ✅ FUNÇÃO GLOBAL
    '    function atualizarMarcador(lat, lng, titulo) {' +
    '      if (!map) {' +
    '        alert("Mapa ainda não carregou!");' +
    '        return;' +
    '      }' +
    '      if (marker) {' +
    '        marker.setLatLng([lat, lng]);' +
    '      } else {' +
    '        marker = L.marker([lat, lng]).addTo(map);' +
    '      }' +
    '      marker.bindPopup(titulo).openPopup();' +
    '      map.setView([lat, lng], 15);' +
    '    }' +
    '  </script>' +
    '</body>' +
    '</html>';

  try
    WebBrowser1.Navigate('about:blank');
    Application.ProcessMessages;
    Sleep(200);

    Doc := WebBrowser1.Document;
    Doc.Write(HTML);
    Doc.Close;

    LabelInfo.Caption := 'Mapa carregado com sucesso!';
    LabelInfo.Font.Color := clGreen;
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao carregar mapa: ' + E.Message);
      LabelInfo.Caption := 'Erro ao carregar mapa';
      LabelInfo.Font.Color := clRed;
    end;
  end;
end;

procedure TFormRastreamento.ConfigurarModoNavegador;
var
  Reg: TRegistry;
  NomeExe: string;
begin
  NomeExe := ExtractFileName(ParamStr(0));
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;

    // Força IE11 em modo Edge (mais moderno)
    if Reg.OpenKey('\Software\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_BROWSER_EMULATION', True) then
    begin
      Reg.WriteInteger(NomeExe, 11001); // IE11 Edge mode
      Reg.CloseKey;
    end;

    // Habilita JavaScript
    if Reg.OpenKey('\Software\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_AJAX_CONNECTIONEVENTS', True) then
    begin
      Reg.WriteInteger(NomeExe, 1);
      Reg.CloseKey;
    end;
  finally
    Reg.Free;
  end;
end;

procedure TFormRastreamento.CarregarComboPatrimonios;
var
  Rastreio: TRastreioModel;
  ItemTexto: string;
begin
  ComboBoxPatrimonios.Clear;
  FRastreios.Clear;

  if FController = nil then
  begin
    LabelInfo.Caption := 'Erro: Controller não inicializado';
    Exit;
  end;

  FRastreios := FController.CarregarPatrimonios;

  for Rastreio in FRastreios do
  begin
    // ✅ MOSTRA SE TEM LOCALIZAÇÃO OU NÃO
    if (Rastreio.Latitude <> 0) and (Rastreio.Longitude <> 0) then
      ItemTexto := Format('%s - %s [COM LOCALIZAÇÃO]',
        [Rastreio.Nome, Rastreio.Tipo])
    else
      ItemTexto := Format('%s - %s [SEM LOCALIZAÇÃO]',
        [Rastreio.Nome, Rastreio.Tipo]);

    ComboBoxPatrimonios.Items.AddObject(ItemTexto, TObject(Rastreio.Id));
  end;

  if ComboBoxPatrimonios.Items.Count > 0 then
  begin
    ComboBoxPatrimonios.ItemIndex := 0;
    LabelInfo.Caption := Format('%d patrimônios carregados',
      [ComboBoxPatrimonios.Items.Count]);
  end
  else
  begin
    LabelInfo.Caption := 'Nenhum patrimônio cadastrado';
  end;
end;

procedure TFormRastreamento.AtualizarPosicaoMapa(const Latitude, Longitude: Double;
  const Descricao: string);
var
  Script: string;
  Doc: IHTMLDocument2;
begin
  Script := Format('atualizarMarcador(%f, %f, "%s");',
    [Latitude, Longitude, Descricao],
    TFormatSettings.Create('en-US'));

  Doc := WebBrowser1.Document as IHTMLDocument2;
  if Assigned(Doc) and Assigned(Doc.parentWindow) then
  begin
    try
      Doc.parentWindow.execScript(Script, 'JavaScript');
    except
      on E: Exception do
        ShowMessage('Erro ao atualizar mapa: ' + E.Message);
    end;
  end;
end;

end.
