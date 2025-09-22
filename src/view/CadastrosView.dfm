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
    Color = clInactiveCaption
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Consolas'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 10
      Width = 144
      Height = 45
      Caption = 'Cadastros'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -32
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
    end
    object PageControl1: TPageControl
      Left = -8
      Top = 72
      Width = 1398
      Height = 664
      ActivePage = TabSheet4
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
