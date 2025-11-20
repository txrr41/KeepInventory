unit DB;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Phys.PGDef,
  FireDAC.Phys.PG, frxSmartMemo, frxClass, frxDBSet, frCoreClasses;

type
  TDataModule2 = class(TDataModule)
    FDQuery1: TFDQuery;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    FDConnection: TFDConnection;
    frxReport1: TfrxReport;
    QueryDepreciacao: TFDQuery;
    frxDBDataset1: TfrxDBDataset;
    frxReport2: TfrxReport;
    qryRelatorio: TFDQuery;
    frxDBDataset2: TfrxDBDataset;
    frxDBDataset3: TfrxDBDataset;
    qryResumo: TFDQuery;
    qryResumoqtd_depreciado: TLargeintField;
    qryResumovalor_depreciado: TFMTBCDField;
    qryResumoqtd_urgente: TLargeintField;
    qryResumovalor_urgente: TFMTBCDField;
    qryResumoqtd_atencao: TLargeintField;
    qryResumovalor_atencao: TFMTBCDField;
    qryResumoqtd_planejamento: TLargeintField;
    qryResumovalor_planejamento: TFMTBCDField;
    qryResumototal_itens: TLargeintField;
    qryResumoinvestimento_total: TFMTBCDField;
    qryRelatorioid: TIntegerField;
    qryRelatorionome: TWideStringField;
    qryRelatoriomodelo: TWideStringField;
    qryRelatoriotipo: TWideStringField;
    qryRelatorionumero_serie: TWideStringField;
    qryRelatoriovalor_aquisicao: TBCDField;
    qryRelatoriovalor_atual: TBCDField;
    qryRelatoriodata_aquisicao: TDateField;
    qryRelatoriovida_util_meses: TIntegerField;
    qryRelatorioidade_meses: TIntegerField;
    qryRelatoriopercentual_depreciacao: TFMTBCDField;
    qryRelatoriomeses_restantes: TIntegerField;
    qryRelatoriostatus_codigo: TIntegerField;
    qryRelatoriostatus_texto: TWideMemoField;
    qryRelatoriodata_depreciacao_estimada: TSQLTimeStampField;
    FfrxDBDatasetMovimentacao: TfrxDBDataset;
    FQueryMovimentacao: TFDQuery;
    frxReport3: TfrxReport;
    FfrxDBDatasetEstatisticas: TfrxDBDataset;
    FQueryEstatisticas: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule2: TDataModule2;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
