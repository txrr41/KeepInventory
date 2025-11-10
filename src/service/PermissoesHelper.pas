unit PermissoesHelper;

interface

uses
  System.SysUtils, Vcl.Forms, Vcl.Controls, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, UsuarioModel, dialogs, Vcl.NumberBox, System.Classes;

type
  TPermissoesHelper = class
  private
    class var FUsuarioLogado: TUsuarioModel;
  public
    class procedure SetUsuarioLogado(AUsuario: TUsuarioModel);
    class function GetUsuarioLogado: TUsuarioModel;
    class procedure AplicarPermissoes(AForm: TForm);
    class procedure AplicarPermissoesCadastros(APageControl: TPageControl);
    class procedure AplicarPermissoesMovimentacoes(AForm: TForm);
    class procedure AplicarPermissoesOcorrencias(AForm: TForm);
    class procedure AplicarPermissoesUsuarios(AForm: TForm);
  end;

implementation

{ TPermissoesHelper }

class procedure TPermissoesHelper.SetUsuarioLogado(AUsuario: TUsuarioModel);
begin
  FUsuarioLogado := AUsuario;
end;

class function TPermissoesHelper.GetUsuarioLogado: TUsuarioModel;
begin
  Result := FUsuarioLogado;
end;

class procedure TPermissoesHelper.AplicarPermissoes(AForm: TForm);
begin
  if FUsuarioLogado = nil then
    Exit;

  // Verifica o tipo de formulário e aplica as permissões específicas
  if AForm.ClassName = 'TFormCadastro' then
  begin
    // Esconde todas as abas se não tem permissão de cadastros
    if not FUsuarioLogado.PermCadastros then
    begin
      ShowMessage('Você não tem permissão para acessar o módulo de Cadastros!');
      AForm.Close;
    end;
  end
  else if AForm.ClassName = 'TFormMovi' then
  begin
    if not FUsuarioLogado.PermMovimentacoes then
    begin
      ShowMessage('Você não tem permissão para acessar o módulo de Movimentações!');
      AForm.Close;
    end
    else
      AplicarPermissoesMovimentacoes(AForm);
  end
  else if AForm.ClassName = 'TFormAnaliseOcorrencia' then
  begin
    if not FUsuarioLogado.PermOcorrencias then
    begin
      ShowMessage('Você não tem permissão para acessar o módulo de Ocorrências!');
      AForm.Close;
    end
    else
      AplicarPermissoesOcorrencias(AForm);
  end
  else if AForm.ClassName = 'TFormCadastroUsuario' then
  begin
    if not FUsuarioLogado.PermUsuarios then
    begin
      ShowMessage('Você não tem permissão para acessar o módulo de Usuários!');
      AForm.Close;
    end
    else
      AplicarPermissoesUsuarios(AForm);
  end;
end;

class procedure TPermissoesHelper.AplicarPermissoesCadastros(APageControl: TPageControl);
var
  I: Integer;
begin
  if FUsuarioLogado = nil then
    Exit;

  // Percorre todas as abas do PageControl
  for I := APageControl.PageCount - 1 downto 0 do
  begin
    // Aba Empresas (TabSheet1)
    if (APageControl.Pages[I].Name = 'TabSheet1') and (not FUsuarioLogado.PermCadEmpresa) then
      APageControl.Pages[I].TabVisible := False;

    // Aba Prédios (TabSheet2)
    if (APageControl.Pages[I].Name = 'TabSheet2') and (not FUsuarioLogado.PermCadPredio) then
      APageControl.Pages[I].TabVisible := False;

    // Aba Salas (TabSheet3)
    if (APageControl.Pages[I].Name = 'TabSheet3') and (not FUsuarioLogado.PermCadSala) then
      APageControl.Pages[I].TabVisible := False;

    // Aba Patrimônios (TabSheet4)
    if (APageControl.Pages[I].Name = 'TabSheet4') and (not FUsuarioLogado.PermCadPatrimonio) then
      APageControl.Pages[I].TabVisible := False;
  end;

  // Se ainda houver abas visíveis, seleciona a primeira
  for I := 0 to APageControl.PageCount - 1 do
  begin
    if APageControl.Pages[I].TabVisible then
    begin
      APageControl.ActivePage := APageControl.Pages[I];
      Break;
    end;
  end;
end;

class procedure TPermissoesHelper.AplicarPermissoesMovimentacoes(AForm: TForm);
var
  I: Integer;
  Comp: TComponent;
begin
  if FUsuarioLogado = nil then
    Exit;

  // Percorre todos os componentes do formulário
  for I := 0 to AForm.ComponentCount - 1 do
  begin
    Comp := AForm.Components[I];

    // Botão Adicionar Movimentação
    if (Comp is TSpeedButton) and (Comp.Name = 'BtnAddMovi') then
      TSpeedButton(Comp).Visible := FUsuarioLogado.PermMovAdicionar;

    // Botão Excluir Movimentação
    if (Comp is TSpeedButton) and (Comp.Name = 'BtnExcluirMovi') then
      TSpeedButton(Comp).Visible := FUsuarioLogado.PermMovExcluir;

    // Botão Analisar/Pendências
    if (Comp is TSpeedButton) and (Comp.Name = 'BtnPendencias') then
      TSpeedButton(Comp).Visible := FUsuarioLogado.PermMovAnalisar;

    // Botões de aceitar/recusar pendência
    if (Comp is TSpeedButton) and
       ((Comp.Name = 'BtnAceitarPendencia') or (Comp.Name = 'BtnRecusarPendencia')) then
      TSpeedButton(Comp).Visible := FUsuarioLogado.PermMovAnalisar;
  end;
end;

class procedure TPermissoesHelper.AplicarPermissoesOcorrencias(AForm: TForm);
var
  I: Integer;
  Comp: TComponent;
begin
  if FUsuarioLogado = nil then
    Exit;

  for I := 0 to AForm.ComponentCount - 1 do
  begin
    Comp := AForm.Components[I];

    // Botão Salvar Análise (apenas quem pode analisar)
    if (Comp is TSpeedButton) and (Comp.Name = 'BtnSalvarAnalise') then
      TSpeedButton(Comp).Visible := FUsuarioLogado.PermOcorAnalisar;

    // Campos de análise (desabilita se não pode analisar)
    if FUsuarioLogado.PermOcorAnalisar = False then
    begin
      if (Comp is TComboBox) and
         ((Comp.Name = 'CbGravidadeA') or (Comp.Name = 'CbResponsabilidadeA')) then
        TComboBox(Comp).Enabled := False;

      if (Comp is TNumberBox) and (Comp.Name = 'EdtDepreciacao') then
        TNumberBox(Comp).Enabled := False;

      if (Comp is TMemo) and (Comp.Name = 'MemoDetalhes') then
        TMemo(Comp).ReadOnly := True;
    end;
  end;
end;

class procedure TPermissoesHelper.AplicarPermissoesUsuarios(AForm: TForm);
var
  I: Integer;
  Comp: TComponent;
begin
  if FUsuarioLogado = nil then
    Exit;

  for I := 0 to AForm.ComponentCount - 1 do
  begin
    Comp := AForm.Components[I];

    // Botões de adicionar e editar (permissão de cadastrar)
    if (Comp is TSpeedButton) and
       ((Comp.Name = 'BtnAddUser') or (Comp.Name = 'BtnSalavarUser') or
        (Comp.Name = 'BtnEditarUser')) then
      TSpeedButton(Comp).Visible := FUsuarioLogado.PermUserCadastrar;

    // Botão Excluir
    if (Comp is TSpeedButton) and (Comp.Name = 'BtnExcluirUser') then
      TSpeedButton(Comp).Visible := FUsuarioLogado.PermUserCadastrar;

    // Painéis de permissões (apenas quem tem permissão de gerenciar permissões)
    if (Comp is TPanel) and
       ((Comp.Name = 'Panel9') or (Comp.Name = 'Panel11') or
        (Comp.Name = 'Panel12') or (Comp.Name = 'Panel13')) then
      TPanel(Comp).Enabled := FUsuarioLogado.PermUserPermissao;

    // Checkboxes de permissões
    if (Comp is TCheckBox) and FUsuarioLogado.PermUserPermissao then
      TCheckBox(Comp).Enabled := False;
  end;
end;

initialization

finalization
  if TPermissoesHelper.FUsuarioLogado <> nil then
    TPermissoesHelper.FUsuarioLogado.Free;

end.
