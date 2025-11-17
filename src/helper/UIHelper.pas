unit UIHelper;

interface

uses Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Graphics, Vcl.Mask, Vcl.Controls;

type
  // Classe auxiliar para controle de estado de campos de UI
  TUIHelper = class
  public
    // Habilita/Desabilita um TEdit e ajusta sua cor
    class procedure SetEstadoEdit(Edit: TEdit; Habilitado: Boolean);

    // Habilita/Desabilita um TComboBox e ajusta sua cor
    class procedure SetEstadoComboBox(ComboBox: TComboBox; Habilitado: Boolean);

    // Habilita/Desabilita um TMemo e ajusta sua cor
    class procedure SetEstadoMemo(Memo: TMemo; Habilitado: Boolean);

    // Habilita/Desabilita um TMaskEdit e ajusta sua cor
    class procedure SetEstadoMaskEdit(MaskEdit: TMaskEdit; Habilitado: Boolean);

    // Habilita/Desabilita um TCheckBox e ajusta sua cor
    class procedure SetEstadoCheckBox(CheckBox: TCheckBox; Habilitado: Boolean);

    // Habilita/Desabilita um TPanel e ajusta sua cor (se for um container de campos)
    class procedure SetEstadoPanel(Panel: TPanel; Habilitado: Boolean; Recursivo: Boolean = False);

    // Função genérica para aplicar cores baseadas no estado
    class function GetCorCampo(Habilitado: Boolean): TColor;
  end;

implementation

class procedure TUIHelper.SetEstadoEdit(Edit: TEdit; Habilitado: Boolean);
begin
  if Assigned(Edit) then
  begin
    Edit.Enabled := Habilitado;
    Edit.Color := GetCorCampo(Habilitado);
  end;
end;

class procedure TUIHelper.SetEstadoComboBox(ComboBox: TComboBox; Habilitado: Boolean);
begin
  if Assigned(ComboBox) then
  begin
    ComboBox.Enabled := Habilitado;
    ComboBox.Color := GetCorCampo(Habilitado);
  end;
end;

class procedure TUIHelper.SetEstadoMemo(Memo: TMemo; Habilitado: Boolean);
begin
  if Assigned(Memo) then
  begin
    Memo.Enabled := Habilitado;
    Memo.Color := GetCorCampo(Habilitado);
  end;
end;

class procedure TUIHelper.SetEstadoMaskEdit(MaskEdit: TMaskEdit; Habilitado: Boolean);
begin
  if Assigned(MaskEdit) then
  begin
    MaskEdit.Enabled := Habilitado;
    MaskEdit.Color := GetCorCampo(Habilitado);
  end;
end;

class procedure TUIHelper.SetEstadoCheckBox(CheckBox: TCheckBox; Habilitado: Boolean);
begin
  if Assigned(CheckBox) then
  begin
    CheckBox.Enabled := Habilitado;
    // CheckBox não tem propriedade Color, então não ajustamos
  end;
end;

class procedure TUIHelper.SetEstadoPanel(Panel: TPanel; Habilitado: Boolean; Recursivo: Boolean = False);
var
  i: Integer;
  Controle: TControl;
begin
  if Assigned(Panel) then
  begin
    Panel.Enabled := Habilitado;

    if Recursivo then
    begin
      // Aplica recursivamente a todos os componentes dentro do painel
      for i := 0 to Panel.ControlCount - 1 do
      begin
        Controle := Panel.Controls[i];

        if Controle is TEdit then
          SetEstadoEdit(TEdit(Controle), Habilitado)
        else if Controle is TComboBox then
          SetEstadoComboBox(TComboBox(Controle), Habilitado)
        else if Controle is TMemo then
          SetEstadoMemo(TMemo(Controle), Habilitado)
        else if Controle is TMaskEdit then
          SetEstadoMaskEdit(TMaskEdit(Controle), Habilitado)
        else if Controle is TCheckBox then
          SetEstadoCheckBox(TCheckBox(Controle), Habilitado)
        else if Controle is TPanel then
          SetEstadoPanel(TPanel(Controle), Habilitado, True);
      end;
    end;
  end;
end;

class function TUIHelper.GetCorCampo(Habilitado: Boolean): TColor;
begin
  if Habilitado then
    Result := clWindow  // Branco para campos habilitados
  else
    Result := clBtnFace; // Cinza para campos desabilitados
end;

end.