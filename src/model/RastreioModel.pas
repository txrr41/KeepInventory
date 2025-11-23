unit RastreioModel;

interface

type
  TRastreioModel = class
  private
    FId: Integer;
    FNome: string;
    FTipo: string;
    FSituacao: string;
    FModelo: string;
    FCodigoRastreio: string;
    FLatitude: Double;
    FLongitude: Double;
    FPredio: string;
    FSala: string;
  public
    property Id: Integer read FId write FId;
    property Nome: string read FNome write FNome;
    property Tipo: string read FTipo write FTipo;
    property Situacao: string read FSituacao write FSituacao;
    property Modelo: string read FModelo write FModelo;
    property CodigoRastreio: string read FCodigoRastreio write FCodigoRastreio;
    property Latitude: Double read FLatitude write FLatitude;
    property Longitude: Double read FLongitude write FLongitude;
    property Predio: string read FPredio write FPredio;
    property Sala: string read FSala write FSala;
  end;

implementation

end.
