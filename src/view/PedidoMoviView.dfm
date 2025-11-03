object FormPedidoMovi: TFormPedidoMovi
  Left = 0
  Top = 0
  Caption = 'FormPedidoMovi'
  ClientHeight = 822
  ClientWidth = 1374
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object PanelMoviment: TPanel
    Left = 0
    Top = 0
    Width = 1374
    Height = 822
    Align = alClient
    Color = clGradientActiveCaption
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 210
      Height = 20
      Caption = 'PEDIDOS DE MOVIMENTA'#199#213'ES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowFrame
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Panel2: TPanel
      AlignWithMargins = True
      Left = 16
      Top = 153
      Width = 1042
      Height = 515
      Margins.Left = 15
      Margins.Top = 155
      Margins.Right = 12
      Margins.Bottom = 9
      Caption = 'Panel2'
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object Panel5: TPanel
        Left = 16
        Top = 17
        Width = 1009
        Height = 480
        BevelOuter = bvNone
        Color = clMenu
        ParentBackground = False
        TabOrder = 0
        object DBGrid1: TDBGrid
          Left = 16
          Top = 16
          Width = 977
          Height = 449
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
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
            end>
        end
      end
    end
    object Panel1: TPanel
      Left = 16
      Top = 56
      Width = 1345
      Height = 81
      Margins.Top = 111
      Caption = 'Pesquisar'
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      object Label2: TLabel
        Left = 16
        Top = 6
        Width = 17
        Height = 15
        Caption = 'De:'
      end
      object Label3: TLabel
        Left = 150
        Top = 6
        Width = 21
        Height = 15
        Caption = 'At'#233':'
      end
      object SearchBox1: TSearchBox
        Left = 291
        Top = 32
        Width = 639
        Height = 23
        TabOrder = 0
        TextHint = 'Pesquisar'
        OnChange = SearchBox1Change
      end
      object Panel6: TPanel
        Left = 960
        Top = 24
        Width = 137
        Height = 33
        BevelOuter = bvNone
        Caption = 'Panel6'
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
        object Shape1: TShape
          Left = 0
          Top = 0
          Width = 137
          Height = 33
          Align = alClient
          Brush.Color = 16741948
          Shape = stRoundRect
          ExplicitLeft = 32
          ExplicitWidth = 65
          ExplicitHeight = 65
        end
        object Label4: TLabel
          Left = 52
          Top = 10
          Width = 30
          Height = 15
          Caption = 'Filtrar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
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
          ExplicitLeft = 8
          ExplicitWidth = 23
          ExplicitHeight = 22
        end
      end
      object Panel7: TPanel
        Left = 1128
        Top = 24
        Width = 137
        Height = 33
        BevelOuter = bvNone
        Caption = 'Panel6'
        Color = clWhite
        ParentBackground = False
        TabOrder = 2
        object Shape2: TShape
          Left = 0
          Top = 0
          Width = 137
          Height = 33
          Align = alClient
          Brush.Color = 16741948
          Shape = stRoundRect
          ExplicitLeft = 32
          ExplicitWidth = 65
          ExplicitHeight = 65
        end
        object Label5: TLabel
          Left = 33
          Top = 10
          Width = 72
          Height = 15
          Caption = 'Limpar Filtros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object BtnLimparFIltroMovi: TSpeedButton
          Left = 0
          Top = 0
          Width = 137
          Height = 33
          Align = alClient
          Flat = True
          ExplicitLeft = -8
        end
      end
      object CalendarPicker1: TCalendarPicker
        Left = 16
        Top = 26
        Width = 120
        Height = 32
        CalendarHeaderInfo.DaysOfWeekFont.Charset = DEFAULT_CHARSET
        CalendarHeaderInfo.DaysOfWeekFont.Color = clWindowText
        CalendarHeaderInfo.DaysOfWeekFont.Height = -13
        CalendarHeaderInfo.DaysOfWeekFont.Name = 'Segoe UI'
        CalendarHeaderInfo.DaysOfWeekFont.Style = []
        CalendarHeaderInfo.Font.Charset = DEFAULT_CHARSET
        CalendarHeaderInfo.Font.Color = clWindowText
        CalendarHeaderInfo.Font.Height = -20
        CalendarHeaderInfo.Font.Name = 'Segoe UI'
        CalendarHeaderInfo.Font.Style = []
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        TextHint = 'select a date'
      end
      object CalendarPicker2: TCalendarPicker
        Left = 142
        Top = 27
        Width = 120
        Height = 32
        CalendarHeaderInfo.DaysOfWeekFont.Charset = DEFAULT_CHARSET
        CalendarHeaderInfo.DaysOfWeekFont.Color = clWindowText
        CalendarHeaderInfo.DaysOfWeekFont.Height = -13
        CalendarHeaderInfo.DaysOfWeekFont.Name = 'Segoe UI'
        CalendarHeaderInfo.DaysOfWeekFont.Style = []
        CalendarHeaderInfo.Font.Charset = DEFAULT_CHARSET
        CalendarHeaderInfo.Font.Color = clWindowText
        CalendarHeaderInfo.Font.Height = -20
        CalendarHeaderInfo.Font.Name = 'Segoe UI'
        CalendarHeaderInfo.Font.Style = []
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        TextHint = 'select a date'
      end
    end
    object PanelAddMovi: TPanel
      AlignWithMargins = True
      Left = 16
      Top = 680
      Width = 1345
      Height = 127
      Margins.Left = 15
      Margins.Right = 12
      Margins.Bottom = 1
      Color = clWhite
      ParentBackground = False
      TabOrder = 2
      Visible = False
      object Label10: TLabel
        Left = 40
        Top = 35
        Width = 24
        Height = 15
        Caption = 'Item'
      end
      object Label11: TLabel
        Left = 315
        Top = 35
        Width = 40
        Height = 15
        Caption = 'Destino'
      end
      object Label14: TLabel
        Left = 180
        Top = 35
        Width = 40
        Height = 15
        Caption = 'Origem'
      end
      object CbItemMovi: TComboBox
        Left = 40
        Top = 56
        Width = 113
        Height = 23
        TabOrder = 0
        OnChange = CbItemMoviChange
      end
      object CbDestinoMovi: TComboBox
        Left = 315
        Top = 56
        Width = 113
        Height = 23
        TabOrder = 1
      end
      object CbOrigemMovi: TComboBox
        Left = 180
        Top = 56
        Width = 113
        Height = 23
        TabOrder = 2
      end
      object Button1: TButton
        Left = 1144
        Top = 49
        Width = 124
        Height = 33
        Caption = 'Enviar'
        TabOrder = 3
        Visible = False
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 1144
        Top = 18
        Width = 124
        Height = 33
        Caption = 'Confirmar Altera'#231#227'o'
        TabOrder = 4
        Visible = False
        OnClick = Button2Click
      end
    end
    object Panel3: TPanel
      Left = 1102
      Top = 153
      Width = 256
      Height = 515
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 3
      object Panel4: TPanel
        Left = 16
        Top = 17
        Width = 225
        Height = 480
        BevelOuter = bvNone
        Color = clMenu
        ParentBackground = False
        TabOrder = 0
        object Panel9: TPanel
          Left = 23
          Top = 34
          Width = 185
          Height = 41
          BevelOuter = bvNone
          Caption = 'Panel9'
          Color = clWhite
          ParentBackground = False
          TabOrder = 0
          object Shape3: TShape
            Left = 0
            Top = 0
            Width = 185
            Height = 41
            Align = alClient
            Brush.Color = 16741948
            Shape = stRoundRect
            ExplicitLeft = 32
            ExplicitWidth = 65
            ExplicitHeight = 65
          end
          object Label6: TLabel
            Left = 61
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
          object BtnAdicionarMovi: TSpeedButton
            Left = 0
            Top = 0
            Width = 185
            Height = 41
            Align = alClient
            Flat = True
            OnClick = BtnAdicionarMoviClick
            ExplicitLeft = 8
            ExplicitWidth = 23
            ExplicitHeight = 22
          end
        end
        object Panel10: TPanel
          Left = 23
          Top = 113
          Width = 185
          Height = 41
          BevelOuter = bvNone
          Caption = 'Panel9'
          Color = clWhite
          ParentBackground = False
          TabOrder = 1
          object Shape4: TShape
            Left = 0
            Top = 0
            Width = 185
            Height = 41
            Align = alClient
            Brush.Color = 16741948
            Shape = stRoundRect
            ExplicitLeft = 32
            ExplicitWidth = 65
            ExplicitHeight = 65
          end
          object Label7: TLabel
            Left = 75
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
          object BtnEditarMovi: TSpeedButton
            Left = 0
            Top = 0
            Width = 185
            Height = 41
            Align = alClient
            Flat = True
            OnClick = BtnEditarMoviClick
            ExplicitLeft = 8
            ExplicitWidth = 23
            ExplicitHeight = 22
          end
        end
        object Panel11: TPanel
          Left = 23
          Top = 193
          Width = 185
          Height = 41
          BevelOuter = bvNone
          Caption = 'Panel9'
          Color = clWhite
          ParentBackground = False
          TabOrder = 2
          object Shape5: TShape
            Left = 0
            Top = 0
            Width = 185
            Height = 41
            Align = alClient
            Brush.Color = 16741948
            Shape = stRoundRect
            ExplicitLeft = 32
            ExplicitWidth = 65
            ExplicitHeight = 65
          end
          object Label8: TLabel
            Left = 71
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
          object BtnExcluirMovi: TSpeedButton
            Left = 0
            Top = 0
            Width = 185
            Height = 41
            Align = alClient
            Flat = True
            OnClick = BtnExcluirMoviClick
            ExplicitLeft = 8
            ExplicitWidth = 23
            ExplicitHeight = 22
          end
        end
        object Panel12: TPanel
          Left = 23
          Top = 272
          Width = 185
          Height = 41
          BevelOuter = bvNone
          Caption = 'Panel9'
          Color = clWhite
          ParentBackground = False
          TabOrder = 3
          object Shape6: TShape
            Left = 0
            Top = 0
            Width = 185
            Height = 41
            Align = alClient
            Brush.Color = 16741948
            Shape = stRoundRect
            ExplicitTop = 24
          end
          object Label9: TLabel
            Left = 61
            Top = 11
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
          object BtnAtualizarMovi: TSpeedButton
            Left = 0
            Top = 0
            Width = 185
            Height = 41
            Align = alClient
            Flat = True
            OnClick = BtnAtualizarMoviClick
            ExplicitTop = 24
          end
        end
      end
    end
  end
  object DataSource1: TDataSource
    Left = 992
    Top = 8
  end
end
