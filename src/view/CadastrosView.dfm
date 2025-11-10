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
      Top = 67
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
          Left = -7
          Top = 0
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
            Left = 187
            Top = 331
            Width = 158
            Height = 35
            Caption = 'Confirmar Altera'#231#227'o'
            TabOrder = 16
            Visible = False
            OnClick = BtnConfirmarEdPredioClick
          end
          object BtnEnviarPredio: TButton
            Left = 187
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
          Left = -23
          Top = 3
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
          object Image1: TImage
            Left = 18
            Top = 280
            Width = 449
            Height = 502
            Picture.Data = {
              0D54536B537667477261706869633C3F786D6C2076657273696F6E3D22312E30
              2220656E636F64696E673D225554462D38223F3E0A3C7376672076657273696F
              6E3D22312E312220786D6C6E733D22687474703A2F2F7777772E77332E6F7267
              2F323030302F737667222077696474683D223130323422206865696768743D22
              31303234223E0A3C7061746820643D224D30203020433333372E393220302036
              37352E3834203020313032342030204331303234203333372E39322031303234
              203637352E38342031303234203130323420433638362E303820313032342033
              34382E3136203130323420302031303234204330203638362E30382030203334
              382E313620302030205A20222066696C6C3D222346454645464522207472616E
              73666F726D3D227472616E736C61746528302C3029222F3E0A3C706174682064
              3D224D3020302043302E363834373333383920302E333036373936383720312E
              333639343637373720302E363133353933373520322E30373439353131372030
              2E393239363837352043332E393632383833363820312E373839353234303120
              352E373931333539323420322E373138303538353820372E36323520332E3638
              37352043382E323437363137313920342E303037383332303320382E38373032
              3334333720342E333238313634303620392E353131373138373520342E363538
              3230333132204331312E303131373134333620352E3433313237373738203132
              2E353036343733373120362E323134343939383620313420372043313420372E
              363620313420382E33322031342039204331332E333537383835373420392E33
              3330393636382031322E373135373731343820392E3636313933333539203132
              2E30353431393932322031302E303032393239363920432D302E323339373137
              30372031362E3334373437323533202D31322E34393131383938372032322E37
              35303136303139202D32342E36313739313939322032392E3430393432333833
              20432D33302E36303132333335362033322E3639353032313331202D33362E36
              303438333638322033352E393339373138202D34322E36323235353835392033
              392E313631383635323320432D35322E38353533333933372034342E36343330
              31323238202D36332E30323033373634312035302E3232313930333736202D37
              332E31303734323138382035352E393636373936383820432D38302E32323634
              3936362036302E3031363034343732202D38372E33393138333731372036332E
              3937363333303739202D39342E35373236393238372036372E39313433393831
              3920432D3130372E31373136323937372037342E3832363633383536202D3131
              392E36323035323339372038312E3936313838393736202D3133322E30303738
              3132352038392E323438303436383820432D3133372E32313736373630332039
              322E3239383436393538202D3134322E34353339393238372039352E33303238
              383734202D3134372E363837352039382E3331323520432D3135382E37373138
              37353338203130342E3639323030323731202D3136392E383131303038303120
              3131312E3134363530323436202D3138302E38333437313638203131372E3633
              30313236393520432D3138312E3433333031383034203131372E393831373534
              202D3138322E3033313331393237203131382E3333333338313034202D313832
              2E3634373735303835203131382E363935363633343520432D3138342E323733
              33323636203131392E3635313137343035202D3138352E383938333938393420
              3132302E3630373534303934202D3138372E35323334333735203132312E3536
              33393634383420432D3138382E3939333036343633203132322E343136313238
              3337202D3139302E3438303532393934203132332E3234303236343937202D31
              39322031323420432D313932203133362E3231202D313932203134382E343220
              2D3139322031363120432D3139302E3335203136312E3636202D3138382E3720
              3136322E3332202D3138372031363320432D3138352E31373530363831392031
              36332E3935323139202D3138332E3336353937383937203136342E3933353131
              343133202D3138312E35373033313235203136352E393431343036323520432D
              3138302E3533353735393238203136362E3532303139353331202D3137392E35
              30313230363035203136372E3039383938343337202D3137382E343335333032
              3733203136372E3639353331323520432D3137372E3334323930323833203136
              382E3331313438343337202D3137362E3235303530323933203136382E393237
              3635363235202D3137352E313235203136392E3536323520432D3137332E3939
              343537323735203137302E3139383030373831202D3137322E38363431343535
              31203137302E3833333531353633202D3137312E363939343632383920313731
              2E343838323831323520432D3136352E33323333393739203137352E30383535
              32373938202D3135382E3938373731353331203137382E373333323530313520
              2D3135322E3733323636363032203138322E353336363231303920432D313433
              2E3934333538343131203138372E3837373635303631202D3133352E30323534
              36373937203139332E3030323030373633202D3132362E313336323330343720
              3139382E313733383238313220432D3132332E3130303931323132203139392E
              3934313234303635202D3132302E3036373631343939203230312E3731323036
              313332202D3131372E3033353135363235203230332E34383433373520432D31
              30352E3430343135383132203231302E3238313035303433202D39332E373533
              3132383635203231372E3034313831383737202D38322E303738363133323820
              3232332E373633343237373320432D38312E3036373832373135203232342E33
              34353532303032202D38302E3035373034313032203232342E39323736313233
              202D37392E303135363235203232352E353237333433373520432D37382E3032
              343938303437203232362E3039313739313939202D37372E3033343333353934
              203232362E3635363234303233202D37362E3031333637313838203232372E32
              3337373932393720432D37332E3932323239323731203232382E343630373030
              3834202D37312E3835373034343633203232392E3732383937353637202D3639
              2E3831343435333132203233312E303331373338323820432D36382E37373734
              30323334203233312E3638323535333731202D36372E37343033353135362032
              33322E3333333336393134202D36362E363731383735203233332E3030333930
              36323520432D36352E3734393837333035203233332E3630313436373239202D
              36342E3832373837313039203233342E3139393032383332202D36332E383737
              3932393639203233342E383134363937323720432D35392E3533393034393532
              203233362E3630313730363336202D35362E3331343238383036203233352E39
              313037363031202D35312E3939373136313837203233342E3231313830373235
              20432D34392E3734333533303336203233332E3139323339373236202D34372E
              35333834333939203233322E3130323237353039202D34352E33333230333132
              35203233302E39383433373520432D34342E3039343536313436203233302E33
              37323931333734202D34342E3039343536313436203233302E33373239313337
              34202D34322E3833323039323239203232392E373439303939373320432D3431
              2E3036373935333134203232382E38373633333236202D33392E333035393439
              3634203232372E3939393233373438202D33372E353435393238393620323237
              2E313138313934353820432D33322E3934313233313638203232342E38313333
              35323538202D32382E3332313239303733203232322E3533393431393232202D
              32332E373033313235203232302E323631373138373520432D32322E37383633
              32343632203231392E38303834383734202D32312E3836393532343233203231
              392E3335353235363034202D32302E3932343934323032203231382E38383832
              3930343120432D31312E3933373637303239203231342E343533393639393220
              2D322E3836363337383433203231302E323230343530393720362E3234343837
              333035203230362E3034373835313536204331312E3931313434343235203230
              332E34343939303934372031372E3530393633343836203230302E3737343031
              3133312032332E3034313235393737203139372E383938313933333620433235
              20313937203235203139372032372031393720433237203138362E3737203237
              203137362E353420323720313636204332352E3638203136352E36372032342E
              3336203136352E333420323320313635204332302E3831383636363132203136
              332E39333638363334322031382E3636323830333639203136322E3832313032
              3736312031362E35323334333735203136312E3637353738313235204331352E
              3838393332343439203136312E33333738323533322031352E32353532313134
              39203136302E39393938363933382031342E3630313838323933203136302E36
              35313637323336204331322E3532333937323734203135392E35343238323732
              332031302E3434393439313537203135382E343237373235383220382E333735
              203135372E333132352043362E3932383938333431203135362E353339323734
              3720352E3438323737333637203135352E373636343130343920342E30333633
              37363935203135342E393933383936343820432D302E33313235383431362031
              35322E3636393039393934202D342E3635373032333938203135302E33333539
              35343931202D392031343820432D392E3633323930393535203134372E363539
              3630363933202D31302E3236353831393039203134372E333139323133383720
              2D31302E3931373930373731203134362E393638353035383620432D31352E39
              36323933313737203134342E32353434383433202D32312E3030353939373837
              203134312E3533363833363137202D32362E30343830393537203133382E3831
              37333832383120432D34312E3138303138363438203133302E36363030313032
              39202D35362E3432343830343338203132322E3732353131343238202D37312E
              3639393935313137203131342E383339353939363120432D37382E3035383039
              303831203131312E3535373232303634202D38342E3431323336393134203130
              382E3236373830353732202D39302E37353738313235203130342E3936303933
              373520432D39322E3030373739313737203130342E3331303138313534202D39
              332E3235373739313433203130332E3635393436343733202D39342E35303738
              313235203130332E303038373839303620432D39362E38373631373439332031
              30312E3737353937393735202D39392E3234333131333133203130302E353430
              3536303236202D3130312E3630393337352039392E333033373130393420432D
              3130322E36363839383433382039382E3735323331343435202D3130332E3732
              3835393337352039382E3230303931373937202D3130342E3832303331323520
              39372E3633323831323520432D3130352E37353131373637362039372E313436
              3939373037202D3130362E36383230343130322039362E363631313831363420
              2D3130372E36343131313332382039362E313630363434353320432D3131302E
              30353732323639352039342E3930353837363032202D3131302E303537323236
              39352039342E3930353837363032202D31313320393420432D3131332039332E
              3334202D3131332039322E3638202D31313320393220432D3131312E34383134
              343533312039302E3836313831363431202D3131312E34383134343533312039
              302E3836313831363431202D3130392E3332383132352038392E363031353632
              3520432D3130382E35323836363435352038392E3132383331353433202D3130
              372E373239323034312038382E3635353036383336202D3130362E3930353531
              3735382038382E313637343830343720432D3130362E30323931393637382038
              372E3635383436313931202D3130352E31353238373539382038372E31343934
              34333336202D3130342E32352038362E36323520432D3130322E343034383135
              34322038352E3533363638323935202D3130302E35353937363730382038342E
              3434383133343837202D39382E37313438343337352038332E33353933373520
              432D39372E37363436343335352038322E3830313835353437202D39362E3831
              3434343333362038322E3234343333353934202D39352E383335343439323220
              38312E363639393231383820432D39322E33313138313935322037392E353934
              3639393938202D38382E38303737333834322037372E3438383132333132202D
              38352E33303534313939322037352E333737313937323720432D38312E323039
              31363539362037322E3930383835343234202D37372E31303431393332203730
              2E3435353131303131202D373320363820432D37312E39363430373731352036
              372E3337383539313331202D37312E39363430373731352036372E3337383539
              313331202D37302E39303732323635362036362E373434363238393120432D36
              302E353132313832342036302E3531383239373934202D34392E393535333138
              33342035342E3630313031313036202D33392E33353130373432322034382E37
              3339303133363720432D33322E30363030323934362034342E37303736393436
              36202D32342E38303133333039382034302E3632343234393731202D31372E35
              3632352033362E3520432D382E37313631323336362033312E34373037373137
              3320302E32313437373138342032362E363131323937383720392E3138373520
              32312E383132352043392E38303138303837382032312E343833393530322031
              302E34313631313735352032312E31353534303033392031312E303439303431
              37352032302E3831363839343533204331342E36393436363432362031382E38
              3638393937312031382E33343131353939362031362E39323239363531342032
              32203135204332322E36373435383235322031342E3538373039373137203233
              2E33343931363530342031342E31373431393433342032342E30343431383934
              352031332E37343837373933204332372E33303034333433362031322E353032
              31333035352032392E36363031333632372031332E3433333236353439203332
              2E37383939343735312031342E37353731313036204333342E39323639353237
              322031352E37343135323830322033372E30333634363432362031362E373731
              34373731322033392E31343435333132352031372E3831363430363235204333
              392E39313433313830382031382E31393233323430372034302E363834313034
              39322031382E35363832343138382034312E34373732313836332031382E3935
              353535313135204334332E39323530313039392032302E313532343438313920
              34362E333638373636332032312E33353733343134312034382E383132352032
              322E35363235204335302E34373536353131362032332E333737343834353320
              35322E31333930353938392032342E31393139343336362035332E3830323733
              3433382032352E3030353835393338204335372E38373134393838362032362E
              39393738333134322036312E39333636363236392032382E3939363938323037
              203636203331204336352033342036352033342036332E303239303532373320
              33352E3232333338383637204336322E31373235353132372033352E36313736
              3030312036312E333136303439382033362E30313138313135322036302E3433
              3335393337352033362E3431373936383735204335392E343731333038353920
              33362E38363834393630392035382E35303930323334342033372E3331393032
              3334342035372E35313735373831322033372E3738333230333132204335352E
              39393239333934352033382E34373833333030382035352E3939323933393435
              2033382E34373833333030382035342E343337352033392E3138373520433532
              2E34373730333934322034302E303935383737352035302E3531373432323632
              2034312E30303630373739362034382E35353835393337352034312E39313739
              36383735204334362E39393230323032362034322E3634373035343434203436
              2E39393230323032362034322E36343730353434342034352E33393337393838
              332034332E3339303836393134204333382E38373338313632342034362E3438
              3232343432342033322E343338323936342034392E3734323731303739203236
              203533204332352E33313037323431382035332E33343834353937382032342E
              36323134343833362035332E36393639313935362032332E3931313238353420
              35342E303535393338373220432D372E38323932333732342036392E36363435
              36383131202D372E38323932333732342036392E3636343536383131202D3338
              20383820432D33352E32333733343135392039302E3137323031323933202D33
              322E34373831303530352039312E3839363431363234202D32392E3335313536
              32352039332E343936303933373520432D32382E34343031393533312039332E
              3936353935373033202D32372E35323838323831332039342E34333538323033
              31202D32362E35383938343337352039342E393139393231383820432D32352E
              36313134343533312039352E3432303732323636202D32342E36333330343638
              372039352E3932313532333434202D32332E3632352039362E3433373520432D
              31352E3639363436393132203130302E3533313734313336202D372E38313834
              32333833203130342E36393932323834382030203130392043372E3435323638
              373838203131332E30393437373334332031342E393530323432323620313137
              2E30383731323835312032322E3520313231204333322E393731373438373220
              3132362E34333232363937352034332E3335353430343132203133322E303039
              39333338362035332E3637333832383132203133372E37323830323733342043
              35352E3730303533383935203133382E38333632353138382035372E37343032
              38373536203133392E393035373439352035392E373936383735203134302E39
              35373033313235204336362E3931323435353232203134342E37333630373639
              362037312E3230313531313538203134382E3835383035303431203735203135
              36204337352E3439383833363938203135362E393230343538362037352E3439
              383833363938203135362E393230343538362037362E30303737353134362031
              35372E3835393531323333204337392E3036383730363435203136342E303039
              35333633342037392E3533363933333433203136392E31333938383434312037
              392E333930363235203137352E3934313430363235204337392E333834393635
              3231203137362E39343936383937392037392E3337393330353432203137372E
              39353739373333332037392E3337333437343132203137382E39393638313039
              31204337392E33353132363039203138322E31383538373733362037392E3330
              3130393238203138352E33373337373838362037392E3235203138382E353632
              35204337392E3232393931353535203139302E37333736313338372037392E32
              313136363832203139322E39313237343535322037392E313935333132352031
              39352E3038373839303632204337392E31353134343539203230302E33393233
              313738392037392E3038343638363839203230352E3639363037353638203739
              20323131204337312E3633313932353936203231352E31303633333932332036
              342E3137393330333334203231382E39343031333032382035362E3536323520
              3232322E35363235204335352E3438333233323432203232332E303737383833
              332035342E3430333936343834203232332E353933323636362035332E323931
              3939323139203232342E3132343236373538204334302E353733363139333620
              3233302E31383039343032342032372E3739333431303833203233362E313033
              393133303620313520323432204331342E3239393635363337203234322E3332
              3238393030312031332E3539393331323734203234322E363435373830303320
              31322E3837373734363538203234322E393738343534353920432D312E323135
              39393238203234392E3437353734363438202D312E3231353939323820323439
              2E3437353734363438202D372E3837383137333833203235322E353139353331
              323520432D392E3434343836363636203235332E3233353538343233202D3131
              2E3031313531373032203235332E3935313733303135202D31322E3537383132
              35203235342E363637393638373520432D31332E373432313130363720323535
              2E32303031313439202D31332E3734323131303637203235352E323030313134
              39202D31342E3932393631313231203235352E373433303131343720432D3139
              2E3638323632333337203235372E3932313534383537202D32342E3431373630
              313531203236302E31333438383731202D32392E313430373932383520323632
              2E333737333139333420432D33322E3137383239343932203236332E38313732
              33303038202D33352E3232323531393337203236352E3234323535353931202D
              33382E3236373733303731203236362E363636303736363620432D33392E3730
              323033383738203236372E3334313238303132202D34312E3133333130303737
              203236382E3032333432373235202D34322E3536303633383433203236382E37
              3132383239353920432D34342E3533313231353734203236392E363633373630
              3131202D34362E3531313730333932203237302E3539303034323037202D3438
              2E3439363039333735203237312E353131373138373520432D35302E31363934
              39383239203237322E3330373735353133202D35302E31363934393832392032
              37322E3330373735353133202D35312E3837363730383938203237332E313139
              383733303520432D35372E3435393231333038203237342E3639323939333239
              202D36312E3636393432333036203237312E3739343830373632202D36362E35
              33353135363235203236392E3136343036323520432D36372E35383032363336
              37203236382E3630303930333332202D36382E3632353337313039203236382E
              3033373734343134202D36392E3730323134383434203236372E343537353139
              353320432D37302E3831313036343435203236362E3835323738383039202D37
              312E3931393938303437203236362E3234383035363634202D37332E30363235
              203236352E36323520432D37342E3233353932343134203236342E3938393237
              353733202D37352E3430393432373837203236342E3335333639383333202D37
              362E3538333030373831203236332E373138323631373220432D38342E333732
              3339393931203235392E3438383737323838202D39322E303735353833342032
              35352E3131393735363232202D39392E3734363832363137203235302E363739
              393331363420432D3130382E3030333037393436203234352E39333332363732
              31202D3131362E3431313934353235203234312E3438333935303833202D3132
              342E3832373339323538203233372E303238393330363620432D3133342E3134
              333631383336203233322E30393430393832202D3134332E3336343033353436
              203232372E3032323931363039202D3135322E3531393034323937203232312E
              373933323132383920432D3135392E3632303036343932203231372E37343834
              31333837202D3136362E3739333733353433203231332E383533373733343320
              2D3137342032313020432D3138342E31373931353633203230342E3535313930
              353438202D3139342E3236373033303735203139382E39363631323035202D32
              30342E32383930363235203139332E32333433373520432D3230382E32373538
              303337203139302E3935393030383633202D3231322E32393239373739203138
              382E3735313937313435202D3231362E33333539333735203138362E35373831
              323520432D3231372E38393838383535203138352E37323634393738202D3231
              372E38393838383535203138352E37323634393738202D3231392E3439333430
              3832203138342E383537363636303220432D3232312E34373633323635203138
              332E3737383538333638202D3232332E3436363635323433203138322E373132
              3935343934202D3232352E3436353537363137203138312E3636333831383336
              20432D3233332E3837323531383639203137372E3035303335333335202D3233
              392E3736373133383438203137302E3531333738303437202D3234322E353537
              32303532203136312E313234393534323220432D3234332E3034313433303038
              203135382E3830313137383733202D3234332E3139313634353231203135362E
              3632333131343836202D3234332E32373232313638203135342E323530373332
              343220432D3234332E3330343431383138203135332E3331323633323239202D
              3234332E3333363631393537203135322E3337343533323137202D3234332E33
              36393739363735203135312E343038303034373620432D3234332E3438313038
              373439203134372E3133303631333134202D3234332E35363237353933322031
              34322E3835333333353236202D3234332E3632343735353836203133382E3537
              34393531313720432D3234332E36363634393432203133362E33323135363831
              31202D3234332E3732373933373431203133342E3036383436313634202D3234
              332E3830393332363137203133312E383136313632313120432D3234342E3437
              303038343036203131332E3231323736323136202D3234342E34373030383430
              36203131332E3231323736323136202D3234312E303936343335353520313038
              2E313334373635363220432D3233382E3436353839303133203130362E323436
              3838363236202D3233362E3032353637393633203130352E3133363032323336
              202D3233332031303420432D3233312E3239393336323037203130332E303434
              3139383032202D3232392E3631303430353532203130322E3036373332323537
              202D3232372E3933333539333735203130312E3037303331323520432D323236
              2E3130353538363435203130302E3038313036393437202D3232342E32373333
              313036362039392E3039393638353433202D3232322E343337352039382E3132
              3520432D3232302E39303831343831392039372E3330353838313335202D3232
              302E39303831343831392039372E3330353838313335202D3231392E33343739
              303033392039362E343730323134383420432D3231352E393034383936203934
              2E3633343733303435202D3231322E34353435323436312039322E3831333637
              313338202D32303920393120432D3230382E33373531323639352039302E3637
              313737323436202D3230372E37353032353339312039302E3334333534343932
              202D3230372E31303634343533312039302E303035333731303920432D313738
              2E36313338333339332037352E3035353732313334202D3134392E3730343431
              3932322036312E3039323334303932202D3132302E3438393235373831203437
              2E363133373639353320432D3131352E31393934383534372034352E31363732
              36383333202D3130392E39323032383037352034322E3639383237383837202D
              3130342E36343038333836322034302E323239353833373420432D39392E3439
              3035343035382033372E3832323238323938202D39342E333337343336343420
              33352E3432303938393036202D38392E31383437353334322033332E30313837
              3938383320432D38362E38373537313435322033312E3934323034323933202D
              38342E35363730303935362033302E38363435373239202D38322E3235383330
              3037382032392E373837313039333820432D37322E3738383032383337203235
              2E3336393339393131202D36332E33303737383937392032302E393734343731
              3335202D35332E38313231303332372031362E3631313633333320432D34382E
              363130353031332031342E3231373535343933202D34332E3432383432383231
              2031312E3738363239373234202D33382E323538373238303320392E33323431
              32373220432D33342E393831303539333120372E3736393536323836202D3331
              2E363931383835303220362E3234303536333837202D32382E33393937313932
              3420342E373136393739393820432D32362E383539343432353820332E393937
              33343232202D32352E333234323032353620332E3236363830393431202D3233
              2E3739343631363720322E353234373139323420432D382E3838353439343135
              202D342E3639363238353738202D382E3838353439343135202D342E36393632
              3835373820302030205A20222066696C6C3D222345444545454522207472616E
              73666F726D3D227472616E736C617465283339362C33353529222F3E0A3C7061
              746820643D224D3020302043302E373539343939353120302E33353537383132
              3520312E353138393939303220302E3731313536323520322E33303135313336
              3720312E3037383132352043342E393332343530303620322E33383039373138
              3620372E353632303339333620332E36383631343232392031302E3138373520
              35204331312E363632333438363320352E37333830323835362031312E363632
              333438363320352E37333830323835362031332E313636393932313920362E34
              393039363638204331392E383234303038333720392E38343639353230352032
              362E33373739313231332031332E33343532333836322033322E383639383733
              30352031372E3030383738393036204334302E37373539333432352032312E34
              363636303133352034382E3738313232312032352E3733363938303732203536
              2E37393139393231392033302E3030333137333833204336322E353835303138
              35392033332E31303331343633382036382E323634343334322033362E333231
              32333233332037332E38373734343134312033392E3733353833393834204337
              362E33333633343938372034312E32303033323433322037382E383437343733
              32392034322E34373132373834312038312E343337352034332E363837352043
              38352E33353533393533362034352E35383737303437392038392E3130373734
              3234342034372E363237313532342039322E38343736353632352034392E3835
              39333735204339332E3639373232392035302E33363530393033332039342E35
              343638303137362035302E38373038303536362039352E343232313139313420
              35312E33393138343537204339372E31323137373636312035322E3431303933
              3139332039382E38313531383831322035332E3434303531383838203130302E
              35303137303839382035342E343831323031313720433130312E323834383935
              30322035342E3935303137383232203130322E30363830383130352035352E34
              31393135353237203130322E3837352035352E39303233343337352043313033
              2E35373336373138382035362E3333303233313933203130342E323732333433
              37352035362E3735383132303132203130342E393932313837352035372E3139
              38393734363120433130372E34393636333936342035382E3139383133363531
              203130382E35313239333736352035372E393637383935393520313131203537
              20433131322E37373839323936342035362E3036353232313733203131322E37
              373839323936342035362E3036353232313733203131342E3531313731383735
              2035342E3838323831323520433131352E35313133383637322035342E323238
              3239313032203131352E35313133383637322035342E32323832393130322031
              31362E35333132352035332E353630353436383820433131372E323432383132
              352035332E3038363831363431203131372E3935343337352035322E36313330
              38353934203131382E363837352035322E31323520433132302E323232353539
              30392035312E3131373033393531203132312E373537373138312035302E3130
              393233313139203132332E32393239363837352034392E313031353632352043
              3132342E30373539313330392034382E35383439373037203132342E38353838
              353734322034382E3036383337383931203132352E3636353532373334203437
              2E353336313332383120433132392E393536373532342034342E373132343135
              3138203133342E32373536343236332034312E3933313333323337203133382E
              35393534353839382033392E313531363131333320433134322E333131343738
              30352033362E3735363139333034203134362E30303433333333382033342E33
              33323430343138203134392E3637313837352033312E38363332383132352043
              3135302E34333832323236362033312E33353238313235203135312E32303435
              373033312033302E3834323334333735203135312E3939343134303632203330
              2E333136343036323520433135332E34363236313936392032392E3333373432
              303231203135342E39323532333037352032382E333439353535333620313536
              2E33383038353933382032372E3335313536323520433136302E303135323632
              38392032342E3934323735343733203136322E34363432313231382032332E33
              323331343739342031363720323420433136372032342E363620313637203235
              2E33322031363720323620433136352E35323930353237332032372E30393035
              37363137203136352E35323930353237332032372E3039303537363137203136
              332E34333335393337352032382E323932393638373520433136322E36343932
              373937392032382E37353039303832203136312E38363439363538322032392E
              3230383834373636203136312E30353638383437372032392E36383036363430
              3620433136302E31393234383737392033302E3137373931393932203135392E
              33323830393038322033302E3637353137353738203135382E34333735203331
              2E3138373520433135302E35303533393934382033352E383430303032373620
              3134322E373433353034342034302E3639333837363635203133352E30363235
              2034352E373520433132382E31343231353131332035302E3239393431343820
              3132312E32313638363137322035342E3830313037343934203131342E313238
              39303632352035392E3038353933373520433131312E36373835333834392036
              302E3538343931343033203130392E32353537373433372036322E3131313038
              3135203130362E38333938343337352036332E3636343036323520433130362E
              31313938323137382036342E3132333835343938203130352E33393937393938
              2036342E3538333634373436203130342E36353739353839382036352E303537
              333733303520433130332E32353633393430342036352E393533373436363920
              3130312E38353835323731392036362E3835353933383833203130302E343635
              30383738392036372E3736343839323538204339332E39353936323232382037
              312E39303636373535372039332E39353936323232382037312E393036363735
              3537203930203732204338372E373130393337352037302E3939363039333735
              2038372E373130393337352037302E39393630393337352038352E3337352036
              392E34333735204338302E30383635323831322036352E393632393932303320
              37342E35363839353031332036322E3939353032333132203639203630204336
              382E30383731383236322035392E35303739383039362036372E313734333635
              32332035392E30313539363139312036362E32333338383637322035382E3530
              3930333332204336342E33373838393930372035372E35303933393534382036
              322E35323337353231362035362E35313030353332362036302E363638343537
              30332035352E3531303938363333204334392E34393731373130372034392E34
              383739383636362033382E34313736353232362034332E333139373135303420
              32372E333832383132352033372E3035303738313235204332322E3630343834
              3632342033342E33333732393532382031372E38303830323338382033312E36
              35393738312031332032392043342E37383237303830382032342E3435323933
              343334202D332E33393237383833312031392E3833333130363633202D31312E
              353632352031352E323031313731383820432D31322E35303039333735203134
              2E3636393433333539202D31332E3433393337352031342E3133373639353331
              202D31342E34303632352031332E353839383433373520432D31352E36363430
              353237332031322E3837363232363831202D31352E3636343035323733203132
              2E3837363232363831202D31362E39343732363536322031322E313438313933
              333620432D31382E32383136363035372031312E34303138303139202D31392E
              36333234353931322031302E3638333737303434202D323120313020432D3231
              20392E3334202D323120382E3638202D3231203820432D31382E363236373439
              333320352E39383939373232202D31352E393336353635363620342E34313235
              39333339202D31332E3331323520322E373520432D31322E3539313236393533
              20322E32363533313235202D31312E383730303339303620312E373830363235
              202D31312E313236393533313220312E323831323520432D31302E3432313139
              31343120302E3833323635363235202D392E373135343239363920302E333834
              30363235202D382E3938383238313235202D302E30373831323520432D382E33
              34343135323833202D302E3439343831343435202D372E373030303234343120
              2D302E3931313530333931202D372E3033363337363935202D312E3334303832
              30333120432D342E3130313031313034202D322E32393130303437202D322E37
              31343032353536202D312E333435383036343120302030205A20222066696C6C
              3D222345444545454522207472616E73666F726D3D227472616E736C61746528
              3233362C34393929222F3E0A3C7061746820643D224D3020302043342E333932
              323332333220332E363434363138333120372E313936313139393420372E3538
              38333539383320392031332043392E36393830323938382032322E3036303936
              34383320382E38393035343534362032382E373035343735333220332E383132
              352033362E323520432D312E31323435333835332034312E3037373332363536
              202D372E30363133393331392034332E39373435353638202D31342E30323334
              3337352034342E303139353331323520432D32312E3137333439383336203433
              2E3537373836303832202D32352E38323637353839362034332E313733323431
              3034202D333120333820432D33312E33332034352E3932202D33312E36362035
              332E3834202D333220363220432D33362E3239203632202D34302E3538203632
              202D343520363220432D34352034312E3231202D34352032302E3432202D3435
              202D3120432D34312E3835303639313037202D322E3034393736393634202D33
              392E3631313835353434202D322E3130313331353935202D33362E3331323520
              2D322E3036323520432D33352E3331383633323831202D322E30353334373635
              36202D33342E3332343736353633202D322E3034343435333133202D33332E33
              30303738313235202D322E303335313536323520432D33322E31363138393435
              33202D322E3031373735333931202D33322E3136313839343533202D322E3031
              373735333931202D3331202D3220432D33302E3637202D312E3031202D33302E
              3334202D302E3032202D3330203120432D32392E343638393036323520302E37
              32323835313536202D32382E3933373831323520302E3434353730333133202D
              32382E33393036323520302E313630313536323520432D32372E363834323138
              3735202D302E3230323037303331202D32362E39373738313235202D302E3536
              343239363838202D32362E3235202D302E3933373520432D32352E3535333930
              363235202D312E3239373134383434202D32342E38353738313235202D312E36
              35363739363837202D32342E313430363235202D322E30323733343337352043
              2D31352E3734333637353031202D352E3834323734363231202D372E38383235
              39353631202D342E313835393330303820302030205A20222066696C6C3D2223
              45444545454522207472616E73666F726D3D227472616E736C61746528373439
              2C34313929222F3E0A3C7061746820643D224D3020302043342E363220302039
              2E3234203020313420302043313420382E39312031342031372E383220313420
              3237204331382E30313131373331392032342E393934343133342032302E3137
              3339353331332032322E38333334393833352032332E30343239363837352031
              392E35353436383735204334302E313439343632313220302E36393638323331
              332034302E313439343632313220302E36393638323331332034372E33363332
              38313235202D302E35383539333735204335312E3433333036373432202D302E
              37353130303136392035352E3130323735373732202D302E3134333735353839
              2035392031204335342E313831333237353320362E3830383931373436203438
              2E39383734333539322031322E31333036353535322034332E3632352031372E
              34333735204334322E37393335353436392031382E3236343433333539203431
              2E39363231303933372031392E30393133363731392034312E31303534363837
              352031392E3934333335393338204333392E303732353839362032312E393634
              35353533312033372E30333734303033372032332E3938333336333335203335
              203236204333362E36303134313539392033302E33313837323432382033382E
              35303830323936362033322E39343830303638382034312E363837352033362E
              33313235204334322E35373639353331332033372E3236373639353331203433
              2E34363634303632352033382E32323238393036322034342E33383238313235
              2033392E3230373033313235204334352E32343634383433382034302E313238
              37313039342034362E31313031353632352034312E3035303339303632203437
              203432204334382E33363237353937322034332E34393231393734372034392E
              37313832303131392034342E39393131353030392035312E303632352034362E
              35204335312E38383432373733342034372E34313236353632352035312E3838
              3432373733342034372E34313236353632352035322E37323236353632352034
              382E333433373520433534203530203534203530203535203533204335352E36
              362035332035362E3332203533203537203533204335392E3632352035352E33
              37352035392E3632352035352E333735203632203538204336322035382E3636
              2036322035392E3332203632203630204335392E32363931363039382036302E
              31333534383831352035362E35343530383139332036302E3233343239383535
              2035332E383132352036302E33313235204335332E3034333537343232203630
              2E33353433393435332035322E32373436343834342036302E33393632383930
              362035312E34383234323138382036302E3433393435333132204334372E3331
              32323233392036302E35323839343233352034352E3538303337353337203630
              2E34363434363335352034322E32323236353632352035372E37373733343337
              35204334312E34383931373936392035362E38363038323033312034302E3735
              3537303331322035352E3934343239363838203430203535204333392E323730
              33393036332035342E32323134303632352033382E3534303738313235203533
              2E343432383132352033372E373839303632352035322E363430363235204333
              322E39333232303430322034372E32373532383637362032382E333436393432
              33352034312E3738363630343933203234203336204332302E31373839373332
              2033372E36313635383832362031362E35383036303937372033392E37313233
              38373634203134203433204331332E31353534383536312034352E3934343239
              3037392031332E313134373735392034382E37363331363231312031332E3132
              352035312E38313235204331332E3130343337352035322E3630303736313732
              2031332E30383337352035332E33383930323334342031332E30363235203534
              2E3230313137313838204331332E30313536353138332035362E313333363539
              30382031332E30303432363235312035382E3036363934393732203133203630
              204331302E38353432333336332036302E303236383539333820382E37303833
              373335352036302E303436333330383820362E353632352036302E3036323520
              43352E33363735333930362036302E303734313031353620342E313732353738
              31322036302E303835373033313320322E39343134303632352036302E303937
              36353632352043302036302030203630202D3120353920432D312E3130313538
              3231372035362E32363439343831202D312E31333936343730372035332E3535
              353830363931202D312E313332383132352035302E3832303331323520432D31
              2E31333432343735392034392E3535383236343932202D312E31333432343735
              392034392E3535383236343932202D312E31333537313136372034382E323730
              373231343420432D312E31333633393438352034362E3437333238363139202D
              312E31333435333130372034342E3637353834383533202D312E313330333731
              30392034322E383738343137393720432D312E31323531343430322034302E31
              39383833323136202D312E31333032343735342033372E353139343233343320
              2D312E31333637313837352033342E383339383433373520432D312E31343037
              363239352032332E3139363538303436202D302E37323936363432392031312E
              363139373739313220302030205A20222066696C6C3D22234544454545452220
              7472616E73666F726D3D227472616E736C617465283533302C34303529222F3E
              0A3C7061746820643D224D3020302043322E3339343831343620322E31313136
              3630313720342E323334363834383220342E3334383935313737203620372043
              362E363620372E393920372E333220382E393820382031302043382E34343932
              313837352031322E353538353933373520382E34343932313837352031322E35
              3538353933373520382E363837352031352E343337352043382E373733383637
              31392031362E333834393630393420382E38363032333433382031372E333332
              343231383820382E39343932313837352031382E333038353933373520433920
              32312039203231203820323520432D342E32312032352E3333202D31362E3432
              2032352E3636202D323920323620432D32362E36313731363732342033302E38
              36383135333232202D32362E36313731363732342033302E3836383135333232
              202D32332E38303835393337352033322E333030373831323520432D32302E32
              303334383738332033332E3139383239373139202D31362E3734393938333734
              2033332E32353235353331202D31332E303632352033332E3138373520432D31
              322E33373232303730332033332E3138363835353437202D31312E3638313931
              3430362033332E3138363231303934202D31302E39373037303331322033332E
              313835353436383820432D362E38383433323030332033332E31353036383637
              33202D332E30303837393730392033322E373834313933343820312033322043
              312E3439352033362E393520312E3439352033362E3935203220343220432D39
              2E35333134383935362034352E3338303936303239202D31392E363533313633
              34312034362E3638363330333334202D333120343220432D33372E3336393136
              3733342033382E3334333632363136202D34312E30323931343133362033352E
              3133373032343238202D343320323820432D34332E3831343934303539203230
              2E3230323330353335202D34342E31353334343631342031322E353931343831
              3431202D33392E3638373520352E3836373138373520432D32392E3431373631
              333838202D352E3439363235313331202D31332E3233333438363431202D372E
              333534333132333220302030205A20222066696C6C3D22234544454545452220
              7472616E73666F726D3D227472616E736C617465283633332C34323129222F3E
              0A3C7061746820643D224D3020302043332E383237333732333520332E303537
              303833353820362E3531373436333420352E393137323532393120372E393838
              32383132352031302E36373537383132352043372E3938383238313235203134
              2E393635373831323520372E39383832383132352031392E3235353738313235
              20372E39383832383132352032332E363735373831323520432D332E38393137
              313837352032342E3030353738313235202D31352E3737313731383735203234
              2E3333353738313235202D32382E30313137313837352032342E363735373831
              323520432D32372E36303831393337372032392E3730393839303432202D3237
              2E36303831393337372032392E3730393839303432202D32342E343130313536
              32352033312E343638373520432D31362E31313737303635372033342E343133
              3939393337202D362E32383534343230312033332E333737343035313720312E
              39383832383132352033302E36373537383132352043322E3438333238313235
              2033352E363235373831323520322E34383332383132352033352E3632353738
              31323520322E39383832383132352034302E363735373831323520432D382E31
              353338313830352034352E3031393331313438202D31392E3732353831393139
              2034362E3337343230323936202D33312E30313137313837352034312E363735
              373831323520432D33362E37323837393937382033382E313239353036373620
              2D34312E323638333437322033332E3236373930343931202D34332E30313137
              313837352032362E363735373831323520432D34332E39363631323236322031
              382E3833313737343436202D34332E37323933353334342031312E3237323437
              333832202D33392E303131373138373520342E363735373831323520432D3239
              2E3139333336303736202D352E3631373635383538202D31312E393438333831
              3733202D372E383635303531323720302030205A20222066696C6C3D22234544
              4544454522207472616E73666F726D3D227472616E736C617465283638392E30
              313137313837352C3432312E333234323138373529222F3E0A3C706174682064
              3D224D3020302043352E323439373332343320352E343930353435383520362E
              33373034333836342031302E3739353735313220362E32373334333735203138
              2E313438343337352043352E37303235323630392032342E3130323232373936
              20332E31303033313630322032382E3234343036303631202D312E3138373520
              33322E3331323520432D372E31343631323232362033362E3936353239363533
              202D31332E38383736313839352033382E3633313731323636202D32312E3338
              32383132352033382E333339383433373520432D32382E333134363238313320
              33372E3433393734323332202D33342E323230323039362033352E3634383234
              373937202D33382E36323520333020432D34322E38393334363336332032332E
              3638333636303735202D34322E38373632393232382031362E34303037363535
              202D3432203920432D33392E383532373536383920332E313836333138303620
              2D33362E3431343234303535202D302E3132313132383839202D3331202D3320
              432D32302E33323432393333202D372E3630373037353831202D392E36343136
              35383834202D362E3730313239343820302030205A20222066696C6C3D222345
              444544454522207472616E73666F726D3D227472616E736C617465283832322C
              34393229222F3E0A3C7061746820643D224D3020302043342E32383133363734
              3420332E383235303230313420372E333538323038363820372E313637303130
              353420382031332043382031352E393720382031382E3934203820323220432D
              322E3839203232202D31332E3738203232202D323520323220432D32332E3539
              3039373231382032362E3832323632353436202D32332E353930393732313820
              32362E3832323632353436202D32312E31383433323631372032382E33303234
              3930323320432D31382E36373830313536312032392E3130323831373634202D
              31362E36383032363638372032392E3231323039343837202D31342E30353037
              383132352032392E313630313536323520432D31332E31323037323236362032
              392E3134393139393232202D31322E31393036363430362032392E3133383234
              323139202D31312E32333234323138382032392E313236393533313220432D39
              2E37383730363035352032392E3039353034383833202D392E37383730363035
              352032392E3039353034383833202D382E333132352032392E3036323520432D
              362E33393139393933382032392E3032383232383031202D342E343731343139
              37372032382E3939383035303931202D322E35353037383132352032382E3937
              32363536323520432D312E37303136393138392032382E393534363839393420
              2D302E38353236303235342032382E393336373233363320302E303232323136
              382032382E393138323132383920433220323920322032392033203330204333
              2E30343039323933372033322E333332393734333320332E3034323431373233
              2033342E3636373035323235203320333720432D372E32393832393031342034
              302E32333338353536202D31372E31373231333536382034312E393834333236
              3632202D32372E3137313837352033362E383934353331323520432D33332E33
              333039323533392033332E3234313830393736202D33362E3034353332333234
              2032392E3937383631313932202D333820323320432D33382E31363537383635
              392031362E3439343835303031202D33382E303330373434393820392E333330
              3938353239202D3334203420432D32342E3733333632353435202D342E383138
              3030313539202D31312E3237363537353438202D362E38323635323139332030
              2030205A20222066696C6C3D222345444545454522207472616E73666F726D3D
              227472616E736C617465283638302C34393129222F3E0A3C7061746820643D22
              4D3020302043332E3335343539313620322E383434313130323720352E323839
              383938353820342E3637333434333536203620392043362E3038313937363133
              2031312E333136343836383820362E31303734373739332031332E3633353230
              38383920362E30393736353632352031352E3935333132352043362E30393632
              3431332031362E363133333436353620362E30393438323633352031372E3237
              33353638313220362E30393333363835332031372E3935333739363339204336
              2E30383737393234352032302E303532353737393420362E3037353234343437
              2032322E313531323530393520362E303632352032342E32352043362E303537
              343831392032352E363737303831373920362E30353239313935342032372E31
              3034313635323520362E30343838323831322032382E35333132352043362E30
              333738333038382033322E303230383638333220362E30323035383238203335
              2E353130343233353620362033392043322E3034203339202D312E3932203339
              202D3620333920432D362E30313435383235322033382E313632323730353120
              2D362E30323931363530342033372E3332343534313032202D362E3034343138
              3934352033362E343631343235373820432D362E31303532303730372033332E
              3335363231303938202D362E31373933353036352033302E3235313636383833
              202D362E32363234353131372032372E313436393732363620432D362E333132
              30393935392032352E3134313137363634202D362E3334363534313634203233
              2E3133353032333133202D362E33383038353933382032312E31323839303632
              3520432D362E34313633303835392031392E3837323037303331202D362E3435
              3137353738312031382E3631353233343338202D362E34383832383132352031
              372E3332303331323520432D362E35313434363533332031362E313537373339
              3236202D362E35343036343934312031342E3939353136363032202D362E3536
              3736323639352031332E373937333633323820432D362E373130333130303620
              31322E38373432333334202D362E38353239393331362031312E393531313033
              3532202D3720313120432D31302E333232313632333820382E37383532323530
              38202D31312E353530333333323320382E3730333332323933202D31352E3433
              373520382E3638373520432D31362E333834393630393420382E363730373432
              3139202D31372E333332343231383820382E3635333938343337202D31382E33
              3038353933373520382E363336373138373520432D32312E3532343630363620
              392E3037303831303437202D32322E373031383934303420392E373235303235
              33202D323520313220432D32352E36323731353034392031342E373830303239
              3839202D32352E36323731353034392031342E3738303032393839202D32352E
              35373432313837352031372E3934353331323520432D32352E36303139333335
              392031392E3130343137393639202D32352E36323936343834342032302E3236
              333034363837202D32352E36353832303331322032312E343537303331323520
              432D32352E36363738373130392032322E3636373436303934202D32352E3637
              3735333930362032332E3837373839303632202D32352E363837352032352E31
              323520432D32352E37323933373836362032372E3532333530343835202D3235
              2E37373437353432342032392E39323139353231202D32352E38323432313837
              352033322E3332303331323520432D32352E38333534313734382033332E3338
              353233393236202D32352E38343636313632312033342E343530313636303220
              2D32352E383538313534332033352E353437333633323820432D323620333820
              2D3236203338202D323720333920432D33302E3633203339202D33342E323620
              3339202D333820333920432D33382032352E38202D33382031322E36202D3338
              202D3120432D33342E3337202D31202D33302E3734202D31202D3237202D3120
              432D3237202D302E3031202D323720302E3938202D3237203220432D32362E34
              3638393036323520312E3732323835313536202D32352E393337383132352031
              2E3434353730333133202D32352E33393036323520312E313630313536323520
              432D32342E333331303135363220302E3631363831363431202D32342E333331
              303135363220302E3631363831363431202D32332E323520302E303632352043
              2D32322E3535333930363235202D302E3239373134383434202D32312E383537
              38313235202D302E3635363739363837202D32312E313430363235202D312E30
              3237333433373520432D31332E3839313037333336202D342E33323133393138
              35202D362E3930393837323631202D332E373830383733363920302030205A20
              222066696C6C3D222345444545454522207472616E73666F726D3D227472616E
              736C617465283538322C34393129222F3E0A3C7061746820643D224D30203020
              43312E313837323236353620302E303033383637313920322E33373434353331
              3220302E303037373334333720332E353937363536323520302E303131373138
              37352043372E373638333031383120302E33383733323037352031302E363136
              353736353120312E30373334303336332031332E37303331323520332E393638
              3735204331342E343337383930363320342E38383134303632352031342E3433
              37383930363320342E38383134303632352031352E3138373520352E38313235
              204331352E363837363536323520362E343230393337352031362E3138373831
              323520372E3032393337352031362E37303331323520372E3635363235204331
              392E33303732383439382031312E31353034333933342031392E303533323936
              39332031332E37353238333036312031392E30333531353632352031382E3037
              3033313235204331392E303333373431332031382E3733333336333935203139
              2E30333233323633352031392E33393634313534312031392E30333038363835
              332032302E3037393535393333204331392E30323532363735342032322E3139
              3839313836332031392E3031323731352032342E333138313732353920313920
              32362E34333735204331382E39393439383531322032372E3837333639363339
              2031382E39393034323231392032392E33303938393434342031382E39383633
              323831322033302E3734363039333735204331382E3937353239373832203334
              2E32363832363334352031382E39353830333235392033372E37393033373134
              352031382E393337352034312E33313235204331342E393737352034312E3331
              32352031312E303137352034312E3331323520362E393337352034312E333132
              352043362E39323333323033312033392E343933363332383120362E39303931
              343036322033372E363734373635363220362E38393435333132352033352E38
              303037383132352043362E38343736333032322033332E343038383238383120
              362E37393933383238352033312E303136393032343920362E37352032382E36
              32352043362E37343431393932322032372E343236383136343120362E373338
              33393834342032362E323238363332383120362E37333234323138382032342E
              39393431343036322043362E38313634383231332031372E3936323337373320
              362E38313634383231332031372E3936323337373320332E3636373936383735
              2031312E39383832383132352043302E3831363832392031302E323338343430
              3132202D302E333031323538363920392E3731363638363939202D332E353632
              352031302E3138373520432D342E323934363837352031302E32363734323138
              38202D352E3032363837352031302E3334373334333735202D352E3738313235
              2031302E3432393638373520432D392E34303731313039362031312E38333238
              34363032202D31302E37393435303835332031332E3038343232323939202D31
              332E303632352031362E3331323520432D31332E38323032373730342032302E
              3537393036343834202D31332E38353331393130362032342E37393935363032
              33202D31332E3837352032392E31323520432D31332E39303031333637322033
              302E3239343832343232202D31332E39323532373334342033312E3436343634
              383434202D31332E39353131373138382033322E363639393231383820432D31
              342E30303939353735362033352E3535303432303436202D31342E3033393131
              3137382033382E3433313439363536202D31342E303632352034312E33313235
              20432D31382E303232352034312E33313235202D32312E393832352034312E33
              313235202D32362E303632352034312E3331323520432D32362E303632352032
              382E31313235202D32362E303632352031342E39313235202D32362E30363235
              20312E3331323520432D32322E3130323520312E33313235202D31382E313432
              3520312E33313235202D31342E3036323520312E3331323520432D31332E3733
              323520312E39373235202D31332E3430323520322E36333235202D31332E3036
              323520332E3331323520432D31322E323138313634303620322E383233393435
              3331202D31312E333733383238313320322E3333353339303633202D31302E35
              3033393036323520312E383332303331323520432D362E363933303339333720
              302E3134393336363938202D342E3134303936373032202D302E303538353737
              333420302030205A20222066696C6C3D222345444545454522207472616E7366
              6F726D3D227472616E736C617465283731392E303632352C3438372E36383735
              29222F3E0A3C7061746820643D224D3020302043332E3936203020372E393220
              302031322030204331362E353132303932333620382E39323334313834203230
              2E39363633363431372031372E3834363734393436203235203237204332392E
              30343834353133322031382E33353437343830342033332E3036373632333137
              20392E363938383934322033372031204334302E393620312034342E39322031
              2034392031204334362E33343130353830342031302E30373935363533362034
              322E31383336393638312031382E34323138393131372033382E313235203236
              2E39333735204333372E34303937313234392032382E34343936353939362033
              362E36393438363535382032392E39363230323834322033352E393830343638
              37352033312E3437343630393338204333342E36313330353236342033342E33
              363733313136312033332E32333338323136332033372E323533383831343520
              33312E38343437323635362034302E3133363233303437204333302E37303830
              373030322034322E34393734303730312032392E36313733373936382034342E
              38363139393337332032382E35353337313039342034372E3235383330303738
              204332372E39333534343433342034382E36313733373534392032372E393335
              34343433342034382E36313733373534392032372E333034363837352035302E
              3030333930363235204332362E39373139343832342035302E37363634363732
              392032362E36333932303839382035312E35323930323833322032362E323936
              33383637322035322E3331343639373237204332352035342032352035342032
              322E35373738383038362035342E3734333635323334204331392E3236363838
              34352035352E30373239303139312031362E30313434323131352035352E3039
              3335393237322031322E363837352035352E30363235204331312E3433333234
              3231392035352E30353334373635362031302E31373839383433382035352E30
              3434343533313320382E38383637313837352035352E30333531353632352043
              372E39333431303135362035352E303233353534363920362E39383134383433
              382035352E303131393533313220362035352043362E36362035322E33362037
              2E33322034392E373220382034372043392E3039333132352034362E39313735
              2031302E31383632352034362E3833352031312E333132352034362E37352043
              31342E39363230343534332034362E333234373133342031342E393632303435
              34332034362E333234373133342031372034342E3235204331382E3332333533
              3037312034312E323732303535392031372E38363732333731382034302E3134
              353335323737203137203337204331352E38363335343937342033342E333535
              38343031372031342E36383938333337322033312E3737353134343532203133
              2E343337352032392E31383735204331332E303836313439392032382E343439
              39313435352031322E373334373939382032372E373132333239312031322E33
              373238303237332032362E39353233393235382043392E353134363931333420
              32302E393832393139343120362E35353930373030342031352E303631353333
              323220332E353237303939363120392E313738343636382043312E3934383036
              3820362E303739333931353520302E383530343136343320332E343031363635
              373220302030205A20222066696C6C3D222345444544454522207472616E7366
              6F726D3D227472616E736C617465283836342C34383729222F3E0A3C70617468
              20643D224D3020302043332E3936203020372E39322030203132203020433136
              2E323920382E39312032302E35382031372E3832203235203237204332372E33
              393436353438352032332E38303731323638372032382E383633363530313320
              32312E33393633393035372033302E343435333132352031372E383332303331
              3235204333302E38383233303436392031362E38353638353534372033312E33
              313932393638372031352E38383136373936392033312E373639353331323520
              31342E3837363935333132204333322E34343034383832382031332E33363030
              343838332033322E34343034383832382031332E33363030343838332033332E
              3132352031312E38313235204333342E303231343837323720392E3739373330
              3833362033342E393139383233393720372E373832393338312033352E383230
              3331323520352E3736393533313235204333362E323134393236373620342E38
              373835343733362033362E363039353431303220332E39383735363334382033
              372E303136313133323820332E30363935383030382043333820312033382031
              2033392030204334312E3031393634313939202D302E30373234343035332034
              332E3034313637313234202D302E30383337373138382034352E30363235202D
              302E30363235204334362E3731393538393834202D302E303438393634383420
              34362E3731393538393834202D302E30343839363438342034382E3431303135
              363235202D302E3033353135363235204334392E3236343830343639202D302E
              30323335353436392035302E3131393435333132202D302E3031313935333132
              2035312030204335302E333738313039313920342E3532353938333039203438
              2E353731373137313320382E32333739363231392034362E352031322E323520
              4334362E31353035303239332031322E39333635383639312034352E38303130
              303538362031332E36323331373338332034352E34343039313739372031342E
              3333303536363431204334342E33303232343739322031362E35353830393238
              332034332E31353234323730372031382E373739353632333420343220323120
              4334312E33393333333439362032322E313734313734382034312E3339333333
              3439362032322E313734313734382034302E37373434313430362032332E3337
              323037303331204333392E35363430323134382032352E373039363131303920
              33382E33343633383030342032382E303433313833362033372E313235203330
              2E333735204333362E37343430383230332033312E313036323230372033362E
              33363331363430362033312E38333734343134312033352E3937303730333132
              2033322E3539303832303331204333332E32333530393039352033372E373634
              39303930352033332E32333530393039352033372E3736343930393035203331
              203430204332372E393630393337352034302E313935333132352032372E3936
              30393337352034302E313935333132352032342E3337352034302E3132352043
              32322E35393232323635362034302E30393739323936392032322E3539323232
              3635362034302E30393739323936392032302E373733343337352034302E3037
              3033313235204331392E34303035383539342034302E30333535303738312031
              392E34303035383539342034302E303335353037383120313820343020433132
              2E39383735373139372033302E383532303232363120382E3234323630383935
              2032312E363239343032363520332E393337352031322E3132352043332E3334
              3639303739362031302E383332383735393820332E3334363930373936203130
              2E383332383735393820322E373434333834373720392E353134363438343420
              43322E333834303131323320382E373038303137353820322E30323336333737
              20372E393031333836373220312E363532333433373520372E30373033313235
              2043312E333332353735363820362E333536333333303120312E303132383037
              363220352E363432333533353220302E363833333439363120342E3930363733
              38323820433020332030203320302030205A20222066696C6C3D222345444544
              454522207472616E73666F726D3D227472616E736C617465283539312C343839
              29222F3E0A3C7061746820643D224D30203020433020332E3633203020372E32
              3620302031312043342E363220313120392E3234203131203134203131204331
              342031332E39372031342031362E39342031342032302043392E30352032302E
              333320342E312032302E3636202D3120323120432D302E36372032372E36202D
              302E33342033342E3220302034312043362E39332034312E34393520362E3933
              2034312E343935203134203432204331342E3439352034362E3435352031342E
              3439352034362E3435352031352035312043372E38343232383939332035332E
              3338353930333336202D302E30353033353831312035322E3338373034323820
              2D372E31363031353632352035302E3234323138373520432D31302E31323733
              343833312034382E3233383836303338202D31302E3830383436313832203436
              2E3338333338303033202D313220343320432D31322E33343631303130322033
              392E3139383334373831202D31322E32383334343434312033352E3433383137
              353436202D31322E313837352033312E36323520432D31322E31373339363438
              342033302E3630323737333434202D31322E31363034323936392032392E3538
              303534363837202D31322E31343634383433382032382E353237333433373520
              432D31322E31313133303231372032362E3031373637393531202D31322E3036
              3230373533392032332E35303931313931202D313220323120432D31342E3634
              203231202D31372E3238203231202D323020323120432D31392E36372031372E
              37202D31392E33342031342E34202D313920313120432D31372E30322031302E
              3637202D31352E30342031302E3334202D313320313020432D31322E36372037
              2E3336202D31322E333420342E3732202D3132203220432D31302E3536333432
              37353520312E3636323639313538202D392E313235363939303720312E333330
              3330343039202D372E36383735203120432D362E383836393932313920302E38
              3134333735202D362E303836343834333820302E3632383735202D352E323631
              373138373520302E3433373520432D332030202D33203020302030205A202220
              66696C6C3D222345444545454522207472616E73666F726D3D227472616E736C
              617465283736322C34373829222F3E0A3C7061746820643D224D302030204334
              2E3339353433393720312E343635313436353720382E32323839383231372033
              2E363738353932362031322E3138373520362E303632352043382E3739313234
              32323620392E383637303033353620342E39373335303436312031322E313434
              343230383820302E3632352031342E3638373520432D392E3035313434323832
              2032302E3435323832313038202D31382E33373134303330312032362E373134
              3130343232202D32372E36383338333738392033332E30343334353730332043
              2D32382E38303631333739312033332E3830313132383134202D32392E393238
              34353137362033342E3535383737383739202D33312E30353037383132352033
              352E333136343036323520432D33322E30343131383430382033352E39393030
              32313937202D33332E30333135383639312033362E36363336333737202D3334
              2E30353230303139352033372E333537363636303220432D33362E3632363135
              3332382033382E3934373431353631202D33382E39313538373633322034302E
              3139333735363637202D34312E383132352034312E3036323520432D34342E37
              303730333132352033392E39343533313235202D34342E373037303331323520
              33392E39343533313235202D34372E3632352033382E3138373520432D34392E
              30383837333034372033372E3332353131373139202D34392E30383837333034
              372033372E3332353131373139202D35302E35383230333132352033362E3434
              353331323520432D35312E33313830383539342033352E393838393834333720
              2D35322E30353431343036332033352E3533323635363235202D35322E383132
              352033352E3036323520432D35312E33333131353735312033302E3436303838
              323931202D34372E35353436303233312032382E3734383133373435202D3433
              2E3632352032362E3433373520432D34322E31363830343330312032352E3535
              353431303235202D34302E373132333432372032342E3637313234313937202D
              33392E323537383132352032332E373835313536323520432D33382E31343634
              373934392032332E3131303537333733202D33382E3134363437393439203233
              2E3131303537333733202D33372E30313236393533312032322E343232333633
              323820432D33332E36313830333536332032302E3332343234333631202D3330
              2E33303738393331372031382E3130363536323838202D32372031352E383735
              20432D32312E37353335393538372031322E3334363337323333202D31362E34
              3733353235363620382E38383736383931202D31312E31303933373520352E35
              33393036323520432D392E313631383934353320342E3238373131303737202D
              372E3334323934393320322E3935383936313538202D352E3520312E35363235
              20432D322E3831323520302E30363235202D322E3831323520302E3036323520
              302030205A20222066696C6C3D222345444545454522207472616E73666F726D
              3D227472616E736C617465283335392E383132352C3439382E3933373529222F
              3E0A3C7061746820643D224D3020302043332E3936203020372E393220302031
              322030204331322031372E31362031322033342E33322031322035322043372E
              373120353220332E3432203532202D3120353220432D312E3230363338393533
              2031352E3132323935343432202D312E32303633383935332031352E31323239
              3534343220302030205A20222066696C6C3D222345454545454522207472616E
              73666F726D3D227472616E736C617465283532332C34373829222F3E0A3C7061
              746820643D224D3020302043332E3633203020372E3236203020313120302043
              31312E363620312E36352031322E333220332E332031332035204331332E3832
              3520342E3137352031342E363520332E33352031352E3520322E35204331382E
              313632373536333220302E323338353638322031392E3838343430333231202D
              302E33343335353531332032332E333735202D302E33313235204332352E3136
              39333735202D302E313537383132352032352E313639333735202D302E313537
              3831323520323720302043323720332E363320323720372E3236203237203131
              204332352E343332352031312E323437352032332E3836352031312E34393520
              32322E32352031312E3735204331382E30343132373234392031322E35393533
              313732362031352E35303338323033312031332E323938373030343120313320
              3137204331322E31313831303239342031392E383539383339322031312E3832
              3436333636362032322E35363438323438352031312E36383335393337352032
              352E353436383735204331312E36343136393932322032362E33393132313039
              342031312E35393938303436392032372E32333535343638372031312E353536
              36343036322032382E3130353436383735204331312E35313733323432322032
              382E39373831363430362031312E34373830303738312032392E383530383539
              33382031312E343337352033302E3735204331312E3339343331363431203331
              2E36333831363430362031312E33353131333238312033322E35323633323831
              322031312E33303636343036322033332E3434313430363235204331312E3230
              3038363530352033352E36323734333437322031312E30393939353734203337
              2E38313336393737372031312034302043372E333720343020332E3734203430
              20302034302043302032362E3820302031332E3620302030205A20222066696C
              6C3D222345444544454522207472616E73666F726D3D227472616E736C617465
              283833342C34383829222F3E0A3C7061746820643D224D3020302043332E3036
              39333633373820312E3339383038353820352E3334373230323320332E303831
              363435303720372E383639313430363220352E33303638383437372043362E37
              3738353933373520352E393631373238353220352E363838303436383720362E
              363136353732323720342E353634343533313220372E32393132353937372043
              2D332E34383935353231312031322E3135353232393536202D31312E34343939
              373234382031372E3131353036313033202D31392E3235353835393338203232
              2E333639333834373720432D32312E34373736363733392032332E3835363439
              363136202D32332E37303031333231322032352E3334323632303432202D3235
              2E39323238353135362032362E383238333639313420432D32372E3430393836
              3934312032372E3832343039383932202D32382E38393438363133382032382E
              3832323836303034202D33302E33373739323936392032392E38323434363238
              3920432D33322E35333435393332312033312E3237333537343532202D33342E
              37303532393832392033322E3639383835333435202D33362E38383038353933
              382033342E313139333834373720432D33372E353234323632372033342E3535
              383339313131202D33382E31363736363630322033342E393937333937343620
              2D33382E38333035363634312033352E343439373037303320432D34312E3830
              3338313033352033372E33363338383531202D34332E37363632343435312033
              382E3330353535303831202D34372E33333339383433382033382E3331383630
              33353220432D35302E34383933323630382033372E3137373231353934202D35
              312E38353933333535342033352E3731373236343435202D35342E3133303835
              3933382033332E333036383834373720432D34352E3833333131323731203237
              2E3132303936313633202D33372E33303236333230392032312E333835383638
              3432202D32382E36333038353933382031352E373434333834373720432D3236
              2E37353535323836312031342E3531393032393336202D32342E383830363736
              31322031332E3239323934343637202D32332E30303538353933382031322E30
              3636383032393820432D32312E31393336393734382031302E38383630363032
              34202D31392E3337353335343220392E3731353239343237202D31372E353536
              363430363220382E353434363737373320432D31352E33323538323835392037
              2E3130333335383635202D31332E313539313236333720352E36323133393035
              202D31302E393836333238313220342E303838363233303520432D31302E3033
              33373130393420332E3432393735303938202D392E303831303933373520322E
              3737303837383931202D382E303939363039333820322E303932303431303220
              432D372E323739313231303920312E3530343330393038202D362E3435383633
              32383120302E3931363537373135202D352E363133323831323520302E333131
              303335313620432D332E3133303835393338202D302E3639333131353233202D
              332E3133303835393338202D302E363933313135323320302030205A20222066
              696C6C3D222345444545454522207472616E73666F726D3D227472616E736C61
              7465283334372E3133303835393337352C3439312E3639333131353233343337
              3529222F3E0A3C7061746820643D224D3020302043312E363831353630383820
              302E393637323339323920332E333037373833343620322E3032393430373732
              20342E39323138373520332E31303534363837352043342E3932313837352033
              2E373635343638373520342E39323138373520342E343235343638373520342E
              39323138373520352E31303534363837352043352E35383138373520352E3130
              35343638373520362E32343138373520352E313035343638373520362E393231
              38373520352E31303534363837352043372E373031363732343220392E383539
              343134343820382E33323431303933392031332E383237373833303420362E38
              35393337352031382E34383034363837352043332E3930313135333836203232
              2E343838333831323720312E33353031363536342032342E3638303630393435
              202D332E36363739363837352032352E353538353933373520432D382E353231
              38383432312032352E3835313535393834202D31322E32313834393932342032
              352E3631373431333339202D31362E3230333132352032322E36363739363837
              3520432D31392E33303834333134392031392E3531373938313539202D32302E
              30373535373337392031362E36343235393836202D32302E3231343834333735
              2031322E323831323520432D31392E3932323633313420372E36333038393931
              36202D31392E303430353338353220352E3031383532373733202D31352E3634
              3036323520312E373932393638373520432D31302E3839323037383736202D31
              2E3333343132323637202D352E3330313536333638202D322E32383230363430
              3720302030205A20222066696C6C3D222346454645464522207472616E73666F
              726D3D227472616E736C617465283733372E3037383132352C3432362E383934
              353331323529222F3E0A3C7061746820643D224D3020302043332E3532393232
              32323520302E383139323833373420342E323336343430373920312E32353231
              39333720362E3520332E3831323520432D322E31353736393136362031302E31
              333332383236202D31312E32343530313931322031352E373538343430373320
              2D32302E33323337333034372032312E343436373737333420432D32332E3035
              3633333834392032332E3136313633313432202D32352E373739353338393120
              32342E38393039353037202D32382E352032362E36323520432D32392E333238
              38363731392032372E3134353738313235202D33302E31353737333433382032
              372E36363635363235202D33312E30313137313837352032382E323033313235
              20432D33322E38333330313439312032392E3338313130363139202D33342E36
              323335353039392033302E3630373032313839202D33362E3339343533313235
              2033312E38353933373520432D33372E33353734363039342033322E35323435
              33313235202D33382E33323033393036322033332E31383936383735202D3339
              2E333132352033332E38373520432D34302E31363435373033312033342E3438
              343732363536202D34312E30313636343036332033352E303934343533313220
              2D34312E38393435333132352033352E373232363536323520432D34342E3520
              33362E38313235202D34342E352033362E38313235202D34372E363336373138
              37352033362E313833353933373520432D35302E32313533333737392033342E
              3934383831313635202D35312E37313231313735332033332E39393736383936
              38202D35332E352033312E3831323520432D34372E3134363338343932203236
              2E3936343733313332202D34302E36363031353437312032322E353933393838
              3934202D33332E373830303239332031382E353337313039333820432D32372E
              38383732313935382031352E3036313935373439202D32322E30363431313730
              362031312E3438303131303535202D31362E323520372E38373520432D31352E
              333332333438363320372E3330363932363237202D31342E3431343639373237
              20362E3733383835323534202D31332E343639323338323820362E3135333536
              34343520432D332E3236333935383032202D302E3137343835343839202D332E
              3236333935383032202D302E313734383534383920302030205A20222066696C
              6C3D222345454545454522207472616E73666F726D3D227472616E736C617465
              283239332E352C3436352E3138373529222F3E0A3C7061746820643D224D3020
              302043302E34393520312E34383520302E34393520312E343835203120332043
              322E363520322E333420342E3320312E3638203620312043382E34373520322E
              393820382E34373520322E393820313120352043352E33353934363336382038
              2E39353331393634202D302E34383338303832372031322E3438343438393038
              202D362E343337352031352E3933373520432D31312E39353137393035392031
              392E31343338353635202D31372E32373635323434392032322E343532323934
              3537202D32322E343435333132352032362E313939323138373520432D32362E
              33353739303335382032382E3935373137363638202D33302E34303235323632
              362033312E3530343830323537202D33342E343434303931382033342E303638
              363033353220432D33372E33373435373234312033352E383335323738353920
              2D33372E33373435373234312033352E3833353237383539202D343020333820
              432D34322E33333934343733362033372E3731323639393435202D34342E3637
              33393134332033372E3338303633323231202D343720333720432D3437203336
              2E3334202D34372033352E3638202D343720333520432D34342E373630343734
              34352033332E3334363830303938202D34322E35323435353134362033312E38
              31363731323332202D34302E313837352033302E3331323520432D33392E3531
              3133303631352032392E3836393836383136202D33382E383335313132332032
              392E3432373233363333202D33382E31333834323737332032382E3937313139
              31343120432D33362E30393736353437312032372E3633383934333137202D33
              342E30353033323436342032362E33313734393138202D333220323520432D33
              312E34303932383731312032342E36313938383737202D33302E383138353734
              32322032342E3233393737353339202D33302E32303939363039342032332E38
              3438313434353320432D32372E31343938333931352032312E38383239383636
              37202D32342E303830303135362031392E3933333831343337202D3231203138
              20432D32352E33363839373139322031382E39303338323235202D32382E3536
              3330373130362032312E3139343233363335202D33322E313837352032332E36
              38373520432D33332E31383537313737372032342E3336303939343837202D33
              332E31383537313737372032342E3336303939343837202D33342E3230343130
              3135362032352E3034383039353720432D33372E31313630383835322032372E
              30313439393531202D34302E30303735353730332032392E3030353333313936
              202D34322E38373839303632352033312E303331323520432D34332E36363133
              363731392033312E35373738313235202D34342E34343338323831322033322E
              313234333735202D34352E32352033322E3638373520432D34352E3931353135
              3632352033332E3136353734323139202D34362E353830333132352033332E36
              34333938343338202D34372E3236353632352033342E31333637313837352043
              2D3439203335202D3439203335202D353220333420432D34342E313436313237
              31332032372E3330313830323132202D33352E33333831343338352032322E30
              353435363534202D32362E35393736353632352031362E363230313137313920
              432D32322E32353935373333322031332E3931343532333336202D31372E3934
              3337333839332031312E3137333832323731202D31332E36323520382E343337
              3520432D392E313130343031373320352E3537383030383839202D342E353939
              383337353720322E373231343137383420302030205A20222066696C6C3D2223
              46304630463022207472616E73666F726D3D227472616E736C61746528333036
              2C34373229222F3E0A3C7061746820643D224D30203020433320322E35203320
              322E35203520352043352E333320352E333320352E363620352E363620362036
              2043362E34353338333533352031302E323234313539383420362E3434323735
              37342031332E393238303631303420342E383132352031372E3837352043312E
              35313533393234312032312E3734303537343432202D302E3834303537353134
              2032322E3838393537383538202D352E393337352032332E33373520432D392E
              38393232313330332032332E3230333338303338202D31322E36373833383932
              342032322E32343031353631202D313620323020432D31392E30303336393237
              372031362E3439353639313736202D31392E34383739303734322031332E3339
              383135333538202D31392E323737333433373520382E39323537383132352043
              2D31382E383433353535353920352E39313337303239202D31382E3031393939
              30323120342E3238303633343131202D3136203220432D31302E363938373534
              3532202D312E3138303734373239202D352E39373537373932202D312E383830
              303230343220302030205A20222066696C6C3D22234645464546452220747261
              6E73666F726D3D227472616E736C617465283831302C34393729222F3E0A3C70
              61746820643D224D3020302043322E363536393231383420312E373330303838
              363420342E313430373730313720332E303030323538303820352E3638373520
              352E37352043352E3638373520362E373420352E3638373520372E373320352E
              3638373520382E373520432D322E3536323520382E3735202D31302E38313235
              20382E3735202D31392E3331323520382E373520432D31382E33303838313530
              3620332E3733313537353238202D31382E303138303835323820322E38303136
              35383436202D31342E33313235202D302E323520432D392E3233343834343234
              202D312E3934323535313932202D342E3933353634313835202D312E38363235
              3036333620302030205A20222066696C6C3D222346444645464522207472616E
              73666F726D3D227472616E736C617465283637392E333132352C3432382E3235
              29222F3E0A3C7061746820643D224D3020302043332E33393438383432322032
              2E303531303735383820342E383033323330383120332E373034383436323120
              37203720433720372E3939203720382E3938203720313020432D312E32352031
              30202D392E35203130202D313820313020432D31362E39303236303432392034
              2E3531333032313434202D31362E333537323533303820332E39373536383530
              33202D3132203120432D382E3330303434393031202D302E3834393737353439
              202D342E3033373939313636202D302E343730353639313120302030205A2022
              2066696C6C3D222346454645464522207472616E73666F726D3D227472616E73
              6C617465283632322C34323729222F3E0A3C7061746820643D224D3020302043
              3020302E3636203020312E33322030203220432D322E35373333363536322033
              2E3731353537373038202D352E313439323230303820352E3330393239373636
              202D372E3831323520362E38373520432D392E343730383338383920372E3836
              383437393439202D31312E313238333635313120382E3836333331363532202D
              31322E373835313536323520392E38353933373520432D31332E363436343131
              31332031302E3337353634343533202D31342E35303736363630322031302E38
              39313931343036202D31352E33393530313935332031312E3432333832383132
              20432D31392E35343738303733392031332E3933363531373736202D32332E36
              353032363033392031362E3532363933383335202D32372E37352031392E3132
              3520432D32382E35333636353033392031392E3632323039343733202D32392E
              33323333303037382032302E3131393138393435202D33302E31333337383930
              362032302E363331333437363620432D33332E38353031373630342032322E39
              38343434303738202D33372E35353435303539342032352E3335333935363320
              2D34312E32333832383132352032372E3735373831323520432D34312E383837
              36343634382032382E3138303436333837202D34322E35333730313137322032
              382E3630333131353233202D34332E32303630353436392032392E3033383537
              34323220432D34342E34313132383835312032392E38323530353131202D3435
              2E36313339333038372033302E3631353531393031202D34362E383133343736
              35362033312E343130363434353320432D35302E373739333734363320333420
              2D35302E3737393337343633203334202D353320333420432D35322E36373338
              343330342033312E3136333034393833202D35322E3235383131353438203330
              2E3230353939313139202D34392E39383832383132352032382E333934353331
              323520432D34392E31303532373334342032372E3837323436303934202D3438
              2E32323232363536322032372E3335303339303632202D34372E333132352032
              362E3831323520432D34362E33313334373635362032362E3230363634303632
              202D34352E33313434353331322032352E3630303738313235202D34342E3238
              3531353632352032342E3937363536323520432D34332E323031303534363920
              32342E3332343239363838202D34322E31313639353331332032332E36373230
              33313235202D343120323320432D33382E37343432333439312032312E353730
              3535313639202D33362E34393431343434312032302E3133343836353536202D
              33342E32352031382E3638373520432D33332E36363935393936312031382E33
              31353132323037202D33332E30383931393932322031372E3934323734343134
              202D33322E34393132313039342031372E353539303832303320432D32372E33
              363033393530352031342E3235383330333735202D32322E3238363831363731
              2031302E3837333730343034202D31372E323337333034363920372E34343939
              3531313720432D352E3233313630303333202D302E3633343133333337202D35
              2E3233313630303333202D302E363334313333333720302030205A2022206669
              6C6C3D222345464546454622207472616E73666F726D3D227472616E736C6174
              65283332332C34383029222F3E0A3C7061746820643D224D3020302043302E37
              3535303638333620302E363338303835393420302E373535303638333620302E
              363338303835393420312E353235333930363220312E32383930363235204331
              2E303337373232313720312E353830333930363220302E353530303533373120
              312E383731373138373520302E303437363037343220322E3137313837352043
              2D382E333433363231373720372E3230303039303036202D31362E3539363230
              3932332031322E3232373231373036202D32342E34313939323138382031382E
              313133323831323520432D33302E38363638313333392032322E373035323438
              3733202D33372E36363438393235362032362E3738393132323037202D34342E
              33383732303730332033302E393632383930363220432D34362E323439333734
              36332033322E3134353936353939202D34382E30353535383231332033332E33
              38313931313139202D34392E38363133323831322033342E3634383433373520
              432D35322E34373436303933382033362E32383930363235202D35322E343734
              36303933382033362E32383930363235202D35352E3437343630393338203336
              2E3238393036323520432D35342E30353738353233362033322E303338373931
              3434202D35302E39333434353639362033302E3636383736353538202D34372E
              33313833353933382032382E3335313536323520432D34362E35383332333132
              2032372E3837313338363732202D34352E38343831303330332032372E333931
              3231303934202D34352E30393036393832342032362E38393634383433382043
              2D34322E37323335393638372032352E3335323934353038202D34302E333439
              32383836382032332E3832303931313437202D33372E39373436303933382032
              322E3238393036323520432D33362E34333633363335342032312E3238383530
              3633202D33342E383938353937392032302E3238373231313434202D33332E33
              363133323831322031392E323835313536323520432D33302E32383937393939
              392031372E32383338343133202D32372E32313035353838372031352E323935
              3134323834202D32342E31323639353331322031332E3331323520432D32302E
              39343134343132362031312E3235373830373839202D31372E37393531333139
              20392E3135353135393035202D31342E363636303135363220372E3031353632
              3520432D31332E383933353034363420362E3439343834333735202D31332E31
              3230393933363520352E39373430363235202D31322E33323530373332342035
              2E3433373520432D31302E383531323231323720342E3434323534383237202D
              392E333835363432373520332E34333531393833202D372E3932393830393537
              20322E3431343036323520432D332E3032343331373239202D302E3836383836
              343634202D332E3032343331373239202D302E38363838363436342030203020
              5A20222066696C6C3D222345464546454622207472616E73666F726D3D227472
              616E736C617465283338332E3437343630393337352C3531312E373130393337
              3529222F3E0A3C7061746820643D224D30203020433020302E3939203020312E
              39382030203320432D302E383133333938343420332E3434393838323831202D
              312E363236373936383720332E3839393736353632202D322E34363438343337
              3520342E333633323831323520432D31342E31333536363535342031302E3931
              343136393937202D32352E32373035353733352031382E323031353639313220
              2D33362E3432313837352032352E353933373520432D33372E33323932313338
              372032362E31393136333333202D33382E32333635353237332032362E373839
              35313636202D33392E31373133383637322032372E343035353137353820432D
              34302E39343738343233362032382E35373633393938202D34322E3732303434
              3331342032392E3735333135353634202D34342E34383837363935332033302E
              3933363237393320432D34352E32393432373234362033312E34363634383638
              32202D34362E30393937373533392033312E3939363639343334202D34362E39
              3239363837352033322E353432393638373520432D34372E3634333636363939
              2033332E3031373538353435202D34382E33353736343634382033332E343932
              3230323135202D34392E30393332363137322033332E39383132303131372043
              2D3531203335202D3531203335202D353420333520432D35322E353335353132
              38332033312E3331333230333639202D35302E37313437383139372032392E38
              333534343439202D34372E34303632352032372E373134383433373520432D34
              362E34363636383435372032372E3130363838393635202D34352E3532373131
              3931342032362E3439383933353535202D34342E35353930383230332032352E
              383732353538353920432D34332E35343935383439362032352E323333393839
              3236202D34322E35343030383738392032342E3539353431393932202D34312E
              352032332E3933373520432D34302E34363835383838372032332E3237353732
              373534202D33392E34333731373737332032322E3631333935353038202D3338
              2E33373435313137322032312E393332313238393120432D32372E3735343031
              3938312031352E3134343132383134202D31372E303737303439303520382E34
              32343939303439202D362E3131373138373520322E3139353331323520432D35
              2E303038393936353820312E3536353230323634202D352E3030383939363538
              20312E3536353230323634202D332E383738343137393720302E393232333633
              323820432D322030202D32203020302030205A20222066696C6C3D2223454645
              46454622207472616E73666F726D3D227472616E736C617465283333392C3438
              3829222F3E0A3C7061746820643D224D3020302043312E36323520322E313837
              3520312E36323520322E3138373520322E36323520362E3138373520432D342E
              39363520362E31383735202D31322E35353520362E31383735202D32302E3337
              3520362E3138373520432D31372E33373520302E31383735202D31372E333735
              20302E31383735202D31342E333735202D312E3831323520432D392E32393437
              34303633202D332E3336343830313437202D342E3331333035333837202D332E
              323931353431313120302030205A20222066696C6C3D22234644464546452220
              7472616E73666F726D3D227472616E736C617465283637342E3337352C343938
              2E3831323529222F3E0A3C2F7376673E0A}
            Stretch = True
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
