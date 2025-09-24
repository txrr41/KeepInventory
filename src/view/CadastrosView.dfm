object FormCadastro: TFormCadastro
  Left = 0
  Top = 0
  Caption = 'FormCadastro'
  ClientHeight = 728
  ClientWidth = 1387
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object PanelCadastro: TPanel
    Left = 0
    Top = 0
    Width = 1390
    Height = 767
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
      Top = 10
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
      Left = -8
      Top = 72
      Width = 1398
      Height = 664
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
      object TabSheet1: TTabSheet
        ParentCustomHint = False
        Caption = 'Empresa'
        DoubleBuffered = False
        ParentDoubleBuffered = False
        ParentShowHint = False
        ShowHint = False
        object Panel2: TPanel
          Left = 88
          Top = 80
          Width = 921
          Height = 417
          Caption = 'Panel2'
          Color = clMenu
          ParentBackground = False
          TabOrder = 0
          object DBGrid1: TDBGrid
            Left = 16
            Top = 16
            Width = 889
            Height = 385
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -15
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
          end
        end
        object Panel3: TPanel
          Left = 0
          Top = 503
          Width = 1390
          Height = 106
          Align = alBottom
          Caption = 'Panel3'
          TabOrder = 1
          ExplicitLeft = -3
        end
        object Panel4: TPanel
          Left = 1075
          Top = 80
          Width = 206
          Height = 417
          Color = clMenu
          ParentBackground = False
          TabOrder = 2
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
              Brush.Color = clCornflowerblue
              Pen.Style = psClear
              Shape = stRoundRect
              ExplicitLeft = 24
              ExplicitTop = 16
              ExplicitWidth = 65
              ExplicitHeight = 65
            end
            object SpeedButton1: TSpeedButton
              Left = 0
              Top = 0
              Width = 161
              Height = 41
              Align = alClient
              Flat = True
              ExplicitLeft = 64
              ExplicitTop = 16
              ExplicitWidth = 23
              ExplicitHeight = 22
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
          end
          object Panel6: TPanel
            Left = 24
            Top = 96
            Width = 161
            Height = 41
            BevelOuter = bvNone
            Caption = 'Panel5'
            ParentBackground = False
            TabOrder = 1
            object Shape2: TShape
              Left = 0
              Top = 0
              Width = 161
              Height = 41
              Align = alClient
              Brush.Color = clCornflowerblue
              Pen.Style = psClear
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
              ExplicitLeft = 64
              ExplicitTop = 16
              ExplicitWidth = 23
              ExplicitHeight = 22
            end
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
          end
          object Panel7: TPanel
            Left = 24
            Top = 168
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
              Brush.Color = clCornflowerblue
              Pen.Style = psClear
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
              ExplicitLeft = 64
              ExplicitTop = 16
              ExplicitWidth = 23
              ExplicitHeight = 22
            end
            object Label4: TLabel
              Left = 58
              Top = 10
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
            Left = 24
            Top = 240
            Width = 161
            Height = 41
            BevelOuter = bvNone
            Caption = 'Panel5'
            ParentBackground = False
            TabOrder = 3
            object Shape4: TShape
              Left = 0
              Top = 0
              Width = 161
              Height = 41
              Align = alClient
              Brush.Color = clCornflowerblue
              Pen.Style = psClear
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
              ExplicitLeft = 64
              ExplicitTop = 16
              ExplicitWidth = 23
              ExplicitHeight = 22
            end
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
          end
          object Panel9: TPanel
            Left = 24
            Top = 312
            Width = 161
            Height = 41
            BevelOuter = bvNone
            Caption = 'Panel5'
            ParentBackground = False
            TabOrder = 4
            object Shape5: TShape
              Left = 0
              Top = 0
              Width = 161
              Height = 41
              Align = alClient
              Brush.Color = clCornflowerblue
              Pen.Style = psClear
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
              ExplicitLeft = 64
              ExplicitTop = 16
              ExplicitWidth = 23
              ExplicitHeight = 22
            end
            object Label6: TLabel
              Left = 62
              Top = 9
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
        end
        object SearchBox1: TSearchBox
          Left = 88
          Top = 23
          Width = 385
          Height = 34
          TabOrder = 3
          Text = 'SearchBox1'
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Pr'#233'dio'
        ImageIndex = 1
      end
      object TabSheet3: TTabSheet
        Caption = 'Sala'
        ImageIndex = 2
      end
      object TabSheet4: TTabSheet
        Caption = 'Patrimonio'
        ImageIndex = 3
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
end
