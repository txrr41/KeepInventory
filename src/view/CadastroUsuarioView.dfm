object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Form4'
  ClientHeight = 872
  ClientWidth = 1373
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
    Width = 1373
    Height = 872
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = 496
    ExplicitTop = 248
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Label1: TLabel
      Left = 48
      Top = 107
      Width = 33
      Height = 15
      Caption = 'Nome'
    end
    object Label2: TLabel
      Left = 216
      Top = 107
      Width = 19
      Height = 15
      Caption = 'Cpf'
    end
    object Label3: TLabel
      Left = 376
      Top = 107
      Width = 45
      Height = 15
      Caption = 'Telefone'
    end
    object Label4: TLabel
      Left = 48
      Top = 163
      Width = 14
      Height = 15
      Caption = 'Rg'
    end
    object Label5: TLabel
      Left = 216
      Top = 163
      Width = 107
      Height = 15
      Caption = 'Data de Nascimento'
    end
    object Label6: TLabel
      Left = 376
      Top = 163
      Width = 76
      Height = 15
      Caption = 'Cargo/Fun'#231#227'o'
    end
    object Label7: TLabel
      Left = 48
      Top = 219
      Width = 32
      Height = 15
      Caption = 'Senha'
    end
    object Label12: TLabel
      Left = 48
      Top = 291
      Width = 67
      Height = 15
      Caption = 'Observa'#231#245'es'
    end
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 1373
      Height = 65
      Align = alTop
      BevelOuter = bvNone
      Color = clHighlight
      ParentBackground = False
      TabOrder = 0
    end
    object Panel7: TPanel
      Left = 604
      Top = 65
      Width = 1
      Height = 810
      Color = clSilver
      ParentBackground = False
      TabOrder = 1
    end
    object Panel3: TPanel
      Left = 633
      Top = 160
      Width = 721
      Height = 401
      BevelOuter = bvNone
      Color = 10066329
      ParentBackground = False
      TabOrder = 2
      object DBGrid1: TDBGrid
        Left = 1
        Top = 1
        Width = 719
        Height = 399
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
    end
    object SearchBox1: TSearchBox
      Left = 633
      Top = 95
      Width = 352
      Height = 28
      Cursor = crIBeam
      BevelOuter = bvNone
      BorderStyle = bsNone
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 3
      TextHint = 'Pesquisar'
    end
    object Edit1: TEdit
      Left = 48
      Top = 128
      Width = 121
      Height = 23
      TabOrder = 4
      Text = 'Edit1'
    end
    object Edit2: TEdit
      Left = 216
      Top = 128
      Width = 121
      Height = 23
      TabOrder = 5
      Text = 'Edit2'
    end
    object Edit3: TEdit
      Left = 376
      Top = 128
      Width = 121
      Height = 23
      TabOrder = 6
      Text = 'Edit3'
    end
    object Edit4: TEdit
      Left = 48
      Top = 184
      Width = 121
      Height = 23
      TabOrder = 7
      Text = 'Edit3'
    end
    object Edit5: TEdit
      Left = 216
      Top = 184
      Width = 121
      Height = 23
      TabOrder = 8
      Text = 'Edit3'
    end
    object Edit6: TEdit
      Left = 376
      Top = 184
      Width = 121
      Height = 23
      TabOrder = 9
      Text = 'Edit3'
    end
    object Edit7: TEdit
      Left = 48
      Top = 240
      Width = 121
      Height = 23
      TabOrder = 10
      Text = 'Edit7'
    end
    object Panel4: TPanel
      Left = 648
      Top = 584
      Width = 143
      Height = 41
      BevelOuter = bvNone
      Caption = 'Panel4'
      Color = clWhite
      ParentBackground = False
      TabOrder = 11
      object Shape29: TShape
        Left = 0
        Top = 0
        Width = 143
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
      object Label8: TLabel
        Left = 46
        Top = 13
        Width = 51
        Height = 15
        Caption = 'Adicionar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBtnFace
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
    end
    object Panel5: TPanel
      Left = 831
      Top = 584
      Width = 143
      Height = 41
      BevelOuter = bvNone
      Caption = 'Panel4'
      Color = clWhite
      ParentBackground = False
      TabOrder = 12
      object Shape1: TShape
        Left = 0
        Top = 0
        Width = 143
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
      object Label9: TLabel
        Left = 54
        Top = 13
        Width = 30
        Height = 15
        Caption = 'Editar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBtnFace
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
    end
    object Panel6: TPanel
      Left = 1013
      Top = 584
      Width = 143
      Height = 41
      BevelOuter = bvNone
      Caption = 'Panel4'
      Color = clWhite
      ParentBackground = False
      TabOrder = 13
      object Shape2: TShape
        Left = 0
        Top = 0
        Width = 143
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
      object Label10: TLabel
        Left = 54
        Top = 13
        Width = 34
        Height = 15
        Caption = 'Excluir'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBtnFace
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
    end
    object Panel8: TPanel
      Left = 1191
      Top = 584
      Width = 143
      Height = 41
      BevelOuter = bvNone
      Caption = 'Panel4'
      Color = clWhite
      ParentBackground = False
      TabOrder = 14
      object Shape3: TShape
        Left = 0
        Top = 0
        Width = 143
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
      object Label11: TLabel
        Left = 46
        Top = 13
        Width = 46
        Height = 15
        Caption = 'Atualizar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBtnFace
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
    end
    object Memo1: TMemo
      Left = 48
      Top = 312
      Width = 404
      Height = 209
      Lines.Strings = (
        'Memo1')
      TabOrder = 15
    end
  end
end
