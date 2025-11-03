object FormAnaliseOcorrencia: TFormAnaliseOcorrencia
  Left = 0
  Top = 0
  Caption = 'FormAnaliseOcorrencia'
  ClientHeight = 872
  ClientWidth = 1374
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1374
    Height = 872
    Align = alClient
    Caption = 'Panel1'
    Color = clActiveCaption
    ParentBackground = False
    TabOrder = 0
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 1372
      Height = 870
      Align = alClient
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object Label2: TLabel
        Left = 20
        Top = 273
        Width = 53
        Height = 15
        Caption = 'Gravidade'
      end
      object Label4: TLabel
        Left = 20
        Top = 403
        Width = 67
        Height = 15
        Caption = 'Observa'#231#245'es'
      end
      object Label3: TLabel
        Left = 319
        Top = 270
        Width = 57
        Height = 15
        Caption = 'Valor Atual'
      end
      object Label8: TLabel
        Left = 172
        Top = 273
        Width = 65
        Height = 15
        Caption = 'Deprecia'#231#227'o'
      end
      object Label9: TLabel
        Left = 486
        Top = 270
        Width = 58
        Height = 15
        Caption = 'Novo Valor'
      end
      object Label10: TLabel
        Left = 20
        Top = 334
        Width = 92
        Height = 15
        Caption = 'Responsabilidade'
      end
      object Label11: TLabel
        Left = 174
        Top = 334
        Width = 87
        Height = 15
        Caption = 'Custo de Reparo'
      end
      object Label7: TLabel
        Left = 20
        Top = 79
        Width = 122
        Height = 15
        Caption = 'Detalhes da Ocorr'#234'ncia'
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 1372
        Height = 57
        Color = clHighlight
        ParentBackground = False
        TabOrder = 0
        object Label1: TLabel
          Left = 20
          Top = 18
          Width = 145
          Height = 20
          Caption = 'Analise de Ocorr'#234'ncia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
      end
      object CbGravidadeA: TComboBox
        Left = 20
        Top = 294
        Width = 113
        Height = 23
        TabOrder = 1
      end
      object TMemo
        Left = 20
        Top = 424
        Width = 635
        Height = 260
        TabOrder = 2
      end
      object Panel5: TPanel
        Left = 142
        Top = 762
        Width = 137
        Height = 33
        BevelOuter = bvNone
        Caption = 'Panel4'
        Color = clWhite
        ParentBackground = False
        TabOrder = 3
        object Shape2: TShape
          Left = 0
          Top = 0
          Width = 137
          Height = 33
          Align = alClient
          Brush.Color = 16741948
          Pen.Style = psInsideFrame
          Shape = stRoundRect
          ExplicitLeft = 24
          ExplicitTop = 16
          ExplicitWidth = 65
          ExplicitHeight = 65
        end
        object Label5: TLabel
          Left = 48
          Top = 7
          Width = 47
          Height = 20
          Caption = 'Aceitar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object BtnSalvarAnalise: TSpeedButton
          Left = 0
          Top = 0
          Width = 137
          Height = 33
          Align = alClient
          Flat = True
          OnClick = BtnSalvarAnaliseClick
          ExplicitLeft = 40
          ExplicitTop = 8
          ExplicitWidth = 23
          ExplicitHeight = 22
        end
      end
      object Panel6: TPanel
        Left = 360
        Top = 762
        Width = 137
        Height = 33
        BevelOuter = bvNone
        Caption = 'Panel4'
        Color = clWhite
        ParentBackground = False
        TabOrder = 4
        object Shape1: TShape
          Left = 0
          Top = 0
          Width = 137
          Height = 33
          Align = alClient
          Brush.Color = clRed
          Pen.Style = psInsideFrame
          Shape = stRoundRect
          ExplicitLeft = 24
          ExplicitTop = 16
          ExplicitWidth = 65
          ExplicitHeight = 65
        end
        object Label6: TLabel
          Left = 41
          Top = 6
          Width = 57
          Height = 20
          Caption = 'Cancelar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object SpeedButton1: TSpeedButton
          Left = 0
          Top = 0
          Width = 137
          Height = 33
          Align = alClient
          Flat = True
          ExplicitLeft = 40
          ExplicitTop = 8
          ExplicitWidth = 23
          ExplicitHeight = 22
        end
      end
      object EdtValorAtualA: TMaskEdit
        Left = 319
        Top = 294
        Width = 131
        Height = 23
        EditMask = 'R$999,999.99;1;_'
        MaxLength = 12
        TabOrder = 5
        Text = 'R$   ,   .  '
      end
      object EdtDepreciacao: TNumberBox
        Left = 174
        Top = 294
        Width = 105
        Height = 23
        TabOrder = 6
      end
      object EdtNovoValorA: TMaskEdit
        Left = 486
        Top = 294
        Width = 102
        Height = 23
        EditMask = 'R$999,999.99;1;_'
        MaxLength = 12
        TabOrder = 7
        Text = 'R$   ,   .  '
      end
      object CbResponsabilidadeA: TComboBox
        Left = 20
        Top = 355
        Width = 113
        Height = 23
        TabOrder = 8
      end
      object CheckBoxManutencao: TCheckBox
        Left = 20
        Top = 706
        Width = 139
        Height = 17
        Caption = 'Requer Manuten'#231#227'o'
        TabOrder = 9
      end
      object EdCustoReparo: TMaskEdit
        Left = 174
        Top = 355
        Width = 102
        Height = 23
        EditMask = 'R$999,999.99;1;_'
        MaxLength = 12
        TabOrder = 10
        Text = 'R$   ,   .  '
      end
      object Panel2: TPanel
        Left = 712
        Top = 139
        Width = 633
        Height = 406
        BevelOuter = bvNone
        Caption = 'Panel2'
        Color = 10066329
        ParentBackground = False
        TabOrder = 11
        object DBGridAnalise: TDBGrid
          Left = 1
          Top = 1
          Width = 631
          Height = 404
          BorderStyle = bsNone
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          OnCellClick = DBGridAnaliseCellClick
          Columns = <
            item
              Expanded = False
              FieldName = 'id'
              Title.Caption = '       ID'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'usuario'
              Title.Caption = '         Usuario'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'item'
              Title.Caption = '               Item'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'tipo_ocorrencia'
              Title.Caption = '              Tipo'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'descricao'
              Title.Caption = '               Descri'#231#227'o'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'data_ocorrencia'
              Title.Caption = '              Data/Hora'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'status'
              Title.Caption = '          Status'
              Width = 100
              Visible = True
            end>
        end
      end
      object SearchBox1: TSearchBox
        Left = 712
        Top = 79
        Width = 352
        Height = 28
        Cursor = crIBeam
        BevelOuter = bvNone
        BorderStyle = bsNone
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 12
        TextHint = 'Pesquisar'
      end
      object Panel7: TPanel
        Left = 678
        Top = 55
        Width = 1
        Height = 810
        Color = clSilver
        ParentBackground = False
        TabOrder = 13
      end
      object MemoDetalhes: TMemo
        Left = 20
        Top = 100
        Width = 349
        Height = 153
        Lines.Strings = (
          'EdtValorAtualA')
        TabOrder = 14
      end
    end
  end
  object DataSource1: TDataSource
    Left = 1225
    Top = 81
  end
end
