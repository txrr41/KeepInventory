object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Form4'
  ClientHeight = 822
  ClientWidth = 1374
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
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
    ExplicitLeft = 8
    object Label1: TLabel
      Left = 16
      Top = 24
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
      Left = 16
      Top = 170
      Width = 1345
      Height = 527
      Caption = 'Panel2'
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object Panel3: TPanel
        Left = 1012
        Top = 22
        Width = 256
        Height = 485
        BevelOuter = bvNone
        TabOrder = 0
        object Panel4: TPanel
          Left = 16
          Top = 13
          Width = 225
          Height = 457
          BevelOuter = bvNone
          Color = clWhite
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
              ExplicitLeft = 32
              ExplicitWidth = 65
              ExplicitHeight = 65
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
          end
        end
      end
      object Panel5: TPanel
        Left = 32
        Top = 23
        Width = 898
        Height = 485
        BevelOuter = bvNone
        TabOrder = 1
        object Panel8: TPanel
          Left = 16
          Top = 13
          Width = 865
          Height = 457
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 0
          object DBGrid1: TDBGrid
            Left = 0
            Top = 0
            Width = 865
            Height = 457
            BorderStyle = bsNone
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
          end
        end
      end
    end
    object Panel1: TPanel
      Left = 16
      Top = 64
      Width = 1345
      Height = 81
      Caption = 'Pesquisar'
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      object Label2: TLabel
        Left = 16
        Top = 6
        Width = 17
        Height = 13
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
        Top = 26
        Width = 639
        Height = 31
        TabOrder = 0
        TextHint = 'Pesquisar'
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
        object SpeedButton2: TSpeedButton
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
        Left = 146
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
        TabOrder = 4
        TextHint = 'select a date'
      end
    end
  end
end
