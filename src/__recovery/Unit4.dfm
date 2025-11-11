object FormRelatorios: TFormRelatorios
  Left = 0
  Top = 0
  Caption = 'FormRelatorios'
  ClientHeight = 872
  ClientWidth = 1375
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
    Width = 1375
    Height = 872
    Align = alClient
    BevelOuter = bvNone
    Color = 15329769
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = 608
    ExplicitTop = 464
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Panel7: TPanel
      Left = 0
      Top = 0
      Width = 1375
      Height = 65
      Align = alTop
      BevelOuter = bvNone
      Color = clHighlight
      ParentBackground = False
      TabOrder = 0
      ExplicitTop = 8
      object Label15: TLabel
        Left = 21
        Top = 20
        Width = 70
        Height = 21
        Caption = 'Relatorios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBtnFace
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
    end
    object Panel2: TPanel
      Left = 296
      Top = 184
      Width = 289
      Height = 169
      BevelOuter = bvNone
      Caption = 'Panel2'
      Color = 15329769
      ParentBackground = False
      TabOrder = 1
      object Shape1: TShape
        Left = 0
        Top = 0
        Width = 289
        Height = 169
        Align = alClient
        Pen.Style = psClear
        Shape = stRoundRect
        ExplicitLeft = 56
        ExplicitTop = 32
        ExplicitWidth = 65
        ExplicitHeight = 65
      end
    end
    object Panel3: TPanel
      Left = 648
      Top = 184
      Width = 289
      Height = 169
      BevelOuter = bvNone
      Caption = 'Panel2'
      Color = 15329769
      ParentBackground = False
      TabOrder = 2
      object Shape2: TShape
        Left = 0
        Top = 0
        Width = 289
        Height = 169
        Align = alClient
        Pen.Style = psClear
        Shape = stRoundRect
        ExplicitLeft = 56
        ExplicitTop = 32
        ExplicitWidth = 65
        ExplicitHeight = 65
      end
    end
    object Panel4: TPanel
      Left = 1000
      Top = 184
      Width = 289
      Height = 169
      BevelOuter = bvNone
      Caption = 'Panel2'
      Color = 15329769
      ParentBackground = False
      TabOrder = 3
      object Shape3: TShape
        Left = 0
        Top = 0
        Width = 289
        Height = 169
        Align = alClient
        Pen.Style = psClear
        Shape = stRoundRect
        ExplicitLeft = 56
        ExplicitTop = 32
        ExplicitWidth = 65
        ExplicitHeight = 65
      end
    end
    object DBChart1: TDBChart
      Left = 296
      Top = 400
      Width = 449
      Height = 273
      Title.Text.Strings = (
        'TDBChart')
      View3D = False
      Color = clWhite
      TabOrder = 4
      DefaultCanvas = 'TGDIPlusCanvas'
      ColorPaletteIndex = 13
      object Series1: THorizBarSeries
        HoverElement = []
        BarBrush.Gradient.Direction = gdLeftRight
        Gradient.Direction = gdLeftRight
        XValues.Name = 'Bar'
        XValues.Order = loNone
        YValues.Name = 'Y'
        YValues.Order = loAscending
      end
    end
    object DBChart2: TDBChart
      Left = 840
      Top = 400
      Width = 449
      Height = 273
      Title.Text.Strings = (
        'TDBChart')
      Color = clWhite
      TabOrder = 5
      DefaultCanvas = 'TGDIPlusCanvas'
      ColorPaletteIndex = 13
      object Series2: TFastLineSeries
        HoverElement = []
        LinePen.Color = 10708548
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
    end
    object Panel5: TPanel
      Left = 276
      Top = 62
      Width = 1
      Height = 810
      Color = clSilver
      ParentBackground = False
      TabOrder = 6
    end
    object Panel6: TPanel
      Left = 21
      Top = 152
      Width = 236
      Height = 241
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 7
      object Label1: TLabel
        Left = 42
        Top = 14
        Width = 154
        Height = 20
        Caption = 'Selecione um relatorio'
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Segoe UI Variable Text Semibold'
        Font.Style = []
        ParentFont = False
      end
      object Panel8: TPanel
        Left = 0
        Top = 43
        Width = 241
        Height = 1
        Color = clInfoText
        ParentBackground = False
        TabOrder = 0
        OnClick = Panel8Click
      end
      object ComboBox1: TComboBox
        Left = 42
        Top = 88
        Width = 150
        Height = 23
        TabOrder = 1
        Text = 'ComboBox1'
      end
      object Panel9: TPanel
        Left = 53
        Top = 151
        Width = 131
        Height = 33
        BevelOuter = bvNone
        Caption = 'Panel9'
        Color = clWhite
        ParentBackground = False
        TabOrder = 2
        object Shape4: TShape
          Left = 0
          Top = 0
          Width = 131
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
        object Label2: TLabel
          Left = 51
          Top = 9
          Width = 31
          Height = 15
          Caption = 'Salvar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
      end
    end
  end
end
