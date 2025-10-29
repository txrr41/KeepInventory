object FormMovi: TFormMovi
  Left = 0
  Top = 0
  Caption = 'FormMovi'
  ClientHeight = 822
  ClientWidth = 1374
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1374
    Height = 822
    Align = alClient
    Color = clGradientActiveCaption
    ParentBackground = False
    TabOrder = 0
    object Label7: TLabel
      Left = 24
      Top = 16
      Width = 122
      Height = 20
      Caption = 'MOVIMENTA'#199#213'ES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowFrame
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Panel2: TPanel
      Left = 48
      Top = 136
      Width = 985
      Height = 550
      Caption = 'Panel2'
      Color = clMenu
      ParentBackground = False
      TabOrder = 0
      object DBGrid1: TDBGrid
        Left = 24
        Top = 24
        Width = 937
        Height = 497
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
      object PanelPendencias: TPanel
        Left = 152
        Top = 4
        Width = 753
        Height = 501
        Caption = 'PanelPendencias'
        Color = clGradientActiveCaption
        ParentBackground = False
        TabOrder = 1
        Visible = False
        object Image1: TImage
          Left = 696
          Top = 8
          Width = 25
          Height = 26
          Picture.Data = {
            0D54536B537667477261706869633C3F786D6C2076657273696F6E3D22312E30
            22207374616E64616C6F6E653D226E6F223F3E0A3C21444F4354595045207376
            67205055424C494320222D2F2F5733432F2F4454442053564720323030313039
            30342F2F454E220A2022687474703A2F2F7777772E77332E6F72672F54522F32
            3030312F5245432D5356472D32303031303930342F4454442F73766731302E64
            7464223E0A3C7376672076657273696F6E3D22312E302220786D6C6E733D2268
            7474703A2F2F7777772E77332E6F72672F323030302F737667220A2077696474
            683D223531322E303030303030707422206865696768743D223531322E303030
            3030307074222076696577426F783D22302030203531322E3030303030302035
            31322E303030303030220A207072657365727665417370656374526174696F3D
            22784D6964594D6964206D656574223E0A0A3C67207472616E73666F726D3D22
            7472616E736C61746528302E3030303030302C3531322E303030303030292073
            63616C6528302E3130303030302C2D302E31303030303029220A66696C6C3D22
            2330303030303022207374726F6B653D226E6F6E65223E0A3C7061746820643D
            224D343635203531303120632D3534202D3236202D343239202D343033202D34
            3530202D343533202D3138202D3434202D3139202D3835202D35202D31323520
            360A2D313620343334202D34353120393738202D393935206C393637202D3936
            38202D393732202D39373220632D393632202D393634202D393732202D393733
            202D393738202D313032300A2D3133202D38362030202D31303520323139202D
            33323720313236202D31323820323136202D32313020323431202D3232322034
            35202D3231203930202D323420313332202D392031360A362034353120343334
            2039393620393738206C3936372039363720393638202D393637206335343420
            2D35343420393739202D39373220393935202D393738203432202D3135203837
            0A2D313220313332203920323520313220313135203934203234312032323220
            3231392032323220323332203234312032313920333237202D36203437202D31
            36203536202D3937380A31303230206C2D393732203937322039363720393638
            2063353434203534342039373220393739203937382039393520313520343220
            3132203837202D3920313332202D32362035340A2D34303320343239202D3435
            3320343530202D3434203138202D3835203139202D3132352035202D3136202D
            36202D343531202D343334202D393935202D393738206C2D3936380A2D393637
            202D3936372039363720632D35343520353434202D39383020393732202D3939
            3620393738202D3432203135202D3837203132202D313332202D397A222F3E0A
            3C2F673E0A3C2F7376673E0A}
          Stretch = True
          OnClick = Image1Click
        end
        object Label8: TLabel
          Left = 16
          Top = 14
          Width = 88
          Height = 20
          Caption = 'PEND'#202'NCIAS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowFrame
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Panel9: TPanel
          Left = 16
          Top = 40
          Width = 721
          Height = 369
          BevelOuter = bvNone
          Caption = 'Panel9'
          TabOrder = 0
          object DBGridMovi: TDBGrid
            Left = 8
            Top = 10
            Width = 705
            Height = 363
            BorderStyle = bsNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'id'
                Title.Caption = '      ID'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -15
                Title.Font.Name = 'Segoe UI'
                Title.Font.Style = []
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'usuario'
                Title.Caption = '        Usu'#225'rio'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -15
                Title.Font.Name = 'Segoe UI'
                Title.Font.Style = []
                Width = 120
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'patrimonio'
                Title.Caption = '          Item'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -15
                Title.Font.Name = 'Segoe UI'
                Title.Font.Style = []
                Width = 120
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'sala_origem'
                Title.Caption = '        Origem'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -15
                Title.Font.Name = 'Segoe UI'
                Title.Font.Style = []
                Width = 120
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'sala_destino'
                Title.Caption = '       Destino'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -15
                Title.Font.Name = 'Segoe UI'
                Title.Font.Style = []
                Width = 120
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'data_movimentacao'
                Title.Caption = '         Data'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -15
                Title.Font.Name = 'Segoe UI'
                Title.Font.Style = []
                Width = 120
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'status'
                Title.Caption = '      Status'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -16
                Title.Font.Name = 'Segoe UI'
                Title.Font.Style = []
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Acoes'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -15
                Title.Font.Name = 'Segoe UI'
                Title.Font.Style = []
                Width = 160
                Visible = True
              end>
          end
        end
        object Panel10: TPanel
          Left = 176
          Top = 432
          Width = 177
          Height = 41
          BevelOuter = bvNone
          Caption = 'Panel10'
          Color = clGradientActiveCaption
          ParentBackground = False
          TabOrder = 1
          object Shape5: TShape
            Left = 0
            Top = 0
            Width = 177
            Height = 41
            Align = alClient
            Brush.Color = clGreen
            Shape = stRoundRect
            ExplicitLeft = 32
            ExplicitWidth = 65
            ExplicitHeight = 65
          end
          object Label5: TLabel
            Left = 70
            Top = 12
            Width = 40
            Height = 17
            Caption = 'Aceitar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object SpeedButton1: TSpeedButton
            Left = 0
            Top = 0
            Width = 177
            Height = 41
            Align = alClient
            Flat = True
            OnClick = SpeedButton1Click
            ExplicitLeft = 88
            ExplicitTop = 8
            ExplicitWidth = 23
            ExplicitHeight = 22
          end
        end
        object Panel11: TPanel
          Left = 392
          Top = 432
          Width = 177
          Height = 41
          BevelOuter = bvNone
          Caption = 'Panel10'
          Color = clGradientActiveCaption
          ParentBackground = False
          TabOrder = 2
          object Shape6: TShape
            Left = 0
            Top = 0
            Width = 177
            Height = 41
            Align = alClient
            Brush.Color = clRed
            Shape = stRoundRect
            ExplicitLeft = 32
            ExplicitWidth = 65
            ExplicitHeight = 65
          end
          object Label6: TLabel
            Left = 63
            Top = 11
            Width = 46
            Height = 17
            Caption = 'Recusar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object SpeedButton2: TSpeedButton
            Left = 0
            Top = 0
            Width = 177
            Height = 41
            Align = alClient
            Flat = True
            ExplicitLeft = 88
            ExplicitTop = 8
            ExplicitWidth = 23
            ExplicitHeight = 22
          end
        end
      end
    end
    object Panel3: TPanel
      Left = 1104
      Top = 136
      Width = 225
      Height = 550
      Caption = 'Panel3'
      Color = clMenu
      ParentBackground = False
      TabOrder = 1
      object Panel4: TPanel
        Left = 21
        Top = 24
        Width = 185
        Height = 497
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        object Panel6: TPanel
          Left = 12
          Top = 82
          Width = 161
          Height = 41
          BevelOuter = bvNone
          Caption = 'Panel5'
          Color = clWhite
          ParentBackground = False
          TabOrder = 0
          object Shape1: TShape
            Left = 0
            Top = 0
            Width = 161
            Height = 41
            Align = alClient
            Brush.Color = 16741948
            Shape = stRoundRect
            ExplicitLeft = 32
            ExplicitWidth = 65
            ExplicitHeight = 65
          end
          object Label2: TLabel
            Left = 61
            Top = 12
            Width = 37
            Height = 17
            Caption = 'Excluir'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object BtnExcluirMovi: TSpeedButton
            Left = 0
            Top = 0
            Width = 161
            Height = 41
            Align = alClient
            Flat = True
            ExplicitLeft = 88
            ExplicitTop = 8
            ExplicitWidth = 23
            ExplicitHeight = 22
          end
        end
        object Panel7: TPanel
          Left = 12
          Top = 146
          Width = 161
          Height = 41
          BevelOuter = bvNone
          Caption = 'Panel5'
          Color = clWhite
          ParentBackground = False
          TabOrder = 1
          object Shape2: TShape
            Left = 0
            Top = 0
            Width = 161
            Height = 41
            Align = alClient
            Brush.Color = 16741948
            Shape = stRoundRect
            ExplicitLeft = 32
            ExplicitWidth = 65
            ExplicitHeight = 65
          end
          object BtnPesquisarMovi: TSpeedButton
            Left = 0
            Top = 0
            Width = 161
            Height = 41
            Align = alClient
            Flat = True
            ExplicitLeft = 88
            ExplicitTop = 8
            ExplicitWidth = 23
            ExplicitHeight = 22
          end
          object Label3: TLabel
            Left = 53
            Top = 12
            Width = 56
            Height = 17
            Caption = 'Pesquisar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
        end
        object Panel8: TPanel
          Left = 12
          Top = 210
          Width = 161
          Height = 41
          BevelOuter = bvNone
          Caption = 'Panel5'
          Color = clWhite
          ParentBackground = False
          TabOrder = 2
          object Shape4: TShape
            Left = 0
            Top = 0
            Width = 161
            Height = 41
            Align = alClient
            Brush.Color = 16741948
            Shape = stRoundRect
            ExplicitLeft = 32
            ExplicitWidth = 65
            ExplicitHeight = 65
          end
          object BtnPendencias: TSpeedButton
            Left = 0
            Top = 0
            Width = 161
            Height = 41
            Align = alClient
            Flat = True
            OnClick = BtnPendenciasClick
            ExplicitLeft = 88
            ExplicitTop = 8
            ExplicitWidth = 23
            ExplicitHeight = 22
          end
          object Label4: TLabel
            Left = 50
            Top = 12
            Width = 65
            Height = 17
            Caption = 'Pend'#234'ncias'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
        end
        object Panel5: TPanel
          Left = 12
          Top = 18
          Width = 161
          Height = 41
          BevelOuter = bvNone
          Caption = 'Panel5'
          Color = clWhite
          ParentBackground = False
          TabOrder = 3
          object Shape3: TShape
            Left = 0
            Top = 0
            Width = 161
            Height = 41
            Align = alClient
            Brush.Color = 16741948
            Shape = stRoundRect
            ExplicitLeft = 32
            ExplicitWidth = 65
            ExplicitHeight = 65
          end
          object Label1: TLabel
            Left = 54
            Top = 12
            Width = 55
            Height = 17
            Caption = 'Adicionar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object BtnAddMovi: TSpeedButton
            Left = 0
            Top = 0
            Width = 161
            Height = 41
            Align = alClient
            Flat = True
            ExplicitLeft = 88
            ExplicitTop = 8
            ExplicitWidth = 23
            ExplicitHeight = 22
          end
        end
      end
    end
    object SearchBox1: TSearchBox
      Left = 48
      Top = 64
      Width = 393
      Height = 23
      TabOrder = 2
      TextHint = 'Pesquisar'
    end
  end
  object DataSource1: TDataSource
    Left = 992
    Top = 32
  end
end
