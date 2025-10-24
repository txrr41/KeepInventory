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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1374
    Height = 822
    Align = alClient
    Color = clGradientActiveCaption
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = -8
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
        Top = 30
        Width = 185
        Height = 497
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        object Panel5: TPanel
          Left = 12
          Top = 18
          Width = 161
          Height = 41
          BevelOuter = bvNone
          Caption = 'Panel5'
          Color = clWhite
          ParentBackground = False
          TabOrder = 0
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
          object SpeedButton1: TSpeedButton
            Left = 0
            Top = 0
            Width = 161
            Height = 41
            Align = alClient
            ExplicitLeft = 88
            ExplicitTop = 8
            ExplicitWidth = 23
            ExplicitHeight = 22
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
        end
        object Panel6: TPanel
          Left = 12
          Top = 82
          Width = 161
          Height = 41
          BevelOuter = bvNone
          Caption = 'Panel5'
          Color = clWhite
          ParentBackground = False
          TabOrder = 1
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
          object SpeedButton2: TSpeedButton
            Left = 0
            Top = 0
            Width = 161
            Height = 41
            Align = alClient
            ExplicitLeft = 88
            ExplicitTop = 8
            ExplicitWidth = 23
            ExplicitHeight = 22
          end
          object Label2: TLabel
            Left = 61
            Top = 12
            Width = 34
            Height = 17
            Caption = 'Editar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
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
          TabOrder = 2
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
          object SpeedButton3: TSpeedButton
            Left = 0
            Top = 0
            Width = 161
            Height = 41
            Align = alClient
            ExplicitLeft = 88
            ExplicitTop = 8
            ExplicitWidth = 23
            ExplicitHeight = 22
          end
          object Label3: TLabel
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
          TabOrder = 3
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
          object SpeedButton4: TSpeedButton
            Left = 0
            Top = 0
            Width = 161
            Height = 41
            Align = alClient
            ExplicitLeft = 88
            ExplicitTop = 8
            ExplicitWidth = 23
            ExplicitHeight = 22
          end
          object Label4: TLabel
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
      end
    end
    object SearchBox1: TSearchBox
      Left = 48
      Top = 64
      Width = 385
      Height = 25
      TabOrder = 2
      TextHint = 'Pesquisar'
    end
  end
end
