object FormCadastro: TFormCadastro
  Left = 0
  Top = 0
  ActiveControl = DBGrid1
  Caption = 'FormCadastro'
  ClientHeight = 845
  ClientWidth = 1380
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'B '
  Font.Style = []
  TextHeight = 15
  object PanelCadastro: TPanel
    Left = -8
    Top = 0
    Width = 1390
    Height = 857
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Consolas'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 615
      Top = 17
      Width = 159
      Height = 42
      Caption = 'Cadastros'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -32
      Font.Name = '@Microsoft YaHei'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object PageControl1: TPageControl
      Left = -10
      Top = 72
      Width = 1398
      Height = 785
      ActivePage = TabSheet1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabHeight = 45
      TabOrder = 0
      TabWidth = 207
      OnChange = PageControl1Change
      object TabSheet1: TTabSheet
        ParentCustomHint = False
        Caption = 'Empresa'
        DoubleBuffered = False
        ParentDoubleBuffered = False
        ParentShowHint = False
        ShowHint = False
        object Panel10: TPanel
          Left = 3
          Top = 0
          Width = 1387
          Height = 746
          Caption = 'Panel10'
          Color = clGradientInactiveCaption
          ParentBackground = False
          TabOrder = 3
          object Shape6: TShape
            Left = 664
            Top = 264
            Width = 65
            Height = 65
          end
          object Shape7: TShape
            Left = 1064
            Top = 103
            Width = 233
            Height = 448
            Pen.Style = psClear
          end
          object Shape9: TShape
            Left = 74
            Top = 103
            Width = 946
            Height = 448
            Pen.Style = psClear
          end
          object PanelAddEmpresa: TPanel
            Left = 1
            Top = 575
            Width = 1385
            Height = 170
            Align = alBottom
            BevelOuter = bvNone
            Color = clMenu
            ParentBackground = False
            TabOrder = 0
            Visible = False
            object Label15: TLabel
              Left = 24
              Top = 19
              Width = 64
              Height = 15
              Caption = 'Raz'#227'o social'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label16: TLabel
              Left = 168
              Top = 19
              Width = 77
              Height = 15
              Caption = 'Nome fantasia'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label17: TLabel
              Left = 308
              Top = 19
              Width = 27
              Height = 15
              Caption = 'CNPJ'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label18: TLabel
              Left = 450
              Top = 19
              Width = 45
              Height = 15
              Caption = 'Telefone'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label19: TLabel
              Left = 724
              Top = 19
              Width = 20
              Height = 15
              Caption = 'Rua'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label20: TLabel
              Left = 588
              Top = 19
              Width = 21
              Height = 15
              Caption = 'CEP'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label21: TLabel
              Left = 868
              Top = 19
              Width = 44
              Height = 15
              Caption = 'N'#250'mero'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label22: TLabel
              Left = 1009
              Top = 19
              Width = 31
              Height = 15
              Caption = 'Bairro'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label23: TLabel
              Left = 24
              Top = 75
              Width = 37
              Height = 15
              Caption = 'Cidade'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label24: TLabel
              Left = 168
              Top = 75
              Width = 35
              Height = 15
              Caption = 'Estado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object EditRazao: TEdit
              Left = 24
              Top = 40
              Width = 121
              Height = 28
              TabOrder = 0
            end
            object EditFantasia: TEdit
              Left = 168
              Top = 40
              Width = 121
              Height = 28
              TabOrder = 1
            end
            object EditRua: TEdit
              Left = 724
              Top = 40
              Width = 121
              Height = 28
              TabOrder = 2
            end
            object EditCnpj: TMaskEdit
              Left = 309
              Top = 40
              Width = 120
              Height = 28
              EditMask = '##.###.###/####-##;1;_'
              MaxLength = 18
              TabOrder = 3
              Text = '  .   .   /    -  '
            end
            object EditTelefone: TMaskEdit
              Left = 450
              Top = 40
              Width = 117
              Height = 28
              EditMask = '(##)#####-####;1;_'
              MaxLength = 14
              TabOrder = 4
              Text = '(  )     -    '
            end
            object EditCep: TMaskEdit
              Left = 588
              Top = 40
              Width = 114
              Height = 28
              EditMask = '00000-999;1;_'
              MaxLength = 9
              TabOrder = 5
              Text = '     -   '
            end
            object EditNumero: TEdit
              Left = 868
              Top = 40
              Width = 121
              Height = 28
              TabOrder = 6
            end
            object EditBairro: TEdit
              Left = 1009
              Top = 40
              Width = 121
              Height = 28
              TabOrder = 7
            end
            object EditCidade: TEdit
              Left = 24
              Top = 96
              Width = 121
              Height = 28
              TabOrder = 8
            end
            object EditEstado: TEdit
              Left = 168
              Top = 96
              Width = 121
              Height = 28
              TabOrder = 9
            end
            object BtnEnviar: TButton
              Left = 1195
              Top = 57
              Width = 151
              Height = 37
              Caption = 'Enviar'
              TabOrder = 10
              OnClick = BtnEnviarClick
            end
            object BtnConfirmarEd: TButton
              Left = 1195
              Top = 56
              Width = 151
              Height = 38
              Caption = 'Confirmar altera'#231#227'o'
              TabOrder = 11
              OnClick = BtnConfirmarEdClick
            end
          end
        end
        object Panel2: TPanel
          Left = 89
          Top = 112
          Width = 921
          Height = 424
          BevelOuter = bvNone
          Caption = 'Panel2'
          Color = clMenu
          ParentBackground = False
          TabOrder = 0
          object DBGrid1: TDBGrid
            Left = 12
            Top = 13
            Width = 897
            Height = 393
            BorderStyle = bsNone
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -15
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'id'
                Title.Caption = '     ID'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'nome_fantasia'
                Title.Caption = '  Nome Fantasia'
                Width = 120
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'razao_social'
                Title.Caption = '   Raz'#227'o Social'
                Width = 120
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'cnpj'
                Title.Caption = '          CNPJ'
                Width = 120
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'telefone'
                Title.Caption = '      Telefone'
                Width = 120
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'estado'
                Title.Caption = '      Estado'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'cidade'
                Title.Caption = '      Cidade'
                Width = 120
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'bairro'
                Title.Caption = '     Bairro'
                Width = 120
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'rua'
                Title.Caption = 'Rua'
                Width = 120
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'numero'
                Title.Caption = 'N'#250'mero'
                Visible = True
              end>
          end
        end
        object Panel4: TPanel
          Left = 1078
          Top = 112
          Width = 209
          Height = 424
          BevelOuter = bvNone
          Color = clMenu
          ParentBackground = False
          TabOrder = 1
          object Panel5: TPanel
            Left = 24
            Top = 24
            Width = 161
            Height = 41
            BevelOuter = bvNone
            Caption = 'Panel5'
            ParentBackground = False
            TabOrder = 0
            object Shape1: TShape
              Left = 0
              Top = 0
              Width = 161
              Height = 41
              Align = alClient
              Brush.Color = 16741948
              Pen.Style = psInsideFrame
              Shape = stRoundRect
              ExplicitLeft = 24
              ExplicitTop = 16
              ExplicitWidth = 65
              ExplicitHeight = 65
            end
            object Label2: TLabel
              Left = 47
              Top = 10
              Width = 64
              Height = 20
              Caption = 'Adicionar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -15
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object BtnAdicionarEmpresa: TSpeedButton
              Left = 0
              Top = 0
              Width = 161
              Height = 41
              Align = alClient
              Flat = True
              OnClick = BtnAdicionarEmpresaClick
              ExplicitTop = 8
              ExplicitHeight = 33
            end
          end
          object Panel6: TPanel
            Left = 24
            Top = 102
            Width = 161
            Height = 41
            BevelOuter = bvNone
            Caption = 'Panel5'
            ParentBackground = False
            TabOrder = 1
            object Label3: TLabel
              Left = 60
              Top = 9
              Width = 39
              Height = 20
              Caption = 'Editar'
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -15
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentColor = False
              ParentFont = False
            end
            object Label13: TLabel
              Left = 102
              Top = 21
              Width = 59
              Height = 20
              Caption = 'Atualizar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -15
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Shape2: TShape
              Left = 0
              Top = 0
              Width = 161
              Height = 41
              Align = alClient
              Brush.Color = 16741948
              Pen.Style = psInsideFrame
              Shape = stRoundRect
              ExplicitLeft = 24
              ExplicitTop = 16
              ExplicitWidth = 65
              ExplicitHeight = 65
            end
            object BtnEditarEmpresa: TSpeedButton
              Left = 0
              Top = 0
              Width = 161
              Height = 41
              Align = alClient
              Flat = True
              OnClick = BtnEditarEmpresaClick
              ExplicitTop = 16
            end
            object Label9: TLabel
              Left = 59
              Top = 11
              Width = 39
              Height = 20
              Caption = 'Editar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -15
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
          end
          object Panel7: TPanel
            Left = 24
            Top = 181
            Width = 161
            Height = 41
            BevelOuter = bvNone
            Caption = 'Panel5'
            ParentBackground = False
            TabOrder = 2
            object Shape3: TShape
              Left = 0
              Top = 0
              Width = 161
              Height = 41
              Align = alClient
              Brush.Color = 16741948
              Pen.Style = psInsideFrame
              Shape = stRoundRect
              ExplicitLeft = 24
              ExplicitTop = 16
              ExplicitWidth = 65
              ExplicitHeight = 65
            end
            object BtnExcluirEmpresa: TSpeedButton
              Left = 0
              Top = 0
              Width = 161
              Height = 41
              Align = alClient
              Flat = True
              OnClick = BtnExcluirEmpresaClick
              ExplicitTop = 16
            end
            object Label4: TLabel
              Left = 59
              Top = 11
              Width = 43
              Height = 20
              Caption = 'Excluir'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -15
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
          end
          object Panel9: TPanel
            Left = 24
            Top = 344
            Width = 161
            Height = 41
            BevelOuter = bvNone
            Caption = 'Panel5'
            ParentBackground = False
            TabOrder = 3
            object Label6: TLabel
              Left = 57
              Top = 18
              Width = 59
              Height = 20
              Caption = 'Atualizar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -15
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Shape5: TShape
              Left = 0
              Top = 0
              Width = 161
              Height = 41
              Align = alClient
              Brush.Color = 16741948
              Pen.Style = psInsideFrame
              Shape = stRoundRect
              ExplicitLeft = 24
              ExplicitTop = 16
              ExplicitWidth = 65
              ExplicitHeight = 65
            end
            object BtnFiltrarEmpresa: TSpeedButton
              Left = 0
              Top = 0
              Width = 161
              Height = 41
              Align = alClient
              Flat = True
              OnClick = BtnFiltrarEmpresaClick
              ExplicitTop = 16
            end
            object Label14: TLabel
              Left = 60
              Top = 10
              Width = 38
              Height = 20
              Caption = 'Filtrar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -15
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
          end
          object Panel8: TPanel
            Left = 24
            Top = 260
            Width = 161
            Height = 41
            BevelOuter = bvNone
            Caption = 'Panel5'
            ParentBackground = False
            TabOrder = 4
            object Label5: TLabel
              Left = 49
              Top = 10
              Width = 59
              Height = 20
              Caption = 'Atualizar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -15
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label7: TLabel
              Left = 65
              Top = 21
              Width = 59
              Height = 20
              Caption = 'Atualizar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -15
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label8: TLabel
              Left = 73
              Top = 21
              Width = 59
              Height = 20
              Caption = 'Atualizar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -15
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label10: TLabel
              Left = 89
              Top = 21
              Width = 59
              Height = 20
              Caption = 'Atualizar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -15
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label11: TLabel
              Left = 97
              Top = 21
              Width = 59
              Height = 20
              Caption = 'Atualizar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -15
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Shape4: TShape
              Left = 0
              Top = 0
              Width = 161
              Height = 41
              Align = alClient
              Brush.Color = 16741948
              Pen.Style = psInsideFrame
              Shape = stRoundRect
              ExplicitLeft = 24
              ExplicitTop = 16
              ExplicitWidth = 65
              ExplicitHeight = 65
            end
            object BtnAtualizarEmpresa: TSpeedButton
              Left = 0
              Top = 0
              Width = 161
              Height = 41
              Align = alClient
              Flat = True
              OnClick = BtnAtualizarEmpresaClick
              ExplicitTop = 16
            end
            object Label12: TLabel
              Left = 52
              Top = 10
              Width = 59
              Height = 20
              Caption = 'Atualizar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -15
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
          end
        end
        object edtPesquisar: TSearchBox
          Left = 77
          Top = 40
          Width = 372
          Height = 25
          Cursor = crIBeam
          BevelOuter = bvNone
          BorderStyle = bsNone
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 2
          TextHint = 'Pesquisar'
          Visible = False
          OnChange = edtPesquisarChange
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Pr'#233'dio'
        ImageIndex = 1
        object Panel11: TPanel
          Left = 3
          Top = 0
          Width = 1387
          Height = 737
          Caption = 'Panel10'
          Color = clGradientInactiveCaption
          ParentBackground = False
          TabOrder = 0
          object Shape8: TShape
            Left = 664
            Top = 264
            Width = 65
            Height = 65
          end
          object Shape10: TShape
            Left = 1064
            Top = 101
            Width = 233
            Height = 448
            Pen.Style = psClear
          end
          object Shape11: TShape
            Left = 76
            Top = 100
            Width = 949
            Height = 449
            Pen.Style = psClear
          end
          object PanelAddPredio: TPanel
            Left = 1
            Top = 566
            Width = 1385
            Height = 170
            Align = alBottom
            BevelOuter = bvNone
            Color = clMenu
            ParentBackground = False
            TabOrder = 0
            Visible = False
            object Label25: TLabel
              Left = 24
              Top = 19
              Width = 33
              Height = 15
              Caption = 'Nome'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label26: TLabel
              Left = 168
              Top = 19
              Width = 45
              Height = 15
              Caption = 'Situa'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label28: TLabel
              Left = 314
              Top = 19
              Width = 45
              Height = 15
              Caption = 'Telefone'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label29: TLabel
              Left = 588
              Top = 19
              Width = 20
              Height = 15
              Caption = 'Rua'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label30: TLabel
              Left = 452
              Top = 19
              Width = 21
              Height = 15
              Caption = 'CEP'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label31: TLabel
              Left = 741
              Top = 19
              Width = 44
              Height = 15
              Caption = 'N'#250'mero'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label32: TLabel
              Left = 887
              Top = 19
              Width = 31
              Height = 15
              Caption = 'Bairro'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label33: TLabel
              Left = 1032
              Top = 19
              Width = 37
              Height = 15
              Caption = 'Cidade'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label34: TLabel
              Left = 24
              Top = 74
              Width = 35
              Height = 15
              Caption = 'Estado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object EdtNamePredio: TEdit
              Left = 24
              Top = 40
              Width = 121
              Height = 28
              TabOrder = 0
            end
            object EditRuaPredio: TEdit
              Left = 588
              Top = 40
              Width = 121
              Height = 28
              TabOrder = 1
            end
            object EdtTelefonePredio: TMaskEdit
              Left = 314
              Top = 40
              Width = 117
              Height = 28
              EditMask = '(##)#####-####;1;_'
              MaxLength = 14
              TabOrder = 2
              Text = '(  )     -    '
            end
            object EdtCepPredio: TMaskEdit
              Left = 452
              Top = 40
              Width = 114
              Height = 28
              EditMask = '00000-999;1;_'
              MaxLength = 9
              TabOrder = 3
              Text = '     -   '
            end
            object EdtNumeroPredio: TEdit
              Left = 733
              Top = 40
              Width = 121
              Height = 28
              TabOrder = 4
            end
            object EdtBairroPredio: TEdit
              Left = 875
              Top = 40
              Width = 121
              Height = 28
              TabOrder = 5
            end
            object EdtCidadePredio: TEdit
              Left = 1024
              Top = 40
              Width = 121
              Height = 28
              TabOrder = 6
            end
            object EdtEstadoPredio: TEdit
              Left = 24
              Top = 96
              Width = 121
              Height = 28
              TabOrder = 7
            end
            object ComboBoxSituacao: TComboBox
              Left = 168
              Top = 40
              Width = 132
              Height = 28
              TabOrder = 8
              Items.Strings = (
                'Alugado'
                'Pr'#243'prio'
                'Cedido')
            end
            object BtnEnviarPredio: TButton
              Left = 1201
              Top = 70
              Width = 147
              Height = 33
              Caption = 'Enviar'
              TabOrder = 9
              Visible = False
              OnClick = BtnEnviarPredioClick
            end
            object BtnConfirmarEdPredio: TButton
              Left = 1201
              Top = 69
              Width = 147
              Height = 35
              Caption = 'Confirmar Altera'#231#227'o'
              TabOrder = 10
              Visible = False
              OnClick = BtnConfirmarEdPredioClick
            end
          end
          object Panel13: TPanel
            Left = 1076
            Top = 112
            Width = 209
            Height = 424
            BevelOuter = bvNone
            Color = clMenu
            ParentBackground = False
            TabOrder = 1
            object Panel14: TPanel
              Left = 24
              Top = 24
              Width = 161
              Height = 41
              BevelOuter = bvNone
              Caption = 'Panel5'
              ParentBackground = False
              TabOrder = 0
              object Shape12: TShape
                Left = 0
                Top = 0
                Width = 161
                Height = 41
                Align = alClient
                Brush.Color = 16741948
                Pen.Style = psInsideFrame
                Shape = stRoundRect
                ExplicitLeft = 24
                ExplicitTop = 16
                ExplicitWidth = 65
                ExplicitHeight = 65
              end
              object Label35: TLabel
                Left = 47
                Top = 10
                Width = 64
                Height = 20
                Caption = 'Adicionar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object BtnAdicionarPredio: TSpeedButton
                Left = 0
                Top = 0
                Width = 161
                Height = 41
                Align = alClient
                Flat = True
                OnClick = BtnAdicionarPredioClick
                ExplicitTop = 8
                ExplicitHeight = 33
              end
            end
            object Panel15: TPanel
              Left = 24
              Top = 102
              Width = 161
              Height = 41
              BevelOuter = bvNone
              Caption = 'Panel5'
              ParentBackground = False
              TabOrder = 1
              object Label36: TLabel
                Left = 60
                Top = 9
                Width = 39
                Height = 20
                Caption = 'Editar'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end
              object Label37: TLabel
                Left = 102
                Top = 21
                Width = 59
                Height = 20
                Caption = 'Atualizar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Shape13: TShape
                Left = 0
                Top = 0
                Width = 161
                Height = 41
                Align = alClient
                Brush.Color = 16741948
                Pen.Style = psInsideFrame
                Shape = stRoundRect
                ExplicitLeft = 24
                ExplicitTop = 16
                ExplicitWidth = 65
                ExplicitHeight = 65
              end
              object BtnEditarPredio: TSpeedButton
                Left = 0
                Top = 0
                Width = 161
                Height = 41
                Align = alClient
                Flat = True
                OnClick = BtnEditarPredioClick
                ExplicitTop = 16
              end
              object Label38: TLabel
                Left = 59
                Top = 11
                Width = 39
                Height = 20
                Caption = 'Editar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
            end
            object Panel16: TPanel
              Left = 24
              Top = 181
              Width = 161
              Height = 41
              BevelOuter = bvNone
              Caption = 'Panel5'
              ParentBackground = False
              TabOrder = 2
              object Shape14: TShape
                Left = 0
                Top = 0
                Width = 161
                Height = 41
                Align = alClient
                Brush.Color = 16741948
                Pen.Style = psInsideFrame
                Shape = stRoundRect
                ExplicitLeft = 24
                ExplicitTop = 16
                ExplicitWidth = 65
                ExplicitHeight = 65
              end
              object BtnExcluirPredio: TSpeedButton
                Left = 0
                Top = 0
                Width = 161
                Height = 41
                Align = alClient
                Flat = True
                OnClick = BtnExcluirPredioClick
                ExplicitTop = 16
              end
              object Label39: TLabel
                Left = 59
                Top = 11
                Width = 43
                Height = 20
                Caption = 'Excluir'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
            end
            object Panel17: TPanel
              Left = 24
              Top = 344
              Width = 161
              Height = 41
              BevelOuter = bvNone
              Caption = 'Panel5'
              ParentBackground = False
              TabOrder = 3
              object Label40: TLabel
                Left = 57
                Top = 18
                Width = 59
                Height = 20
                Caption = 'Atualizar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Shape15: TShape
                Left = 0
                Top = 0
                Width = 161
                Height = 41
                Align = alClient
                Brush.Color = 16741948
                Pen.Style = psInsideFrame
                Shape = stRoundRect
                ExplicitLeft = 24
                ExplicitTop = 16
                ExplicitWidth = 65
                ExplicitHeight = 65
              end
              object BtnFiltrarPredio: TSpeedButton
                Left = 0
                Top = 0
                Width = 161
                Height = 41
                Align = alClient
                Flat = True
                OnClick = BtnFiltrarPredioClick
                ExplicitTop = 16
              end
              object Label41: TLabel
                Left = 60
                Top = 10
                Width = 38
                Height = 20
                Caption = 'Filtrar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
            end
            object Panel18: TPanel
              Left = 24
              Top = 260
              Width = 161
              Height = 41
              BevelOuter = bvNone
              Caption = 'Panel5'
              ParentBackground = False
              TabOrder = 4
              object Label42: TLabel
                Left = 49
                Top = 10
                Width = 59
                Height = 20
                Caption = 'Atualizar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Label43: TLabel
                Left = 65
                Top = 21
                Width = 59
                Height = 20
                Caption = 'Atualizar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Label44: TLabel
                Left = 73
                Top = 21
                Width = 59
                Height = 20
                Caption = 'Atualizar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Label45: TLabel
                Left = 89
                Top = 21
                Width = 59
                Height = 20
                Caption = 'Atualizar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Label46: TLabel
                Left = 97
                Top = 21
                Width = 59
                Height = 20
                Caption = 'Atualizar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Shape16: TShape
                Left = 0
                Top = 0
                Width = 161
                Height = 41
                Align = alClient
                Brush.Color = 16741948
                Pen.Style = psInsideFrame
                Shape = stRoundRect
                ExplicitLeft = 24
                ExplicitTop = 16
                ExplicitWidth = 65
                ExplicitHeight = 65
              end
              object BtnAtualizarPredio: TSpeedButton
                Left = 0
                Top = 0
                Width = 161
                Height = 41
                Align = alClient
                Flat = True
                OnClick = BtnAtualizarPredioClick
                ExplicitTop = 16
              end
              object Label47: TLabel
                Left = 52
                Top = 10
                Width = 59
                Height = 20
                Caption = 'Atualizar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
            end
          end
          object Panel19: TPanel
            Left = 88
            Top = 112
            Width = 921
            Height = 424
            BevelOuter = bvNone
            Caption = 'Panel2'
            Color = clMenu
            ParentBackground = False
            TabOrder = 2
            object DBGridPredio: TDBGrid
              Left = 12
              Top = 16
              Width = 897
              Height = 393
              BorderStyle = bsNone
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -15
              TitleFont.Name = 'Segoe UI'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'id'
                  Title.Caption = '     ID'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'nome'
                  Title.Caption = '      Nome'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'situacao'
                  Title.Caption = '     Situa'#231#227'o'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'telefone'
                  Title.Caption = '     Telefone'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'cep'
                  Title.Caption = '        Cep'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'rua'
                  Title.Caption = '           Rua'
                  Width = 120
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'numero'
                  Title.Caption = ' N'#250'mero'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'bairro'
                  Title.Caption = '      Bairro'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'cidade'
                  Title.Caption = '     Cidade'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'estado'
                  Title.Caption = '      Estado'
                  Width = 100
                  Visible = True
                end>
            end
          end
          object edtPesquisarPredio: TSearchBox
            Left = 76
            Top = 39
            Width = 385
            Height = 28
            Cursor = crIBeam
            BevelOuter = bvNone
            BorderStyle = bsNone
            Ctl3D = True
            ParentCtl3D = False
            TabOrder = 3
            Text = 'Pesquisar'
            TextHint = 'Pesquisar'
            Visible = False
            OnChange = edtPesquisarPredioChange
          end
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'Sala'
        ImageIndex = 2
        object Panel3: TPanel
          Left = 3
          Top = -7
          Width = 1387
          Height = 738
          Caption = 'Panel10'
          Color = clGradientInactiveCaption
          ParentBackground = False
          TabOrder = 0
          object Shape17: TShape
            Left = 664
            Top = 264
            Width = 65
            Height = 65
          end
          object Shape18: TShape
            Left = 1064
            Top = 101
            Width = 233
            Height = 448
            Pen.Style = psClear
          end
          object Shape19: TShape
            Left = 76
            Top = 100
            Width = 949
            Height = 449
            Pen.Style = psClear
          end
          object Panel20: TPanel
            Left = 1076
            Top = 112
            Width = 209
            Height = 424
            BevelOuter = bvNone
            Color = clMenu
            ParentBackground = False
            TabOrder = 0
            object Panel21: TPanel
              Left = 24
              Top = 24
              Width = 161
              Height = 41
              BevelOuter = bvNone
              Caption = 'Panel5'
              ParentBackground = False
              TabOrder = 0
              object Shape20: TShape
                Left = 0
                Top = 0
                Width = 161
                Height = 41
                Align = alClient
                Brush.Color = 16741948
                Pen.Style = psInsideFrame
                Shape = stRoundRect
                ExplicitLeft = 24
                ExplicitTop = 16
                ExplicitWidth = 65
                ExplicitHeight = 65
              end
              object Label56: TLabel
                Left = 47
                Top = 10
                Width = 64
                Height = 20
                Caption = 'Adicionar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object BtnAdicionarSala: TSpeedButton
                Left = 0
                Top = 0
                Width = 161
                Height = 41
                Align = alClient
                Flat = True
                OnClick = BtnAdicionarSalaClick
                ExplicitTop = 8
                ExplicitHeight = 33
              end
            end
            object Panel22: TPanel
              Left = 24
              Top = 102
              Width = 161
              Height = 41
              BevelOuter = bvNone
              Caption = 'Panel5'
              ParentBackground = False
              TabOrder = 1
              object Label57: TLabel
                Left = 60
                Top = 9
                Width = 39
                Height = 20
                Caption = 'Editar'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end
              object Label58: TLabel
                Left = 102
                Top = 21
                Width = 59
                Height = 20
                Caption = 'Atualizar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Shape21: TShape
                Left = 0
                Top = 0
                Width = 161
                Height = 41
                Align = alClient
                Brush.Color = 16741948
                Pen.Style = psInsideFrame
                Shape = stRoundRect
                ExplicitLeft = 24
                ExplicitTop = 16
                ExplicitWidth = 65
                ExplicitHeight = 65
              end
              object BtnEditarSala: TSpeedButton
                Left = 0
                Top = 0
                Width = 161
                Height = 41
                Align = alClient
                Flat = True
                OnClick = BtnEditarSalaClick
                ExplicitTop = 16
              end
              object Label59: TLabel
                Left = 59
                Top = 11
                Width = 39
                Height = 20
                Caption = 'Editar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
            end
            object Panel23: TPanel
              Left = 24
              Top = 181
              Width = 161
              Height = 41
              BevelOuter = bvNone
              Caption = 'Panel5'
              ParentBackground = False
              TabOrder = 2
              object Shape22: TShape
                Left = 0
                Top = 0
                Width = 161
                Height = 41
                Align = alClient
                Brush.Color = 16741948
                Pen.Style = psInsideFrame
                Shape = stRoundRect
                ExplicitLeft = 24
                ExplicitTop = 16
                ExplicitWidth = 65
                ExplicitHeight = 65
              end
              object BtnExcluirSala: TSpeedButton
                Left = 0
                Top = 0
                Width = 161
                Height = 41
                Align = alClient
                Flat = True
                OnClick = BtnExcluirSalaClick
                ExplicitTop = 16
              end
              object Label60: TLabel
                Left = 59
                Top = 11
                Width = 43
                Height = 20
                Caption = 'Excluir'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
            end
            object Panel24: TPanel
              Left = 24
              Top = 344
              Width = 161
              Height = 41
              BevelOuter = bvNone
              Caption = 'Panel5'
              ParentBackground = False
              TabOrder = 3
              object Label61: TLabel
                Left = 57
                Top = 18
                Width = 59
                Height = 20
                Caption = 'Atualizar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Shape23: TShape
                Left = 0
                Top = 0
                Width = 161
                Height = 41
                Align = alClient
                Brush.Color = 16741948
                Pen.Style = psInsideFrame
                Shape = stRoundRect
                ExplicitLeft = 24
                ExplicitTop = 16
                ExplicitWidth = 65
                ExplicitHeight = 65
              end
              object BtnFiltrarSala: TSpeedButton
                Left = 0
                Top = 0
                Width = 161
                Height = 41
                Align = alClient
                Flat = True
                ExplicitTop = 16
              end
              object Label62: TLabel
                Left = 60
                Top = 10
                Width = 38
                Height = 20
                Caption = 'Filtrar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
            end
            object Panel25: TPanel
              Left = 24
              Top = 260
              Width = 161
              Height = 41
              BevelOuter = bvNone
              Caption = 'Panel5'
              ParentBackground = False
              TabOrder = 4
              object Label63: TLabel
                Left = 49
                Top = 10
                Width = 59
                Height = 20
                Caption = 'Atualizar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Label64: TLabel
                Left = 65
                Top = 21
                Width = 59
                Height = 20
                Caption = 'Atualizar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Label65: TLabel
                Left = 73
                Top = 21
                Width = 59
                Height = 20
                Caption = 'Atualizar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Label66: TLabel
                Left = 89
                Top = 21
                Width = 59
                Height = 20
                Caption = 'Atualizar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Label67: TLabel
                Left = 97
                Top = 21
                Width = 59
                Height = 20
                Caption = 'Atualizar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Shape24: TShape
                Left = 0
                Top = 0
                Width = 161
                Height = 41
                Align = alClient
                Brush.Color = 16741948
                Pen.Style = psInsideFrame
                Shape = stRoundRect
                ExplicitLeft = 24
                ExplicitTop = 16
                ExplicitWidth = 65
                ExplicitHeight = 65
              end
              object BtnAtualizarSala: TSpeedButton
                Left = 0
                Top = 0
                Width = 161
                Height = 41
                Align = alClient
                Flat = True
                OnClick = BtnAtualizarSalaClic
                ExplicitTop = 16
              end
              object Label68: TLabel
                Left = 52
                Top = 10
                Width = 59
                Height = 20
                Caption = 'Atualizar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
            end
          end
          object Panel26: TPanel
            Left = 88
            Top = 112
            Width = 921
            Height = 424
            BevelOuter = bvNone
            Caption = 'Panel2'
            Color = clMenu
            ParentBackground = False
            TabOrder = 1
            object DBGridSalas: TDBGrid
              Left = 12
              Top = 14
              Width = 897
              Height = 393
              BorderStyle = bsNone
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -15
              TitleFont.Name = 'Segoe UI'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'id'
                  Title.Caption = '     ID'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'nome'
                  Title.Caption = '      Nome'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'nome_predio'
                  Title.Caption = '      Predio'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'situacao'
                  Title.Caption = '     Situa'#231#227'o'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'tipo'
                  Title.Caption = '       Tipo'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'observacao'
                  Title.Caption = '                    Observa'#231#227'o'
                  Width = 250
                  Visible = True
                end>
            end
          end
          object EdtPesquisarSala: TSearchBox
            Left = 76
            Top = 39
            Width = 385
            Height = 28
            Cursor = crIBeam
            BevelOuter = bvNone
            BorderStyle = bsNone
            Ctl3D = True
            ParentCtl3D = False
            TabOrder = 2
            TextHint = 'Pesquisar'
            OnChange = EdtPesquisarSalaChange
          end
          object PanelAddSala: TPanel
            Left = 1
            Top = 567
            Width = 1385
            Height = 170
            Align = alBottom
            BevelOuter = bvNone
            Color = clMenu
            ParentBackground = False
            TabOrder = 3
            Visible = False
            object Label27: TLabel
              Left = 168
              Top = 51
              Width = 34
              Height = 15
              Caption = 'Pr'#233'dio'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label48: TLabel
              Left = 319
              Top = 51
              Width = 45
              Height = 15
              Caption = 'Situa'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label49: TLabel
              Left = 27
              Top = 51
              Width = 33
              Height = 15
              Caption = 'Nome'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label50: TLabel
              Left = 611
              Top = 51
              Width = 62
              Height = 15
              Caption = 'Observa'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label55: TLabel
              Left = 471
              Top = 51
              Width = 24
              Height = 15
              Caption = 'Tipo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object EdtSituacaoSala: TComboBox
              Left = 319
              Top = 72
              Width = 132
              Height = 28
              TabOrder = 0
              Items.Strings = (
                'Alugado'
                'Em reforma'
                '')
            end
            object ComboBox2: TComboBox
              Left = 168
              Top = 72
              Width = 132
              Height = 28
              TabOrder = 1
            end
            object EditNameSala: TEdit
              Left = 27
              Top = 72
              Width = 121
              Height = 28
              TabOrder = 2
            end
            object EdtObs: TEdit
              Left = 611
              Top = 72
              Width = 121
              Height = 28
              TabOrder = 3
            end
            object EdtTipoSala: TEdit
              Left = 471
              Top = 72
              Width = 121
              Height = 28
              TabOrder = 4
            end
            object BtnEnviarSala: TButton
              Left = 1196
              Top = 68
              Width = 162
              Height = 35
              Caption = 'Enviar'
              TabOrder = 5
              Visible = False
              OnClick = BtnEnviarSalaClick
            end
            object BtnConfirmarEdtSala: TButton
              Left = 1196
              Top = 67
              Width = 162
              Height = 34
              Caption = 'Confirmar Altera'#231#227'o'
              TabOrder = 6
              Visible = False
              OnClick = BtnConfirmarEdtSalaClick
            end
          end
        end
      end
      object TabSheet4: TTabSheet
        Caption = 'Patrimonio'
        ImageIndex = 3
        object Panel12: TPanel
          Left = 3
          Top = -8
          Width = 1387
          Height = 738
          Caption = 'Panel10'
          Color = clGradientInactiveCaption
          ParentBackground = False
          TabOrder = 0
          object Shape25: TShape
            Left = 664
            Top = 264
            Width = 65
            Height = 65
          end
          object Shape26: TShape
            Left = 1064
            Top = 101
            Width = 233
            Height = 448
            Pen.Style = psClear
          end
          object Shape27: TShape
            Left = 76
            Top = 100
            Width = 949
            Height = 449
            Pen.Style = psClear
          end
          object Panel27: TPanel
            Left = 1076
            Top = 112
            Width = 209
            Height = 424
            BevelOuter = bvNone
            Color = clMenu
            ParentBackground = False
            TabOrder = 0
            object Panel28: TPanel
              Left = 24
              Top = 24
              Width = 161
              Height = 41
              BevelOuter = bvNone
              Caption = 'Panel5'
              ParentBackground = False
              TabOrder = 0
              object Shape28: TShape
                Left = 0
                Top = 0
                Width = 161
                Height = 41
                Align = alClient
                Brush.Color = 16741948
                Pen.Style = psInsideFrame
                Shape = stRoundRect
                ExplicitLeft = 24
                ExplicitTop = 16
                ExplicitWidth = 65
                ExplicitHeight = 65
              end
              object Label51: TLabel
                Left = 47
                Top = 10
                Width = 64
                Height = 20
                Caption = 'Adicionar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object BtnAdicionarPatrimonio: TSpeedButton
                Left = 0
                Top = 0
                Width = 161
                Height = 41
                Align = alClient
                Flat = True
                OnClick = BtnAdicionarPatrimonioClick
                ExplicitTop = 8
                ExplicitHeight = 33
              end
            end
            object Panel29: TPanel
              Left = 24
              Top = 102
              Width = 161
              Height = 41
              BevelOuter = bvNone
              Caption = 'Panel5'
              ParentBackground = False
              TabOrder = 1
              object Label52: TLabel
                Left = 60
                Top = 9
                Width = 39
                Height = 20
                Caption = 'Editar'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end
              object Label53: TLabel
                Left = 102
                Top = 21
                Width = 59
                Height = 20
                Caption = 'Atualizar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Shape29: TShape
                Left = 0
                Top = 0
                Width = 161
                Height = 41
                Align = alClient
                Brush.Color = 16741948
                Pen.Style = psInsideFrame
                Shape = stRoundRect
                ExplicitLeft = 24
                ExplicitTop = 16
                ExplicitWidth = 65
                ExplicitHeight = 65
              end
              object SpeedButton2: TSpeedButton
                Left = 0
                Top = 0
                Width = 161
                Height = 41
                Align = alClient
                Flat = True
                ExplicitTop = 16
              end
              object Label54: TLabel
                Left = 59
                Top = 11
                Width = 39
                Height = 20
                Caption = 'Editar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
            end
            object Panel30: TPanel
              Left = 24
              Top = 181
              Width = 161
              Height = 41
              BevelOuter = bvNone
              Caption = 'Panel5'
              ParentBackground = False
              TabOrder = 2
              object Shape30: TShape
                Left = 0
                Top = 0
                Width = 161
                Height = 41
                Align = alClient
                Brush.Color = 16741948
                Pen.Style = psInsideFrame
                Shape = stRoundRect
                ExplicitLeft = 24
                ExplicitTop = 16
                ExplicitWidth = 65
                ExplicitHeight = 65
              end
              object SpeedButton3: TSpeedButton
                Left = 0
                Top = 0
                Width = 161
                Height = 41
                Align = alClient
                Flat = True
                ExplicitTop = 16
              end
              object Label69: TLabel
                Left = 59
                Top = 11
                Width = 43
                Height = 20
                Caption = 'Excluir'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
            end
            object Panel31: TPanel
              Left = 24
              Top = 344
              Width = 161
              Height = 41
              BevelOuter = bvNone
              Caption = 'Panel5'
              ParentBackground = False
              TabOrder = 3
              object Label70: TLabel
                Left = 57
                Top = 18
                Width = 59
                Height = 20
                Caption = 'Atualizar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Shape31: TShape
                Left = 0
                Top = 0
                Width = 161
                Height = 41
                Align = alClient
                Brush.Color = 16741948
                Pen.Style = psInsideFrame
                Shape = stRoundRect
                ExplicitLeft = 24
                ExplicitTop = 16
                ExplicitWidth = 65
                ExplicitHeight = 65
              end
              object SpeedButton4: TSpeedButton
                Left = 0
                Top = 0
                Width = 161
                Height = 41
                Align = alClient
                Flat = True
                ExplicitTop = 16
              end
              object Label71: TLabel
                Left = 60
                Top = 10
                Width = 38
                Height = 20
                Caption = 'Filtrar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
            end
            object Panel32: TPanel
              Left = 24
              Top = 260
              Width = 161
              Height = 41
              BevelOuter = bvNone
              Caption = 'Panel5'
              ParentBackground = False
              TabOrder = 4
              object Label72: TLabel
                Left = 49
                Top = 10
                Width = 59
                Height = 20
                Caption = 'Atualizar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Label73: TLabel
                Left = 65
                Top = 21
                Width = 59
                Height = 20
                Caption = 'Atualizar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Label74: TLabel
                Left = 73
                Top = 21
                Width = 59
                Height = 20
                Caption = 'Atualizar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Label75: TLabel
                Left = 89
                Top = 21
                Width = 59
                Height = 20
                Caption = 'Atualizar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Label76: TLabel
                Left = 97
                Top = 21
                Width = 59
                Height = 20
                Caption = 'Atualizar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Shape32: TShape
                Left = 0
                Top = 0
                Width = 161
                Height = 41
                Align = alClient
                Brush.Color = 16741948
                Pen.Style = psInsideFrame
                Shape = stRoundRect
                ExplicitLeft = 24
                ExplicitTop = 16
                ExplicitWidth = 65
                ExplicitHeight = 65
              end
              object SpeedButton5: TSpeedButton
                Left = 0
                Top = 0
                Width = 161
                Height = 41
                Align = alClient
                Flat = True
                ExplicitTop = 16
              end
              object Label77: TLabel
                Left = 52
                Top = 10
                Width = 59
                Height = 20
                Caption = 'Atualizar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
            end
          end
          object Panel33: TPanel
            Left = 88
            Top = 112
            Width = 921
            Height = 424
            BevelOuter = bvNone
            Caption = 'Panel2'
            Color = clMenu
            ParentBackground = False
            TabOrder = 1
            object DBGridPatrimonio: TDBGrid
              Left = 12
              Top = 14
              Width = 897
              Height = 393
              BorderStyle = bsNone
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -15
              TitleFont.Name = 'Segoe UI'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'id'
                  Title.Caption = '     ID'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'nome'
                  Title.Caption = '      Nome'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'nome_predio'
                  Title.Caption = '      Predio'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'situacao'
                  Title.Caption = '     Situa'#231#227'o'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'tipo'
                  Title.Caption = '       Tipo'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'valor_aquisicao'
                  Title.Caption = '   Valor de Aquisi'#231#227'o'
                  Width = 150
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'valor_atual'
                  Title.Caption = '   Valor Atual'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'quantidade'
                  Title.Caption = '  Quantidade'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'numero_serie'
                  Title.Caption = '  N'#250'mero de S'#233'rie'
                  Width = 130
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'modelo'
                  Title.Caption = '     Modelo'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'data_aquisicao'
                  Title.Caption = '  Data de Aquisi'#231#227'o'
                  Width = 140
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'fk_id_salas'
                  Title.Caption = 'Sala'
                  Visible = True
                end>
            end
          end
          object SearchBox1: TSearchBox
            Left = 76
            Top = 39
            Width = 385
            Height = 28
            Cursor = crIBeam
            BevelOuter = bvNone
            BorderStyle = bsNone
            Ctl3D = True
            ParentCtl3D = False
            TabOrder = 2
            TextHint = 'Pesquisar'
          end
          object Panel34: TPanel
            Left = 1
            Top = 567
            Width = 1385
            Height = 170
            Align = alBottom
            BevelOuter = bvNone
            Color = clMenu
            ParentBackground = False
            TabOrder = 3
            Visible = False
            ExplicitLeft = 2
            object Label79: TLabel
              Left = 319
              Top = 35
              Width = 45
              Height = 15
              Caption = 'Situa'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label80: TLabel
              Left = 27
              Top = 35
              Width = 33
              Height = 15
              Caption = 'Nome'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label82: TLabel
              Left = 175
              Top = 35
              Width = 24
              Height = 15
              Caption = 'Tipo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label78: TLabel
              Left = 735
              Top = 35
              Width = 62
              Height = 15
              Caption = 'Quantidade'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label83: TLabel
              Left = 887
              Top = 35
              Width = 87
              Height = 15
              Caption = 'N'#250'mero de s'#233'rie'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label84: TLabel
              Left = 27
              Top = 91
              Width = 41
              Height = 15
              Caption = 'Modelo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label81: TLabel
              Left = 475
              Top = 35
              Width = 95
              Height = 15
              Caption = 'Valor de aquisi'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label85: TLabel
              Left = 597
              Top = 35
              Width = 55
              Height = 15
              Caption = 'Valor atual'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label86: TLabel
              Left = 175
              Top = 90
              Width = 93
              Height = 15
              Caption = 'Data de aquisi'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label87: TLabel
              Left = 319
              Top = 91
              Width = 21
              Height = 15
              Caption = 'Sala'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object CBSituacaoPatri: TComboBox
              Left = 319
              Top = 56
              Width = 132
              Height = 28
              TabOrder = 0
              Items.Strings = (
                'Alugado'
                'Em reforma'
                '')
            end
            object EditNomePatri: TEdit
              Left = 27
              Top = 56
              Width = 121
              Height = 28
              TabOrder = 1
            end
            object EdtTipoPatri: TEdit
              Left = 175
              Top = 56
              Width = 121
              Height = 28
              TabOrder = 2
            end
            object BtnEnviarPatrimonio: TButton
              Left = 1159
              Top = 71
              Width = 162
              Height = 32
              Caption = 'Enviar'
              TabOrder = 3
              Visible = False
              OnClick = Button1Click
            end
            object EdtVAQPatri: TMaskEdit
              Left = 475
              Top = 56
              Width = 102
              Height = 28
              EditMask = 'R$999,999.99;1;_'
              MaxLength = 12
              TabOrder = 4
              Text = 'R$   ,   .  '
            end
            object EdtQuantiPatri: TEdit
              Left = 735
              Top = 56
              Width = 121
              Height = 28
              TabOrder = 5
            end
            object EdtNS: TEdit
              Left = 887
              Top = 56
              Width = 121
              Height = 28
              TabOrder = 6
            end
            object EdtModelo: TEdit
              Left = 27
              Top = 112
              Width = 121
              Height = 28
              TabOrder = 7
            end
            object EdtVAPatri: TMaskEdit
              Left = 597
              Top = 56
              Width = 111
              Height = 28
              EditMask = 'R$999,999.99;1;_'
              MaxLength = 12
              TabOrder = 8
              Text = 'R$   ,   .  '
            end
            object EdtDAPatri: TMaskEdit
              Left = 175
              Top = 112
              Width = 120
              Height = 28
              EditMask = '!99/99/0000;1;_'
              MaxLength = 10
              TabOrder = 9
              Text = '  /  /    '
            end
            object ComboBoxPatrimonio: TComboBox
              Left = 319
              Top = 112
              Width = 132
              Height = 28
              TabOrder = 10
            end
            object BtnConfirmarEdPatri: TButton
              Left = 1159
              Top = 73
              Width = 162
              Height = 32
              Caption = 'Confirmar Altera'#231#227'o'
              TabOrder = 11
              Visible = False
              OnClick = BtnConfirmarEdPatriClick
            end
          end
        end
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 65
      Width = 1390
      Height = 1
      TabOrder = 1
    end
  end
  object DataSEmpresa: TDataSource
    Left = 1005
    Top = 140
  end
end
