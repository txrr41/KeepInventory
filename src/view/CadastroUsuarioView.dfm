object FormCadastroUsuario: TFormCadastroUsuario
  Left = 0
  Top = 0
  Caption = 'FormCadastroUsuario'
  ClientHeight = 872
  ClientWidth = 1373
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
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
    ExplicitLeft = -8
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
      Width = 21
      Height = 15
      Caption = 'CPF'
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
      object Label15: TLabel
        Left = 21
        Top = 20
        Width = 148
        Height = 21
        Caption = 'Cadastro de Usu'#225'rios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBtnFace
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
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
      object DBGridUsuarios: TDBGrid
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
    object EdtNomeUser: TEdit
      Left = 48
      Top = 128
      Width = 121
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object EdtCPFUser: TEdit
      Left = 216
      Top = 128
      Width = 121
      Height = 23
      TabOrder = 5
    end
    object EdtTelefoneUser: TEdit
      Left = 376
      Top = 128
      Width = 121
      Height = 23
      TabOrder = 6
    end
    object EdtRGUser: TEdit
      Left = 48
      Top = 184
      Width = 121
      Height = 23
      TabOrder = 7
    end
    object EdtNascimentoUser: TEdit
      Left = 216
      Top = 184
      Width = 121
      Height = 23
      TabOrder = 8
    end
    object EdtSenhaUser: TEdit
      Left = 48
      Top = 240
      Width = 121
      Height = 23
      TabOrder = 9
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
      TabOrder = 10
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
      object BtnAddUser: TSpeedButton
        Left = 0
        Top = 0
        Width = 143
        Height = 41
        Align = alClient
        Flat = True
        OnClick = BtnAddUserClick
        ExplicitLeft = 72
        ExplicitWidth = 23
        ExplicitHeight = 22
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
      TabOrder = 11
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
      object BtnEditarUser: TSpeedButton
        Left = 0
        Top = 0
        Width = 143
        Height = 41
        Align = alClient
        Flat = True
        OnClick = BtnEditarUserClick
        ExplicitLeft = 72
        ExplicitWidth = 23
        ExplicitHeight = 22
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
      TabOrder = 12
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
      object BtnExcluirUser: TSpeedButton
        Left = 0
        Top = 0
        Width = 143
        Height = 41
        Align = alClient
        Flat = True
        OnClick = BtnExcluirUserClick
        ExplicitLeft = 72
        ExplicitWidth = 23
        ExplicitHeight = 22
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
      TabOrder = 13
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
      object BtnAtualizarUser: TSpeedButton
        Left = 0
        Top = 0
        Width = 143
        Height = 41
        Align = alClient
        Flat = True
        OnClick = BtnAtualizarUserClick
        ExplicitLeft = 72
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
    end
    object Memo1: TMemo
      Left = 48
      Top = 312
      Width = 249
      Height = 105
      Lines.Strings = (
        'Memo1')
      TabOrder = 14
    end
    object CheckCadastro: TCheckBox
      Left = 18
      Top = 624
      Width = 97
      Height = 17
      Caption = 'Cadastros'
      TabOrder = 15
      OnClick = CheckCadastroClick
    end
    object Panel9: TPanel
      Left = 34
      Top = 647
      Width = 185
      Height = 103
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 16
      object CheckCadastroEmp: TCheckBox
        Left = 6
        Top = 7
        Width = 97
        Height = 17
        Caption = 'Empresa'
        TabOrder = 0
        OnClick = CheckCadastroEmpClick
      end
      object CheckCadastroPredi: TCheckBox
        Left = 6
        Top = 30
        Width = 97
        Height = 17
        Caption = 'Predio'
        TabOrder = 1
      end
      object CheckCadastroSala: TCheckBox
        Left = 6
        Top = 53
        Width = 97
        Height = 17
        Caption = 'Sala'
        TabOrder = 2
        OnClick = CheckCadastroSalaClick
      end
      object CheckCadastroPatri: TCheckBox
        Left = 6
        Top = 76
        Width = 97
        Height = 17
        Caption = 'Patrimonio'
        TabOrder = 3
        OnClick = CheckCadastroPatriClick
      end
    end
    object Panel10: TPanel
      Left = 0
      Top = 541
      Width = 605
      Height = 44
      BevelOuter = bvNone
      Color = clHighlight
      ParentBackground = False
      TabOrder = 17
      object Label13: TLabel
        Left = 253
        Top = 12
        Width = 72
        Height = 20
        Caption = 'Permiss'#245'es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
    end
    object CheckMovimentacoes: TCheckBox
      Left = 144
      Top = 624
      Width = 111
      Height = 17
      Caption = 'Movimenta'#231#245'es'
      TabOrder = 18
      OnClick = CheckMovimentacoesClick
    end
    object Panel11: TPanel
      Left = 152
      Top = 647
      Width = 185
      Height = 103
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 19
      object CheckAnalisarMovi: TCheckBox
        Left = 6
        Top = 7
        Width = 97
        Height = 17
        Caption = 'Analisar'
        TabOrder = 0
      end
      object CheckAdicionarMovi: TCheckBox
        Left = 6
        Top = 30
        Width = 97
        Height = 17
        Caption = 'Adicionar'
        TabOrder = 1
      end
      object CheckExcluirMovi: TCheckBox
        Left = 6
        Top = 53
        Width = 97
        Height = 17
        Caption = 'Excluir'
        TabOrder = 2
      end
    end
    object CheckOcorrencias: TCheckBox
      Left = 296
      Top = 624
      Width = 111
      Height = 17
      Caption = 'Ocorr'#234'ncias'
      TabOrder = 20
      OnClick = CheckOcorrenciasClick
    end
    object Panel12: TPanel
      Left = 307
      Top = 647
      Width = 185
      Height = 103
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 21
      object CheckAnalisarOcorre: TCheckBox
        Left = 6
        Top = 7
        Width = 97
        Height = 17
        Caption = 'Analisar'
        TabOrder = 0
      end
      object CheckAdicionarOcorre: TCheckBox
        Left = 6
        Top = 30
        Width = 97
        Height = 17
        Caption = 'Adicionar'
        TabOrder = 1
      end
      object CheckExcluirOcorre: TCheckBox
        Left = 6
        Top = 53
        Width = 97
        Height = 17
        Caption = 'Excluir'
        TabOrder = 2
      end
    end
    object CheckUsuarios: TCheckBox
      Left = 436
      Top = 624
      Width = 111
      Height = 17
      Caption = 'Usuarios'
      TabOrder = 22
      OnClick = CheckUsuariosClick
    end
    object Panel13: TPanel
      Left = 444
      Top = 647
      Width = 154
      Height = 103
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 23
      object CheckCadastrarUser: TCheckBox
        Left = 6
        Top = 7
        Width = 97
        Height = 17
        Caption = 'Cadastrar'
        TabOrder = 0
      end
      object CheckPermissaoUser: TCheckBox
        Left = 6
        Top = 30
        Width = 123
        Height = 17
        Caption = 'Atribuir permiss'#245'es'
        TabOrder = 1
      end
    end
    object Panel14: TPanel
      Left = 216
      Top = 472
      Width = 143
      Height = 33
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 24
      object Shape4: TShape
        Left = 0
        Top = 0
        Width = 143
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
      object Label14: TLabel
        Left = 58
        Top = 10
        Width = 31
        Height = 15
        Caption = 'Salvar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBtnFace
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object BtnSalavarUser: TSpeedButton
        Left = 0
        Top = 0
        Width = 143
        Height = 33
        Align = alClient
        Flat = True
        OnClick = BtnSalavarUserClick
        ExplicitLeft = 80
        ExplicitTop = 8
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
    end
    object CbFuncaoUser: TComboBox
      Left = 376
      Top = 184
      Width = 145
      Height = 23
      TabOrder = 25
    end
  end
  object DataSource1: TDataSource
    Left = 1232
    Top = 88
  end
end
