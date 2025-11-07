object FormCadastro: TFormCadastro
  Left = 266
  Top = 104
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'FormCadastro'
  ClientHeight = 872
  ClientWidth = 1348
  Color = clBtnFace
  Constraints.MaxHeight = 911
  Constraints.MaxWidth = 1390
  Constraints.MinHeight = 911
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'B '
  Font.Style = []
  Position = poDesigned
  OnShow = FormShow
  TextHeight = 15
  object PanelCadastro: TPanel
    Left = -8
    Top = -5
    Width = 1390
    Height = 857
    Color = clHighlight
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Consolas'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 50
      Top = 28
      Width = 69
      Height = 21
      Caption = 'Cadastros'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnFace
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Panel1: TPanel
      Left = 473
      Top = 67
      Width = 1390
      Height = 1
      TabOrder = 0
    end
    object PageControl1: TPageControl
      Left = 6
      Top = 65
      Width = 1398
      Height = 806
      ActivePage = TabSheet1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabHeight = 50
      TabOrder = 1
      TabWidth = 207
      OnChange = PageControl1Change
      object TabSheet1: TTabSheet
        ParentCustomHint = False
        Caption = 'Empresa'
        DoubleBuffered = False
        Constraints.MaxHeight = 900
        Constraints.MinWidth = 900
        ParentDoubleBuffered = False
        ParentShowHint = False
        ShowHint = False
        object Panel10: TPanel
          Left = 0
          Top = -16
          Width = 1387
          Height = 746
          Caption = 'Panel10'
          Color = clWhite
          ParentBackground = False
          TabOrder = 2
          object Shape6: TShape
            Left = 664
            Top = 264
            Width = 65
            Height = 65
          end
          object Label15: TLabel
            Left = 47
            Top = 75
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
            Left = 187
            Top = 75
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
            Left = 325
            Top = 75
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
            Left = 47
            Top = 139
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
            Left = 325
            Top = 139
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
            Left = 187
            Top = 139
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
            Left = 48
            Top = 208
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
            Left = 187
            Top = 208
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
            Left = 325
            Top = 208
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
            Left = 48
            Top = 274
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
          object EditBairro: TEdit
            Left = 187
            Top = 229
            Width = 115
            Height = 28
            TabOrder = 0
          end
          object EditCep: TMaskEdit
            Left = 187
            Top = 160
            Width = 115
            Height = 28
            EditMask = '00000-999;1;_'
            MaxLength = 9
            TabOrder = 1
            Text = '     -   '
            OnExit = EditCepExit
          end
          object EditCidade: TEdit
            Left = 325
            Top = 229
            Width = 115
            Height = 28
            TabOrder = 2
          end
          object EditCnpj: TMaskEdit
            Left = 325
            Top = 96
            Width = 114
            Height = 28
            EditMask = '##.###.###/####-##;1;_'
            MaxLength = 18
            TabOrder = 3
            Text = '  .   .   /    -  '
          end
          object EditEstado: TEdit
            Left = 47
            Top = 295
            Width = 115
            Height = 28
            TabOrder = 4
          end
          object EditFantasia: TEdit
            Left = 187
            Top = 96
            Width = 115
            Height = 28
            TabOrder = 5
          end
          object EditNumero: TEdit
            Left = 47
            Top = 229
            Width = 115
            Height = 28
            TabOrder = 6
          end
          object EditRazao: TEdit
            Left = 47
            Top = 96
            Width = 115
            Height = 28
            TabOrder = 7
          end
          object EditRua: TEdit
            Left = 325
            Top = 160
            Width = 115
            Height = 28
            TabOrder = 8
          end
          object EditTelefone: TMaskEdit
            Left = 47
            Top = 160
            Width = 115
            Height = 28
            EditMask = '(##)#####-####;1;_'
            MaxLength = 14
            TabOrder = 9
            Text = '(  )     -    '
          end
          object BtnConfirmarEd: TButton
            Left = 163
            Top = 405
            Width = 151
            Height = 28
            Caption = 'Confirmar altera'#231#227'o'
            TabOrder = 10
            OnClick = BtnConfirmarEdClick
          end
          object BtnEnviar: TButton
            Left = 163
            Top = 401
            Width = 151
            Height = 37
            Caption = 'Enviar'
            TabOrder = 11
            OnClick = BtnEnviarClick
          end
          object Panel5: TPanel
            Left = 511
            Top = 551
            Width = 135
            Height = 40
            BevelOuter = bvNone
            Caption = 'Panel5'
            ParentBackground = False
            TabOrder = 12
            object Shape1: TShape
              Left = 0
              Top = 0
              Width = 135
              Height = 40
              Align = alClient
              Brush.Color = 16741948
              Pen.Style = psInsideFrame
              Shape = stRoundRect
              ExplicitTop = 8
              ExplicitWidth = 145
              ExplicitHeight = 41
            end
            object BtnAdicionarEmpresa: TSpeedButton
              Left = 0
              Top = 0
              Width = 135
              Height = 40
              Align = alClient
              Flat = True
              OnClick = BtnAdicionarEmpresaClick
              ExplicitTop = 8
              ExplicitWidth = 161
              ExplicitHeight = 33
            end
            object Label2: TLabel
              Left = 39
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
          end
          object Panel6: TPanel
            Left = 673
            Top = 551
            Width = 135
            Height = 41
            BevelOuter = bvNone
            Caption = 'Panel5'
            ParentBackground = False
            TabOrder = 13
            object Shape2: TShape
              Left = 0
              Top = 0
              Width = 135
              Height = 41
              Align = alClient
              Brush.Color = 16741948
              Pen.Style = psInsideFrame
              Shape = stRoundRect
              ExplicitTop = 8
              ExplicitWidth = 145
            end
            object BtnEditarEmpresa: TSpeedButton
              Left = 0
              Top = 0
              Width = 135
              Height = 41
              Align = alClient
              Flat = True
              OnClick = BtnEditarEmpresaClick
              ExplicitTop = 16
              ExplicitWidth = 161
            end
            object Label3: TLabel
              Left = 49
              Top = 10
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
          end
          object Panel7: TPanel
            Left = 840
            Top = 551
            Width = 135
            Height = 41
            BevelOuter = bvNone
            Caption = 'Panel5'
            ParentBackground = False
            TabOrder = 14
            object Shape3: TShape
              Left = 0
              Top = 0
              Width = 135
              Height = 41
              Align = alClient
              Brush.Color = 16741948
              Pen.Style = psInsideFrame
              Shape = stRoundRect
              ExplicitTop = 8
              ExplicitWidth = 145
            end
            object BtnExcluirEmpresa: TSpeedButton
              Left = 0
              Top = 0
              Width = 135
              Height = 41
              Align = alClient
              Flat = True
              OnClick = BtnExcluirEmpresaClick
              ExplicitLeft = 9
              ExplicitTop = 1
              ExplicitWidth = 161
            end
            object Label4: TLabel
              Left = 48
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
          object Panel8: TPanel
            Left = 1006
            Top = 551
            Width = 135
            Height = 41
            BevelOuter = bvNone
            Caption = 'Panel5'
            ParentBackground = False
            TabOrder = 15
            object Shape4: TShape
              Left = 0
              Top = 0
              Width = 135
              Height = 41
              Align = alClient
              Brush.Color = 16741948
              Pen.Style = psInsideFrame
              Shape = stRoundRect
              ExplicitTop = 8
              ExplicitWidth = 145
            end
            object BtnAtualizarEmpresa: TSpeedButton
              Left = 0
              Top = 0
              Width = 135
              Height = 41
              Align = alClient
              Flat = True
              OnClick = BtnAtualizarEmpresaClick
              ExplicitTop = 16
              ExplicitWidth = 161
            end
            object Label12: TLabel
              Left = 41
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
          object Panel9: TPanel
            Left = 1170
            Top = 551
            Width = 135
            Height = 41
            BevelOuter = bvNone
            Caption = 'Panel5'
            ParentBackground = False
            TabOrder = 16
            object Shape5: TShape
              Left = 0
              Top = 0
              Width = 135
              Height = 41
              Align = alClient
              Brush.Color = 16741948
              Pen.Style = psInsideFrame
              Shape = stRoundRect
              ExplicitTop = 8
              ExplicitWidth = 145
            end
            object BtnFiltrarEmpresa: TSpeedButton
              Left = 0
              Top = 0
              Width = 135
              Height = 41
              Align = alClient
              Flat = True
              OnClick = BtnFiltrarEmpresaClick
              ExplicitTop = 16
              ExplicitWidth = 161
            end
            object Label14: TLabel
              Left = 50
              Top = 11
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
          object Panel4: TPanel
            Left = 476
            Top = -72
            Width = 1
            Height = 810
            Color = clSilver
            ParentBackground = False
            TabOrder = 17
          end
        end
        object Panel2: TPanel
          Left = 511
          Top = 91
          Width = 794
          Height = 428
          BevelOuter = bvNone
          Caption = 'Panel2'
          Color = 10066329
          ParentBackground = False
          TabOrder = 0
          object DBGrid1: TDBGrid
            Left = 2
            Top = 2
            Width = 790
            Height = 424
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
        object edtPesquisar: TSearchBox
          Left = 511
          Top = 25
          Width = 372
          Height = 33
          Cursor = crIBeam
          BevelOuter = bvNone
          BorderStyle = bsNone
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 1
          TextHint = 'Pesquisar'
          Visible = False
          OnChange = edtPesquisarChange
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Pr'#233'dio'
        ImageIndex = 1
        object Panel11: TPanel
          Left = 0
          Top = 0
          Width = 1394
          Height = 743
          Caption = 'Panel10'
          Color = clWhite
          ParentBackground = False
          TabOrder = 0
          object Shape8: TShape
            Left = 664
            Top = 264
            Width = 65
            Height = 65
          end
          object Label25: TLabel
            Left = 50
            Top = 46
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
            Left = 195
            Top = 46
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
            Left = 361
            Top = 46
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
            Left = 195
            Top = 107
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
            Left = 50
            Top = 107
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
            Left = 362
            Top = 107
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
            Left = 50
            Top = 181
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
            Left = 195
            Top = 181
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
            Left = 362
            Top = 181
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
          object Panel19: TPanel
            Left = 560
            Top = 107
            Width = 774
            Height = 421
            BevelOuter = bvNone
            Caption = 'Panel2'
            Color = 10066329
            ParentBackground = False
            TabOrder = 0
            object DBGridPredio: TDBGrid
              Left = 2
              Top = 2
              Width = 770
              Height = 417
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
            Left = 560
            Top = 39
            Width = 385
            Height = 28
            Cursor = crIBeam
            BevelOuter = bvNone
            BorderStyle = bsNone
            Ctl3D = True
            ParentCtl3D = False
            TabOrder = 1
            TextHint = 'Pesquisar'
            Visible = False
            OnChange = edtPesquisarPredioChange
          end
          object ComboBoxSituacao: TComboBox
            Left = 195
            Top = 67
            Width = 129
            Height = 28
            TabOrder = 2
            Items.Strings = (
              'Alugado'
              'Pr'#243'prio'
              'Cedido')
          end
          object EditRuaPredio: TEdit
            Left = 195
            Top = 128
            Width = 129
            Height = 28
            TabOrder = 3
          end
          object EdtBairroPredio: TEdit
            Left = 50
            Top = 202
            Width = 116
            Height = 28
            TabOrder = 4
          end
          object EdtCepPredio: TMaskEdit
            Left = 50
            Top = 128
            Width = 117
            Height = 28
            EditMask = '00000-999;1;_'
            MaxLength = 9
            TabOrder = 5
            Text = '     -   '
            OnExit = EdtCepPredioExit
          end
          object EdtCidadePredio: TEdit
            Left = 195
            Top = 202
            Width = 129
            Height = 28
            TabOrder = 6
          end
          object EdtEstadoPredio: TEdit
            Left = 362
            Top = 202
            Width = 117
            Height = 28
            TabOrder = 7
          end
          object EdtNamePredio: TEdit
            Left = 49
            Top = 67
            Width = 117
            Height = 28
            TabOrder = 8
          end
          object EdtNumeroPredio: TEdit
            Left = 362
            Top = 128
            Width = 117
            Height = 28
            TabOrder = 9
          end
          object EdtTelefonePredio: TMaskEdit
            Left = 362
            Top = 67
            Width = 117
            Height = 28
            EditMask = '(##)#####-####;1;_'
            MaxLength = 14
            TabOrder = 10
            Text = '(  )     -    '
          end
          object Panel14: TPanel
            Left = 560
            Top = 560
            Width = 135
            Height = 41
            BevelOuter = bvNone
            Caption = 'Panel5'
            ParentBackground = False
            TabOrder = 11
            object Shape10: TShape
              Left = 0
              Top = 0
              Width = 135
              Height = 41
              Align = alClient
              Brush.Color = 16741948
              Pen.Style = psInsideFrame
              Shape = stRoundRect
              ExplicitTop = 8
              ExplicitWidth = 145
            end
            object BtnAdicionarPredio: TSpeedButton
              Left = 0
              Top = 0
              Width = 135
              Height = 41
              Align = alClient
              Flat = True
              OnClick = BtnAdicionarPredioClick
              ExplicitWidth = 13
            end
            object Label35: TLabel
              Left = 37
              Top = 11
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
          end
          object Panel15: TPanel
            Left = 720
            Top = 560
            Width = 135
            Height = 41
            BevelOuter = bvNone
            Caption = 'Panel5'
            ParentBackground = False
            TabOrder = 12
            object Shape11: TShape
              Left = 0
              Top = 0
              Width = 135
              Height = 41
              Align = alClient
              Brush.Color = 16741948
              Pen.Style = psInsideFrame
              Shape = stRoundRect
              ExplicitTop = 8
              ExplicitWidth = 145
            end
            object BtnEditarPredio: TSpeedButton
              Left = 0
              Top = 0
              Width = 135
              Height = 41
              Align = alClient
              Flat = True
              OnClick = BtnEditarPredioClick
              ExplicitLeft = -8
              ExplicitWidth = 161
            end
            object Label38: TLabel
              Left = 51
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
            Left = 880
            Top = 560
            Width = 135
            Height = 41
            BevelOuter = bvNone
            Caption = 'Panel5'
            ParentBackground = False
            TabOrder = 13
            object Shape12: TShape
              Left = 0
              Top = 0
              Width = 135
              Height = 41
              Align = alClient
              Brush.Color = 16741948
              Pen.Style = psInsideFrame
              Shape = stRoundRect
              ExplicitTop = 8
              ExplicitWidth = 145
            end
            object BtnExcluirPredio: TSpeedButton
              Left = 0
              Top = 0
              Width = 135
              Height = 41
              Align = alClient
              Flat = True
              OnClick = BtnExcluirPredioClick
            end
            object Label39: TLabel
              Left = 48
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
          object Panel18: TPanel
            Left = 1040
            Top = 560
            Width = 135
            Height = 41
            BevelOuter = bvNone
            Caption = 'Panel5'
            ParentBackground = False
            TabOrder = 14
            object Shape13: TShape
              Left = 0
              Top = 0
              Width = 135
              Height = 41
              Align = alClient
              Brush.Color = 16741948
              Pen.Style = psInsideFrame
              Shape = stRoundRect
              ExplicitTop = 8
              ExplicitWidth = 145
            end
            object BtnAtualizarPredio: TSpeedButton
              Left = 0
              Top = 0
              Width = 135
              Height = 41
              Align = alClient
              Flat = True
              OnClick = BtnAtualizarPredioClick
              ExplicitLeft = -8
            end
            object Label42: TLabel
              Left = 41
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
          object Panel17: TPanel
            Left = 1199
            Top = 560
            Width = 135
            Height = 41
            BevelOuter = bvNone
            Caption = 'Panel5'
            ParentBackground = False
            TabOrder = 15
            object Shape15: TShape
              Left = 0
              Top = 0
              Width = 135
              Height = 41
              Align = alClient
              Brush.Color = 16741948
              Pen.Style = psInsideFrame
              Shape = stRoundRect
              ExplicitTop = 8
              ExplicitWidth = 145
            end
            object BtnFiltrarPredio: TSpeedButton
              Left = 0
              Top = 0
              Width = 135
              Height = 41
              Align = alClient
              Flat = True
              OnClick = BtnFiltrarPredioClick
              ExplicitLeft = -16
            end
            object Label41: TLabel
              Left = 52
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
          object BtnConfirmarEdPredio: TButton
            Left = 195
            Top = 331
            Width = 158
            Height = 35
            Caption = 'Confirmar Altera'#231#227'o'
            TabOrder = 16
            Visible = False
            OnClick = BtnConfirmarEdPredioClick
          end
          object BtnEnviarPredio: TButton
            Left = 195
            Top = 332
            Width = 158
            Height = 33
            Caption = 'Enviar'
            TabOrder = 17
            Visible = False
            OnClick = BtnEnviarPredioClick
          end
          object Panel13: TPanel
            Left = 516
            Top = -67
            Width = 1
            Height = 810
            Color = clSilver
            ParentBackground = False
            TabOrder = 18
          end
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'Sala'
        ImageIndex = 2
        object Panel3: TPanel
          Left = -7
          Top = 0
          Width = 1387
          Height = 738
          Caption = 'Panel10'
          Color = clWhite
          ParentBackground = False
          TabOrder = 0
          object Shape17: TShape
            Left = 664
            Top = 264
            Width = 65
            Height = 65
          end
          object Label27: TLabel
            Left = 184
            Top = 91
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
            Left = 335
            Top = 91
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
            Left = 43
            Top = 91
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
            Left = 184
            Top = 171
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
            Left = 43
            Top = 171
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
          object Panel26: TPanel
            Left = 540
            Top = 118
            Width = 803
            Height = 424
            BevelOuter = bvNone
            Caption = 'Panel2'
            Color = 10066329
            ParentBackground = False
            TabOrder = 0
            object DBGridSalas: TDBGrid
              Left = 2
              Top = 2
              Width = 799
              Height = 420
              BorderStyle = bsNone
              GradientEndColor = clSkyBlue
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
            Left = 540
            Top = 55
            Width = 385
            Height = 28
            Cursor = crIBeam
            BevelOuter = bvNone
            BorderStyle = bsNone
            Ctl3D = True
            ParentCtl3D = False
            TabOrder = 1
            TextHint = 'Pesquisar'
            OnChange = EdtPesquisarSalaChange
          end
          object ComboBox2: TComboBox
            Left = 184
            Top = 116
            Width = 132
            Height = 28
            TabOrder = 2
          end
          object EditNameSala: TEdit
            Left = 43
            Top = 116
            Width = 121
            Height = 28
            TabOrder = 3
            OnChange = EditNameSalaChange
          end
          object EdtObs: TEdit
            Left = 184
            Top = 192
            Width = 121
            Height = 28
            TabOrder = 4
          end
          object EdtSituacaoSala: TComboBox
            Left = 335
            Top = 116
            Width = 132
            Height = 28
            TabOrder = 5
            Items.Strings = (
              'Alugado'
              'Em reforma'
              '')
          end
          object EdtTipoSala: TEdit
            Left = 43
            Top = 192
            Width = 121
            Height = 28
            TabOrder = 6
          end
          object BtnConfirmarEdtSala: TButton
            Left = 169
            Top = 314
            Width = 162
            Height = 34
            Caption = 'Confirmar Altera'#231#227'o'
            TabOrder = 7
            Visible = False
            OnClick = BtnConfirmarEdtSalaClick
          end
          object BtnEnviarSala: TButton
            Left = 169
            Top = 314
            Width = 162
            Height = 35
            Caption = 'Enviar'
            TabOrder = 8
            Visible = False
            OnClick = BtnEnviarSalaClick
          end
          object Panel21: TPanel
            Left = 540
            Top = 569
            Width = 141
            Height = 41
            BevelOuter = bvNone
            Caption = 'Panel5'
            ParentBackground = False
            TabOrder = 9
            object Shape18: TShape
              Left = 0
              Top = 0
              Width = 141
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
            object BtnAdicionarSala: TSpeedButton
              Left = 0
              Top = 0
              Width = 141
              Height = 41
              Align = alClient
              Flat = True
              OnClick = BtnAdicionarSalaClick
              ExplicitWidth = 137
            end
            object Label56: TLabel
              Left = 40
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
          end
          object Panel22: TPanel
            Left = 712
            Top = 569
            Width = 137
            Height = 41
            BevelOuter = bvNone
            Caption = 'Panel5'
            ParentBackground = False
            TabOrder = 10
            object Shape19: TShape
              Left = 0
              Top = 0
              Width = 137
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
              Width = 137
              Height = 41
              Align = alClient
              Flat = True
              OnClick = BtnEditarSalaClick
              ExplicitTop = 8
              ExplicitWidth = 161
            end
            object Label59: TLabel
              Left = 51
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
            Left = 876
            Top = 569
            Width = 137
            Height = 41
            BevelOuter = bvNone
            Caption = 'Panel5'
            ParentBackground = False
            TabOrder = 11
            object Shape20: TShape
              Left = 0
              Top = 0
              Width = 137
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
              Width = 137
              Height = 41
              Align = alClient
              Flat = True
              OnClick = BtnExcluirSalaClick
              ExplicitTop = 16
              ExplicitWidth = 161
            end
            object Label60: TLabel
              Left = 49
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
            Left = 1206
            Top = 569
            Width = 137
            Height = 41
            BevelOuter = bvNone
            Caption = 'Panel5'
            ParentBackground = False
            TabOrder = 12
            object Shape22: TShape
              Left = 0
              Top = 0
              Width = 137
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
              Width = 137
              Height = 41
              Align = alClient
              Flat = True
              OnClick = BtnFiltrarSalaClick
              ExplicitTop = 16
              ExplicitWidth = 161
            end
            object Label62: TLabel
              Left = 52
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
            Left = 1040
            Top = 569
            Width = 137
            Height = 41
            BevelOuter = bvNone
            Caption = 'Panel5'
            ParentBackground = False
            TabOrder = 13
            object Shape21: TShape
              Left = 0
              Top = 0
              Width = 137
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
              Width = 137
              Height = 41
              Align = alClient
              Flat = True
              OnClick = BtnAtualizarSalaClick
              ExplicitLeft = 8
              ExplicitTop = 8
              ExplicitWidth = 23
              ExplicitHeight = 22
            end
            object Label63: TLabel
              Left = 41
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
          object Panel20: TPanel
            Left = 508
            Top = -72
            Width = 1
            Height = 810
            Color = clSilver
            ParentBackground = False
            TabOrder = 14
          end
        end
      end
      object TabSheet4: TTabSheet
        Caption = 'Patrimonio'
        ImageIndex = 3
        object Panel12: TPanel
          Left = -23
          Top = -8
          Width = 1387
          Height = 738
          BorderStyle = bsSingle
          Caption = 'Panel10'
          Color = clWhite
          ParentBackground = False
          TabOrder = 0
          object Label80: TLabel
            Left = 43
            Top = 43
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
            Left = 189
            Top = 43
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
          object Label79: TLabel
            Left = 336
            Top = 43
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
          object Label81: TLabel
            Left = 43
            Top = 107
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
            Left = 189
            Top = 107
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
          object Label84: TLabel
            Left = 340
            Top = 107
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
          object Label86: TLabel
            Left = 45
            Top = 171
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
            Left = 189
            Top = 171
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
          object Label83: TLabel
            Left = 336
            Top = 171
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
          object Panel33: TPanel
            Left = 544
            Top = 97
            Width = 804
            Height = 413
            BevelOuter = bvNone
            Caption = 'Panel2'
            Color = 10066329
            ParentBackground = False
            TabOrder = 0
            object DBGridPatrimonio: TDBGrid
              Left = 2
              Top = 2
              Width = 800
              Height = 409
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
            Left = 544
            Top = 36
            Width = 385
            Height = 28
            Cursor = crIBeam
            BevelOuter = bvNone
            BorderStyle = bsNone
            Ctl3D = True
            ParentCtl3D = False
            TabOrder = 1
            TextHint = 'Pesquisar'
            OnChange = SearchBox1Change
          end
          object EditNomePatri: TEdit
            Left = 43
            Top = 64
            Width = 121
            Height = 28
            TabOrder = 2
          end
          object EdtTipoPatri: TEdit
            Left = 189
            Top = 64
            Width = 121
            Height = 28
            TabOrder = 3
          end
          object CbSituacaoPatri: TComboBox
            Left = 336
            Top = 64
            Width = 129
            Height = 28
            TabOrder = 4
          end
          object EdtVAQPatri: TMaskEdit
            Left = 43
            Top = 128
            Width = 121
            Height = 28
            EditMask = 'R$999,999.99;1;_'
            MaxLength = 12
            TabOrder = 5
            Text = 'R$   ,   .  '
          end
          object EdtVAPatri: TMaskEdit
            Left = 189
            Top = 128
            Width = 121
            Height = 28
            EditMask = 'R$999,999.99;1;_'
            MaxLength = 12
            TabOrder = 6
            Text = 'R$   ,   .  '
          end
          object EdtModelo: TEdit
            Left = 336
            Top = 128
            Width = 129
            Height = 28
            TabOrder = 7
          end
          object EdtDAPatri: TMaskEdit
            Left = 44
            Top = 192
            Width = 120
            Height = 28
            EditMask = '!99/99/0000;1;_'
            MaxLength = 10
            TabOrder = 8
            Text = '  /  /    '
          end
          object ComboBoxPatrimonio: TComboBox
            Left = 189
            Top = 192
            Width = 121
            Height = 28
            TabOrder = 9
          end
          object EdtNS: TEdit
            Left = 336
            Top = 192
            Width = 129
            Height = 28
            TabOrder = 10
          end
          object BtnConfirmarEdPatri: TButton
            Left = 167
            Top = 288
            Width = 162
            Height = 32
            Caption = 'Confirmar Altera'#231#227'o'
            TabOrder = 11
            Visible = False
            OnClick = BtnConfirmarEdPatriClick
          end
          object BtnEnviarPatrimonio: TButton
            Left = 167
            Top = 288
            Width = 162
            Height = 32
            Caption = 'Enviar'
            TabOrder = 12
            Visible = False
            OnClick = BtnEnviarPatrimonioClick
          end
          object Panel30: TPanel
            Left = 712
            Top = 535
            Width = 145
            Height = 41
            BevelOuter = bvNone
            Caption = 'Panel5'
            ParentBackground = False
            TabOrder = 13
            object Shape27: TShape
              Left = 0
              Top = 0
              Width = 145
              Height = 41
              Align = alClient
              Brush.Color = 16741948
              Pen.Style = psInsideFrame
              Shape = stRoundRect
              ExplicitTop = 8
            end
            object SpeedButton3: TSpeedButton
              Left = 0
              Top = 0
              Width = 145
              Height = 41
              Align = alClient
              Flat = True
              OnClick = SpeedButton3Click
              ExplicitLeft = 8
              ExplicitWidth = 161
            end
            object Label69: TLabel
              Left = 52
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
          object Panel32: TPanel
            Left = 1208
            Top = 535
            Width = 140
            Height = 41
            BevelOuter = bvNone
            Caption = 'Panel5'
            ParentBackground = False
            TabOrder = 14
            object Shape29: TShape
              Left = 0
              Top = 0
              Width = 140
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
              Width = 140
              Height = 41
              Align = alClient
              Flat = True
              OnClick = SpeedButton5Click
              ExplicitLeft = 24
              ExplicitWidth = 137
            end
            object Label72: TLabel
              Left = 44
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
          object Panel31: TPanel
            Left = 1049
            Top = 535
            Width = 136
            Height = 41
            BevelOuter = bvNone
            Caption = 'Panel5'
            ParentBackground = False
            TabOrder = 15
            object Shape25: TShape
              Left = 0
              Top = 0
              Width = 136
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
              Width = 136
              Height = 41
              Align = alClient
              Flat = True
              OnClick = SpeedButton4Click
              ExplicitWidth = 130
            end
            object Label70: TLabel
              Left = 51
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
          object Panel28: TPanel
            Left = 544
            Top = 536
            Width = 145
            Height = 41
            BevelOuter = bvNone
            Caption = 'Panel5'
            ParentBackground = False
            TabOrder = 16
            object Shape28: TShape
              Left = 0
              Top = 0
              Width = 145
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
            object BtnAdicionarPatrimonio: TSpeedButton
              Left = 0
              Top = 0
              Width = 145
              Height = 41
              Align = alClient
              Flat = True
              OnClick = BtnAdicionarPatrimonioClick
              ExplicitLeft = 72
              ExplicitTop = 8
              ExplicitWidth = 23
              ExplicitHeight = 22
            end
            object Label51: TLabel
              Left = 42
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
          end
          object Panel29: TPanel
            Left = 880
            Top = 535
            Width = 145
            Height = 41
            BevelOuter = bvNone
            Caption = 'Panel5'
            ParentBackground = False
            TabOrder = 17
            object Shape26: TShape
              Left = 0
              Top = 0
              Width = 145
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
            object BtnEditarPatrimonio: TSpeedButton
              Left = 0
              Top = 0
              Width = 145
              Height = 41
              Align = alClient
              Flat = True
              OnClick = BtnEditarPatrimonioClick
              ExplicitTop = 16
              ExplicitWidth = 23
              ExplicitHeight = 22
            end
            object Label52: TLabel
              Left = 53
              Top = 11
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
          end
          object Panel27: TPanel
            Left = 508
            Top = -61
            Width = 1
            Height = 810
            Color = clSilver
            ParentBackground = False
            TabOrder = 18
          end
          object Panel38: TPanel
            Left = 712
            Top = 632
            Width = 145
            Height = 41
            BevelOuter = bvNone
            Caption = 'Panel5'
            ParentBackground = False
            TabOrder = 19
            object Shape31: TShape
              Left = 0
              Top = 0
              Width = 145
              Height = 41
              Align = alClient
              Brush.Color = 16741948
              Pen.Style = psInsideFrame
              Shape = stRoundRect
              ExplicitTop = 8
            end
            object SpeedButton1: TSpeedButton
              Left = 0
              Top = 0
              Width = 145
              Height = 41
              Align = alClient
              Flat = True
              OnClick = SpeedButton1Click
              ExplicitTop = 8
            end
            object Label90: TLabel
              Left = 33
              Top = 10
              Width = 82
              Height = 20
              Caption = 'Modelo CSV'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -15
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
          end
          object Panel37: TPanel
            Left = 544
            Top = 632
            Width = 145
            Height = 41
            BevelOuter = bvNone
            Caption = 'Panel5'
            ParentBackground = False
            TabOrder = 20
            object Shape30: TShape
              Left = 0
              Top = 0
              Width = 145
              Height = 41
              Align = alClient
              Brush.Color = 16741948
              Pen.Style = psInsideFrame
              Shape = stRoundRect
              ExplicitTop = 8
            end
            object SpeedButton6: TSpeedButton
              Left = 0
              Top = 0
              Width = 145
              Height = 41
              Align = alClient
              Flat = True
              OnClick = SpeedButton6Click
              ExplicitLeft = 40
              ExplicitTop = 8
              ExplicitWidth = 23
              ExplicitHeight = 22
            end
            object Label88: TLabel
              Left = 29
              Top = 10
              Width = 88
              Height = 20
              Caption = 'Importar CSV'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -15
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
          end
        end
      end
    end
  end
  object DataSEmpresa: TDataSource
    Left = 1261
    Top = 140
  end
end
