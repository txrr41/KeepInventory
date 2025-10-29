unit PatrimonioImportacaoCSV;

interface

uses
  System.SysUtils, System.Classes, System.Generics.Collections,
  PatrimonioDTO;

type
  TPatrimonioImportacaoCSV = class
  private
    FErros: TStringList;
    function ParseCSVLine(const Line: string): TArray<string>;
    function ValidarItem(const Item: TPatrimonioDTO; Linha: Integer): Boolean;
  public
    constructor Create;
    destructor Destroy; override;
    function LerCSV(const ArquivoCSV: string; var Itens: TArray<TPatrimonioDTO>): Boolean;
    class procedure GerarModeloCSV(const CaminhoArquivo: string);
    property Erros: TStringList read FErros;
  end;

implementation

uses
  System.StrUtils;

{ TPatrimonioImportacaoCSV }

constructor TPatrimonioImportacaoCSV.Create;
begin
  inherited Create;
  FErros := TStringList.Create;
end;

destructor TPatrimonioImportacaoCSV.Destroy;
begin
  FErros.Free;
  inherited;
end;

function TPatrimonioImportacaoCSV.ParseCSVLine(const Line: string): TArray<string>;
var
  Items: TStringList;
  i: Integer;
  InQuotes: Boolean;
  CurrentField: string;
  C: Char;
begin
  Items := TStringList.Create;
  try
    InQuotes := False;
    CurrentField := '';

    for i := 1 to Length(Line) do
    begin
      C := Line[i];

      if C = '"' then
        InQuotes := not InQuotes
      else if (C = ',') and (not InQuotes) then
      begin
        Items.Add(Trim(CurrentField));
        CurrentField := '';
      end
      else
        CurrentField := CurrentField + C;
    end;

    // Adiciona o último campo
    Items.Add(Trim(CurrentField));

    Result := Items.ToStringArray;
  finally
    Items.Free;
  end;
end;

function TPatrimonioImportacaoCSV.ValidarItem(const Item: TPatrimonioDTO; Linha: Integer): Boolean;
begin
  Result := True;

  if Trim(Item.FNome) = '' then
  begin
    FErros.Add(Format('Linha %d: Nome não pode estar vazio', [Linha]));
    Result := False;
  end;

  if Trim(Item.FNumeroSerie) = '' then
  begin
    FErros.Add(Format('Linha %d: Número de série não pode estar vazio', [Linha]));
    Result := False;
  end;

  if Item.FValorAquisicao <= 0 then
  begin
    FErros.Add(Format('Linha %d: Valor de aquisição deve ser maior que zero', [Linha]));
    Result := False;
  end;

  if Item.FIdSala <= 0 then
  begin
    FErros.Add(Format('Linha %d: ID da sala inválido', [Linha]));
    Result := False;
  end;
end;

function TPatrimonioImportacaoCSV.LerCSV(const ArquivoCSV: string;
  var Itens: TArray<TPatrimonioDTO>): Boolean;
var
  CSVFile: TStringList;
  i: Integer;
  Campos: TArray<string>;
  Item: TPatrimonioDTO;
  LinhaAtual: Integer;
  LinhaCSV: string;
  ListaItens: TList<TPatrimonioDTO>;
begin
  Result := False;
  FErros.Clear;
  ListaItens := TList<TPatrimonioDTO>.Create;

  if not FileExists(ArquivoCSV) then
  begin
    FErros.Add('Arquivo CSV não encontrado: ' + ArquivoCSV);
    ListaItens.Free;
    Exit;
  end;

  CSVFile := TStringList.Create;
  try
    CSVFile.LoadFromFile(ArquivoCSV, TEncoding.UTF8);

    if CSVFile.Count < 2 then
    begin
      FErros.Add('Arquivo CSV vazio ou sem dados');
      Exit;
    end;

    // Pula o cabeçalho (linha 0)
    for i := 1 to CSVFile.Count - 1 do
    begin
      LinhaCSV := Trim(CSVFile[i]);

      // Ignora linhas vazias e comentários
      if (LinhaCSV = '') or (Copy(LinhaCSV, 1, 1) = '#') then
        Continue;

      LinhaAtual := i + 1;

      try
        Campos := ParseCSVLine(LinhaCSV);

        if Length(Campos) < 9 then
        begin
          FErros.Add(Format('Linha %d: Número incorreto de campos (esperado 9, encontrado %d)',
            [LinhaAtual, Length(Campos)]));
          Continue;
        end;

        // Preenche o DTO
        Item.FNome := Campos[0];
        Item.FTipo := Campos[1];
        Item.FSituacao := Campos[2];
        Item.FModelo := Campos[3];

        try
          // Remove pontos de milhares e substitui vírgula por ponto
          Item.FValorAquisicao := StrToCurrDef(
            StringReplace(StringReplace(Campos[4], '.', '', [rfReplaceAll]), ',', '.', []), 0);
          Item.FValorAtual := StrToCurrDef(
            StringReplace(StringReplace(Campos[5], '.', '', [rfReplaceAll]), ',', '.', []), 0);
        except
          FErros.Add(Format('Linha %d: Erro ao converter valores monetários', [LinhaAtual]));
          Continue;
        end;

        try
          Item.FDataAquisicao := StrToDate(Campos[6]);
        except
          FErros.Add(Format('Linha %d: Data inválida (%s). Use formato DD/MM/AAAA', [LinhaAtual, Campos[6]]));
          Continue;
        end;

        Item.FNumeroSerie := Campos[7];

        try
          Item.FIdSala := StrToIntDef(Campos[8], 0);
        except
          FErros.Add(Format('Linha %d: ID da sala inválido', [LinhaAtual]));
          Continue;
        end;

        // Quantidade sempre 1 no CSV (cada linha = 1 item único)
        Item.FQuantidade := 1;
        Item.FId := 0; // Novo registro

        // Valida o item
        if ValidarItem(Item, LinhaAtual) then
          ListaItens.Add(Item);

      except
        on E: Exception do
          FErros.Add(Format('Linha %d: Erro ao processar - %s', [LinhaAtual, E.Message]));
      end;
    end;

    // Converte lista para array
    SetLength(Itens, ListaItens.Count);
    for i := 0 to ListaItens.Count - 1 do
      Itens[i] := ListaItens[i];

    Result := True;

  finally
    CSVFile.Free;
    ListaItens.Free;
  end;
end;

class procedure TPatrimonioImportacaoCSV.GerarModeloCSV(const CaminhoArquivo: string);
var
  Modelo: TStringList;
begin
  Modelo := TStringList.Create;
  try
    // Instruções
    Modelo.Add('# MODELO DE IMPORTAÇÃO DE PATRIMÔNIO');
    Modelo.Add('# ===================================');
    Modelo.Add('#');
    Modelo.Add('# INSTRUÇÕES:');
    Modelo.Add('# 1. Apague todas as linhas de instrução (linhas que começam com #)');
    Modelo.Add('# 2. Mantenha OBRIGATORIAMENTE o cabeçalho (primeira linha sem #)');
    Modelo.Add('# 3. Preencha seus dados seguindo o formato dos exemplos');
    Modelo.Add('# 4. NÃO altere a ordem das colunas');
    Modelo.Add('#');
    Modelo.Add('# FORMATO DOS CAMPOS:');
    Modelo.Add('# - Nome: Texto livre (obrigatório)');
    Modelo.Add('# - Tipo: Texto livre');
    Modelo.Add('# - Situacao: Ativo, Inativo, Manutenção, etc');
    Modelo.Add('# - Modelo: Modelo do equipamento');
    Modelo.Add('# - ValorAquisicao: Número decimal com ponto (ex: 3500.00)');
    Modelo.Add('# - ValorAtual: Número decimal com ponto (ex: 2800.00)');
    Modelo.Add('# - DataAquisicao: Formato DD/MM/AAAA (ex: 15/03/2024)');
    Modelo.Add('# - NumeroSerie: Identificador ÚNICO do item (obrigatório)');
    Modelo.Add('# - IdSala: ID numérico da sala (consulte no sistema)');
    Modelo.Add('#   IMPORTANTE: Para obter os IDs das salas, acesse o cadastro de salas');
    Modelo.Add('#');
    Modelo.Add('# ATENÇÃO:');
    Modelo.Add('# - Cada item DEVE ter um número de série ÚNICO');
    Modelo.Add('# - Valores devem usar PONTO como separador decimal');
    Modelo.Add('# - Cada linha representa UM item individual');
    Modelo.Add('#');
    Modelo.Add('');

    // Cabeçalho obrigatório
    Modelo.Add('Nome,Tipo,Situacao,Modelo,ValorAquisicao,ValorAtual,DataAquisicao,NumeroSerie,IdSala');

    // Exemplos
    Modelo.Add('Notebook Dell Inspiron,Computador,Ativo,Inspiron 15,3500.00,2800.00,15/03/2024,SN001234,1');
    Modelo.Add('Mouse Logitech,Periférico,Ativo,MX Master 3,150.00,120.00,15/03/2024,SN001235,1');
    Modelo.Add('Cadeira Escritório,Mobiliário,Ativo,Presidente Giratória,800.00,600.00,10/01/2024,SN001236,2');
    Modelo.Add('Monitor Samsung 24,Periférico,Ativo,S24F350,900.00,750.00,20/02/2024,SN001237,1');
    Modelo.Add('Mesa Escritório,Mobiliário,Ativo,Mesa L 150x150cm,500.00,450.00,05/01/2024,SN001238,2');

    Modelo.SaveToFile(CaminhoArquivo, TEncoding.UTF8);
  finally
    Modelo.Free;
  end;
end;

end.
