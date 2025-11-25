unit PermissoesHelper;

interface

uses
  System.SysUtils, Vcl.Forms, Vcl.Controls, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, UsuarioModel, dialogs, Vcl.NumberBox, System.Classes,
  System.StrUtils;

type
  TPermissoesHelper = class
  private
    class var FUsuarioLogado: TUsuarioModel;
    class function TemBotaoVisivelNoPanel(APanel: TPanel): Boolean;
  public
    class procedure SetUsuarioLogado(AUsuario: TUsuarioModel);
    class function GetUsuarioLogado: TUsuarioModel;
    class procedure AplicarPermissoes(AForm: TForm);
    class procedure AplicarPermissoesCadastros(APageControl: TPageControl);
    class procedure AplicarPermissoesBotoesCadastros(AForm: TForm);
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
    end
    else
      AplicarPermissoesBotoesCadastros(AForm);
  end
  else if AForm.ClassName = 'TFormMovi' then
  begin
    if not FUsuarioLogado.PermMovimentacoes then
    begin
      ShowMessage('Voc� n�o tem permiss�o para acessar o m�dulo de Movimenta��es!');
      AForm.Close;
    end
    else
      AplicarPermissoesMovimentacoes(AForm);
  end
  else if AForm.ClassName = 'TFormAnaliseOcorrencia' then
  begin
    if not FUsuarioLogado.PermOcorrencias then
    begin
      ShowMessage('Voc� n�o tem permiss�o para acessar o m�dulo de Ocorr�ncias!');
      AForm.Close;
    end
    else
      AplicarPermissoesOcorrencias(AForm);
  end
  else if AForm.ClassName = 'TFormCadastroUsuario' then
  begin
    if not FUsuarioLogado.PermUsuarios then
    begin
      ShowMessage('Voc� n�o tem permiss�o para acessar o m�dulo de Usu�rios!');
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

    // Aba Pr�dios (TabSheet2)
    if (APageControl.Pages[I].Name = 'TabSheet2') and (not FUsuarioLogado.PermCadPredio) then
      APageControl.Pages[I].TabVisible := False;

    // Aba Salas (TabSheet3)
    if (APageControl.Pages[I].Name = 'TabSheet3') and (not FUsuarioLogado.PermCadSala) then
      APageControl.Pages[I].TabVisible := False;

    // Aba Patrim�nios (TabSheet4)
    if (APageControl.Pages[I].Name = 'TabSheet4') and (not FUsuarioLogado.PermCadPatrimonio) then
      APageControl.Pages[I].TabVisible := False;
  end;

  // Se ainda houver abas vis�veis, seleciona a primeira
  for I := 0 to APageControl.PageCount - 1 do
  begin
    if APageControl.Pages[I].TabVisible then
    begin
      APageControl.ActivePage := APageControl.Pages[I];
      Break;
    end;
  end;
end;

class procedure TPermissoesHelper.AplicarPermissoesBotoesCadastros(AForm: TForm);
var
  I: Integer;
  Comp: TComponent;
  ParentPanel: TPanel;
begin
  if FUsuarioLogado = nil then
    Exit;

  // Percorre todos os componentes do formulário
  for I := 0 to AForm.ComponentCount - 1 do
  begin
    Comp := AForm.Components[I];

    // Botões de EMPRESA
    if (Comp is TSpeedButton) and (Comp.Name = 'BtnAdicionarEmpresa') then
    begin
      TSpeedButton(Comp).Visible := FUsuarioLogado.PermCadEmpresa;
      if (not FUsuarioLogado.PermCadEmpresa) and (Comp.Parent is TPanel) then
      begin
        ParentPanel := TPanel(Comp.Parent);
        if not TemBotaoVisivelNoPanel(ParentPanel) then
          ParentPanel.Visible := False;
      end;
    end;

    if (Comp is TSpeedButton) and ((Comp.Name = 'BtnEditarEmpresa') or (Comp.Name = 'BtnExcluirEmpresa') or (Comp.Name = 'BtnAtualizarEmpresa')) then
    begin
      TSpeedButton(Comp).Visible := FUsuarioLogado.PermCadEmpresa;
      if (not FUsuarioLogado.PermCadEmpresa) and (Comp.Parent is TPanel) then
      begin
        ParentPanel := TPanel(Comp.Parent);
        if not TemBotaoVisivelNoPanel(ParentPanel) then
          ParentPanel.Visible := False;
      end;
    end;

    // Botões de PRÉDIO
    if (Comp is TSpeedButton) and (Comp.Name = 'BtnAdicionarPredio') then
    begin
      TSpeedButton(Comp).Visible := FUsuarioLogado.PermCadPredio;
      if (not FUsuarioLogado.PermCadPredio) and (Comp.Parent is TPanel) then
      begin
        ParentPanel := TPanel(Comp.Parent);
        if not TemBotaoVisivelNoPanel(ParentPanel) then
          ParentPanel.Visible := False;
      end;
    end;

    if (Comp is TSpeedButton) and ((Comp.Name = 'BtnEditarPredio') or (Comp.Name = 'BtnExcluirPredio') or (Comp.Name = 'BtnAtualizarPredio') or (Comp.Name = 'BtnFiltrarPredio')) then
    begin
      TSpeedButton(Comp).Visible := FUsuarioLogado.PermCadPredio;
      if (not FUsuarioLogado.PermCadPredio) and (Comp.Parent is TPanel) then
      begin
        ParentPanel := TPanel(Comp.Parent);
        if not TemBotaoVisivelNoPanel(ParentPanel) then
          ParentPanel.Visible := False;
      end;
    end;

    // Botões de SALA
    if (Comp is TSpeedButton) and (Comp.Name = 'BtnAdicionarSala') then
    begin
      TSpeedButton(Comp).Visible := FUsuarioLogado.PermCadSala;
      if (not FUsuarioLogado.PermCadSala) and (Comp.Parent is TPanel) then
      begin
        ParentPanel := TPanel(Comp.Parent);
        if not TemBotaoVisivelNoPanel(ParentPanel) then
          ParentPanel.Visible := False;
      end;
    end;

    if (Comp is TSpeedButton) and ((Comp.Name = 'BtnEditarSala') or (Comp.Name = 'BtnExcluirSala') or (Comp.Name = 'BtnAtualizarSala') or (Comp.Name = 'BtnFiltrarSala')) then
    begin
      TSpeedButton(Comp).Visible := FUsuarioLogado.PermCadSala;
      if (not FUsuarioLogado.PermCadSala) and (Comp.Parent is TPanel) then
      begin
        ParentPanel := TPanel(Comp.Parent);
        if not TemBotaoVisivelNoPanel(ParentPanel) then
          ParentPanel.Visible := False;
      end;
    end;

    // Botões de PATRIMÔNIO
    if (Comp is TSpeedButton) and (Comp.Name = 'BtnAdicionarPatrimonio') then
    begin
      TSpeedButton(Comp).Visible := FUsuarioLogado.PermCadPatrimonio;
      if (not FUsuarioLogado.PermCadPatrimonio) and (Comp.Parent is TPanel) then
      begin
        ParentPanel := TPanel(Comp.Parent);
        if not TemBotaoVisivelNoPanel(ParentPanel) then
          ParentPanel.Visible := False;
      end;
    end;

    if (Comp is TSpeedButton) and ((Comp.Name = 'BtnEditarPatrimonio') or (Comp.Name = 'BtnExcluirPatrimonio') or (Comp.Name = 'BtnAtualizarPatrimonio') or (Comp.Name = 'BtnFiltrarPatrimonio')) then
    begin
      TSpeedButton(Comp).Visible := FUsuarioLogado.PermCadPatrimonio;
      if (not FUsuarioLogado.PermCadPatrimonio) and (Comp.Parent is TPanel) then
      begin
        ParentPanel := TPanel(Comp.Parent);
        if not TemBotaoVisivelNoPanel(ParentPanel) then
          ParentPanel.Visible := False;
      end;
    end;

    // Botões de RECUPERAR (excluir/inativar)
    if (Comp is TSpeedButton) and (Pos('Recuperar', Comp.Name) > 0) then
    begin
      // Usa a mesma permissão do módulo correspondente
      if Pos('Empresa', Comp.Name) > 0 then
        TSpeedButton(Comp).Visible := FUsuarioLogado.PermCadEmpresa
      else if Pos('Predio', Comp.Name) > 0 then
        TSpeedButton(Comp).Visible := FUsuarioLogado.PermCadPredio
      else if Pos('Sala', Comp.Name) > 0 then
        TSpeedButton(Comp).Visible := FUsuarioLogado.PermCadSala
      else if Pos('Patrimonio', Comp.Name) > 0 then
        TSpeedButton(Comp).Visible := FUsuarioLogado.PermCadPatrimonio;

      if (Comp.Parent is TPanel) then
      begin
        ParentPanel := TPanel(Comp.Parent);
        if not TemBotaoVisivelNoPanel(ParentPanel) then
          ParentPanel.Visible := False;
      end;
    end;

    // Botões de BUTTON (não SpeedButton) - tratamento especial
    if (Comp is TButton) then
    begin
      if Pos('Enviar', Comp.Name) > 0 then
      begin
        // Botões de envio/salvamento
        if Pos('Patrimonio', Comp.Name) > 0 then
          TButton(Comp).Visible := FUsuarioLogado.PermCadPatrimonio
        else if Pos('Sala', Comp.Name) > 0 then
          TButton(Comp).Visible := FUsuarioLogado.PermCadSala
        else if Pos('Predio', Comp.Name) > 0 then
          TButton(Comp).Visible := FUsuarioLogado.PermCadPredio
        else if (Comp.Name = 'BtnEnviar') then
          TButton(Comp).Visible := FUsuarioLogado.PermCadEmpresa;
      end
      else if Pos('Confirmar', Comp.Name) > 0 then
      begin
        // Botões de confirmação de edição
        if Pos('Patri', Comp.Name) > 0 then
          TButton(Comp).Visible := FUsuarioLogado.PermCadPatrimonio
        else if Pos('Sala', Comp.Name) > 0 then
          TButton(Comp).Visible := FUsuarioLogado.PermCadSala
        else if Pos('Pred', Comp.Name) > 0 then
          TButton(Comp).Visible := FUsuarioLogado.PermCadPredio
        else if (Comp.Name = 'BtnConfirmarEd') then
          TButton(Comp).Visible := FUsuarioLogado.PermCadEmpresa;
      end;

      // Se o botão está invisível e está dentro de um Panel, desativa o Panel também
      if (Comp is TButton) and (not TButton(Comp).Visible) and (Comp.Parent is TPanel) then
      begin
        ParentPanel := TPanel(Comp.Parent);
        if not TemBotaoVisivelNoPanel(ParentPanel) then
          ParentPanel.Visible := False;
      end;
    end;
  end;
end;

class procedure TPermissoesHelper.AplicarPermissoesMovimentacoes(AForm: TForm);
var
  I: Integer;
  Comp: TComponent;
  ParentPanel: TPanel;
begin
  if FUsuarioLogado = nil then
    Exit;

  // Percorre todos os componentes do formulário
  for I := 0 to AForm.ComponentCount - 1 do
  begin
    Comp := AForm.Components[I];

    // Botão Adicionar Movimentação
    if (Comp is TSpeedButton) and (Comp.Name = 'BtnAddMovi') then
    begin
      TSpeedButton(Comp).Visible := FUsuarioLogado.PermMovAdicionar;
      // Se o botão está invisível e está dentro de um Panel, desativa o Panel também
      if (not FUsuarioLogado.PermMovAdicionar) and (Comp.Parent is TPanel) then
      begin
        ParentPanel := TPanel(Comp.Parent);
        if not TemBotaoVisivelNoPanel(ParentPanel) then
          ParentPanel.Visible := False;
      end;
    end;

    // Botão Excluir Movimentação
    if (Comp is TSpeedButton) and (Comp.Name = 'BtnExcluirMovi') then
    begin
      TSpeedButton(Comp).Visible := FUsuarioLogado.PermMovExcluir;
      // Se o botão está invisível e está dentro de um Panel, desativa o Panel também
      if (not FUsuarioLogado.PermMovExcluir) and (Comp.Parent is TPanel) then
      begin
        ParentPanel := TPanel(Comp.Parent);
        if not TemBotaoVisivelNoPanel(ParentPanel) then
          ParentPanel.Visible := False;
      end;
    end;

    // Botão Analisar/Pendências
    if (Comp is TSpeedButton) and (Comp.Name = 'BtnPendencias') then
    begin
      TSpeedButton(Comp).Visible := FUsuarioLogado.PermMovAnalisar;
      // Se o botão está invisível e está dentro de um Panel, desativa o Panel também
      if (not FUsuarioLogado.PermMovAnalisar) and (Comp.Parent is TPanel) then
      begin
        ParentPanel := TPanel(Comp.Parent);
        if not TemBotaoVisivelNoPanel(ParentPanel) then
          ParentPanel.Visible := False;
      end;
    end;

    // Botões de aceitar/recusar pendência
    if (Comp is TSpeedButton) and
       ((Comp.Name = 'BtnAceitarPendencia') or (Comp.Name = 'BtnRecusarPendencia')) then
    begin
      TSpeedButton(Comp).Visible := FUsuarioLogado.PermMovAnalisar;
      // Se o botão está invisível e está dentro de um Panel, desativa o Panel também
      if (not FUsuarioLogado.PermMovAnalisar) and (Comp.Parent is TPanel) then
      begin
        ParentPanel := TPanel(Comp.Parent);
        if not TemBotaoVisivelNoPanel(ParentPanel) then
          ParentPanel.Visible := False;
      end;
    end;
  end;
end;

class procedure TPermissoesHelper.AplicarPermissoesOcorrencias(AForm: TForm);
var
  I: Integer;
  Comp: TComponent;
  ParentPanel: TPanel;
begin
  if FUsuarioLogado = nil then
    Exit;

  for I := 0 to AForm.ComponentCount - 1 do
  begin
    Comp := AForm.Components[I];

    // Botão Salvar Análise (apenas quem pode analisar)
    if (Comp is TSpeedButton) and (Comp.Name = 'BtnSalvarAnalise') then
    begin
      TSpeedButton(Comp).Visible := FUsuarioLogado.PermOcorAnalisar;
      // Se o botão está invisível e está dentro de um Panel, desativa o Panel também
      if (not FUsuarioLogado.PermOcorAnalisar) and (Comp.Parent is TPanel) then
      begin
        ParentPanel := TPanel(Comp.Parent);
        if not TemBotaoVisivelNoPanel(ParentPanel) then
          ParentPanel.Visible := False;
      end;
    end;

    // Botão Adicionar/Registrar Ocorrência (apenas quem pode adicionar)
    if (Comp is TSpeedButton) and ((Comp.Name = 'BtnAdicionarPatrimonio') or (Comp.Name = 'BtnRegistrar')) then
    begin
      TSpeedButton(Comp).Visible := FUsuarioLogado.PermOcorAdicionar;
      // Se o botão está invisível e está dentro de um Panel, desativa o Panel também
      if (not FUsuarioLogado.PermOcorAdicionar) and (Comp.Parent is TPanel) then
      begin
        ParentPanel := TPanel(Comp.Parent);
        if not TemBotaoVisivelNoPanel(ParentPanel) then
          ParentPanel.Visible := False;
      end;
    end;

    // Botão Excluir Ocorrência
    if (Comp is TSpeedButton) and (Comp.Name = 'BtnExcluir') then
    begin
      TSpeedButton(Comp).Visible := FUsuarioLogado.PermOcorExcluir;
      // Se o botão está invisível e está dentro de um Panel, desativa o Panel também
      if (not FUsuarioLogado.PermOcorExcluir) and (Comp.Parent is TPanel) then
      begin
        ParentPanel := TPanel(Comp.Parent);
        if not TemBotaoVisivelNoPanel(ParentPanel) then
          ParentPanel.Visible := False;
      end;
    end;

    // Botão Editar/Atualizar Ocorrência
    if (Comp is TSpeedButton) and ((Comp.Name = 'BtnAtualizarMovi') or (Comp.Name = 'BtnEditarMovi')) then
    begin
      TSpeedButton(Comp).Visible := FUsuarioLogado.PermOcorAdicionar;
      // Se o botão está invisível e está dentro de um Panel, desativa o Panel também
      if (not FUsuarioLogado.PermOcorAdicionar) and (Comp.Parent is TPanel) then
      begin
        ParentPanel := TPanel(Comp.Parent);
        if not TemBotaoVisivelNoPanel(ParentPanel) then
          ParentPanel.Visible := False;
      end;
    end;

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
  ParentPanel: TPanel;
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
    begin
      TSpeedButton(Comp).Visible := FUsuarioLogado.PermUserCadastrar;
      // Se o botão está invisível e está dentro de um Panel, desativa o Panel também
      if (not FUsuarioLogado.PermUserCadastrar) and (Comp.Parent is TPanel) then
      begin
        ParentPanel := TPanel(Comp.Parent);
        if not TemBotaoVisivelNoPanel(ParentPanel) then
          ParentPanel.Visible := False;
      end;
    end;

    // Botão Excluir
    if (Comp is TSpeedButton) and (Comp.Name = 'BtnExcluirUser') then
    begin
      TSpeedButton(Comp).Visible := FUsuarioLogado.PermUserCadastrar;
      // Se o botão está invisível e está dentro de um Panel, desativa o Panel também
      if (not FUsuarioLogado.PermUserCadastrar) and (Comp.Parent is TPanel) then
      begin
        ParentPanel := TPanel(Comp.Parent);
        if not TemBotaoVisivelNoPanel(ParentPanel) then
          ParentPanel.Visible := False;
      end;
    end;

    // Painéis de permissões (apenas quem tem permissão de gerenciar permissões)
    if (Comp is TPanel) and
       ((Comp.Name = 'Panel9') or (Comp.Name = 'Panel11') or
        (Comp.Name = 'Panel12') or (Comp.Name = 'Panel13')) then
    begin
      TPanel(Comp).Enabled := FUsuarioLogado.PermUserPermissao;
      // Se o painel está desabilitado e não tem permissão, esconde ele completamente
      if not FUsuarioLogado.PermUserPermissao then
        TPanel(Comp).Visible := False;
    end;

    // Checkboxes de permissões
    if (Comp is TCheckBox) and FUsuarioLogado.PermUserPermissao then
      TCheckBox(Comp).Enabled := False;
  end;
end;

class function TPermissoesHelper.TemBotaoVisivelNoPanel(APanel: TPanel): Boolean;
var
  I: Integer;
  ChildComp: TComponent;
begin
  Result := False;

  if APanel = nil then
    Exit;

  // Verifica se há algum SpeedButton ou Button visível no painel
  for I := 0 to APanel.ComponentCount - 1 do
  begin
    ChildComp := APanel.Components[I];

    // Verifica SpeedButtons visíveis
    if (ChildComp is TSpeedButton) and TSpeedButton(ChildComp).Visible then
    begin
      Result := True;
      Exit;
    end;

    // Verifica Buttons visíveis
    if (ChildComp is TButton) and TButton(ChildComp).Visible then
    begin
      Result := True;
      Exit;
    end;
  end;
end;

initialization

finalization
  if TPermissoesHelper.FUsuarioLogado <> nil then
    TPermissoesHelper.FUsuarioLogado.Free;

end.
