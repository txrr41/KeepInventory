object FormRegistrarOcorrencia: TFormRegistrarOcorrencia
  Left = 0
  Top = 0
  Caption = 'FormRegistrarOcorrencia'
  ClientHeight = 872
  ClientWidth = 1374
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1374
    Height = 872
    Align = alClient
    Caption = 'Panel1'
    Color = clActiveCaption
    ParentBackground = False
    TabOrder = 0
    object Shape26: TShape
      Left = 1105
      Top = 176
      Width = 233
      Height = 498
      Pen.Style = psClear
    end
    object Shape27: TShape
      Left = 60
      Top = 176
      Width = 981
      Height = 498
      Pen.Style = psClear
    end
    object Label7: TLabel
      Left = 40
      Top = 32
      Width = 193
      Height = 20
      Caption = 'REGISTRO DE OCORR'#202'NCIAS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowFrame
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Panel27: TPanel
      Left = 1119
      Top = 190
      Width = 209
      Height = 421
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object Panel28: TPanel
        Left = 24
        Top = 24
        Width = 161
        Height = 41
        BevelOuter = bvNone
        Caption = 'Panel5'
        ParentBackground = False
        TabOrder = 0
        object Shape28: TShape
          Left = 0
          Top = 0
          Width = 161
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
        object Label51: TLabel
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
        object BtnAdicionarPatrimonio: TSpeedButton
          Left = 0
          Top = 0
          Width = 161
          Height = 41
          Align = alClient
          Flat = True
          OnClick = BtnAdicionarPatrimonioClick
          ExplicitTop = 8
          ExplicitHeight = 33
        end
      end
      object Panel29: TPanel
        Left = 24
        Top = 102
        Width = 161
        Height = 41
        BevelOuter = bvNone
        Caption = 'Panel5'
        ParentBackground = False
        TabOrder = 1
        object Label52: TLabel
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
        object Label53: TLabel
          Left = 102
          Top = 21
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
        object Shape29: TShape
          Left = 0
          Top = 0
          Width = 161
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
        object Label54: TLabel
          Left = 59
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
        object SpeedButton1: TSpeedButton
          Left = 0
          Top = 0
          Width = 161
          Height = 41
          Align = alClient
          Flat = True
          ExplicitTop = 16
        end
      end
      object Panel30: TPanel
        Left = 24
        Top = 181
        Width = 161
        Height = 41
        BevelOuter = bvNone
        Caption = 'Panel5'
        ParentBackground = False
        TabOrder = 2
        object Shape30: TShape
          Left = 0
          Top = 0
          Width = 161
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
        object BtnExcluir: TSpeedButton
          Left = 0
          Top = 0
          Width = 161
          Height = 41
          Align = alClient
          Flat = True
          OnClick = BtnExcluirClick
          ExplicitTop = 16
        end
        object Label69: TLabel
          Left = 59
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
      object Panel31: TPanel
        Left = 24
        Top = 344
        Width = 161
        Height = 41
        BevelOuter = bvNone
        Caption = 'Panel5'
        ParentBackground = False
        TabOrder = 3
        object Label70: TLabel
          Left = 57
          Top = 18
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
        object Shape31: TShape
          Left = 0
          Top = 0
          Width = 161
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
          Width = 161
          Height = 41
          Align = alClient
          Flat = True
          ExplicitTop = 16
        end
        object Label71: TLabel
          Left = 60
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
      object Panel32: TPanel
        Left = 24
        Top = 260
        Width = 161
        Height = 41
        BevelOuter = bvNone
        Caption = 'Panel5'
        ParentBackground = False
        TabOrder = 4
        object Label72: TLabel
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
        object Label73: TLabel
          Left = 65
          Top = 21
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
        object Label74: TLabel
          Left = 73
          Top = 21
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
        object Label75: TLabel
          Left = 89
          Top = 21
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
        object Label76: TLabel
          Left = 97
          Top = 21
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
        object Shape32: TShape
          Left = 0
          Top = 0
          Width = 161
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
          Width = 161
          Height = 41
          Align = alClient
          Flat = True
          OnClick = SpeedButton5Click
          ExplicitTop = 16
        end
        object Label77: TLabel
          Left = 52
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
    end
    object SearchBox1: TSearchBox
      Left = 60
      Top = 102
      Width = 385
      Height = 28
      Cursor = crIBeam
      BevelOuter = bvNone
      BorderStyle = bsNone
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 1
      TextHint = 'Pesquisar'
    end
    object Panel2: TPanel
      Left = 80
      Top = 193
      Width = 938
      Height = 459
      BevelOuter = bvNone
      Caption = 'Panel2'
      Color = clMenu
      ParentBackground = False
      TabOrder = 2
      object DBGridMinhasOcorrencias: TDBGrid
        Left = 16
        Top = 16
        Width = 897
        Height = 425
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnCellClick = DBGridMinhasOcorrenciasCellClick
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            Title.Caption = '       ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'usuario'
            Title.Caption = '           Usu'#225'rio'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'item'
            Title.Caption = '              Item'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'tipo_ocorrencia'
            ReadOnly = True
            Title.Caption = '              Tipo'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Title.Caption = '                     Descri'#231#227'o'
            Width = 189
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'data_ocorrencia'
            Title.Caption = '                    Data'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'status'
            Title.Caption = '             Status'
            Width = 120
            Visible = True
          end>
      end
    end
    object Panel3: TPanel
      Left = 312
      Top = 217
      Width = 497
      Height = 411
      Color = clWhite
      ParentBackground = False
      TabOrder = 3
      Visible = False
      object Label2: TLabel
        Left = 32
        Top = 83
        Width = 24
        Height = 15
        Caption = 'Item'
      end
      object Label3: TLabel
        Left = 192
        Top = 83
        Width = 24
        Height = 15
        Caption = 'Tipo'
      end
      object Label4: TLabel
        Left = 25
        Top = 155
        Width = 90
        Height = 15
        Caption = 'O que aconteceu'
      end
      object SpeedButton2: TSpeedButton
        Left = 240
        Top = 192
        Width = 23
        Height = 22
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 505
        Height = 57
        Color = clHighlight
        ParentBackground = False
        TabOrder = 0
        object Label1: TLabel
          Left = 22
          Top = 21
          Width = 135
          Height = 20
          Caption = 'Registrar Ocorr'#234'ncia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Image1: TImage
          Left = 456
          Top = 8
          Width = 30
          Height = 29
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
            00200806000000737A7AF4000000097048597300000B1300000B1301009A9C18
            0000010B4944415478DAED96310E02211045A1B7568F6062ED01F416969E424B
            3D8FADAD7A002FA01EC078004B0D7E922DC86617E60F895840F233C58699C700
            7FB1A6F0B015A002C43E3AE706D6DA574E81540E1B99B8455842732478288B8F
            108ED001393662004F8D708126D0B5817892C5C708E720C7ACAB13B10E0C114E
            D014BA339D0856EEE7DEA045DFDCD419A02198E2490016822D2E029042688A8B
            015210DAE214401F04F4D116A7011A88F6F53226E3BAAAACB8D509A359792E40
            B8E77E503E910550740BBA4E3BF4364AC7A40062572DC7B6A54694BCE75A0889
            158B4D460391FA19D10EC742C47EC76A7B6520FEFA41B24658312B8F74628F1C
            3B7107C24E147B94FE6A54800AF005B1D8E0214A97E72D0000000049454E44AE
            426082}
          Stretch = True
          OnClick = Image1Click
        end
      end
      object CbPatrimonio: TComboBox
        Left = 32
        Top = 104
        Width = 113
        Height = 23
        TabOrder = 1
      end
      object CbTipoOcorrencia: TComboBox
        Left = 192
        Top = 104
        Width = 113
        Height = 23
        TabOrder = 2
      end
      object MemoDescricao: TMemo
        Left = 25
        Top = 176
        Width = 451
        Height = 169
        Lines.Strings = (
          'MemoDescricao')
        TabOrder = 3
      end
      object Panel5: TPanel
        Left = 88
        Top = 362
        Width = 137
        Height = 33
        BevelOuter = bvNone
        Caption = 'Panel4'
        Color = clWhite
        ParentBackground = False
        TabOrder = 4
        object Shape2: TShape
          Left = 0
          Top = 0
          Width = 137
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
        object BtnRegistrar: TSpeedButton
          Left = 0
          Top = 0
          Width = 137
          Height = 33
          Align = alClient
          Flat = True
          OnClick = BtnRegistrarClick
          ExplicitTop = 16
          ExplicitWidth = 161
          ExplicitHeight = 41
        end
        object Label5: TLabel
          Left = 49
          Top = 7
          Width = 40
          Height = 20
          Caption = 'Salvar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
      end
      object Panel6: TPanel
        Left = 264
        Top = 362
        Width = 137
        Height = 33
        BevelOuter = bvNone
        Caption = 'Panel4'
        Color = clWhite
        ParentBackground = False
        TabOrder = 5
        object Shape1: TShape
          Left = 0
          Top = 0
          Width = 137
          Height = 33
          Align = alClient
          Brush.Color = clRed
          Pen.Style = psInsideFrame
          Shape = stRoundRect
          ExplicitLeft = 24
          ExplicitTop = 16
          ExplicitWidth = 65
          ExplicitHeight = 65
        end
        object Label6: TLabel
          Left = 41
          Top = 6
          Width = 57
          Height = 20
          Caption = 'Cancelar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object BtnCancelar: TSpeedButton
          Left = 0
          Top = 0
          Width = 137
          Height = 33
          Align = alClient
          Flat = True
          OnClick = BtnCancelarClick
          ExplicitTop = 16
          ExplicitWidth = 161
          ExplicitHeight = 41
        end
      end
    end
  end
  object DataSource1: TDataSource
    Left = 784
    Top = 80
  end
end
