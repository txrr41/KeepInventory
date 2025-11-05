unit CadastroUsuarioView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.Buttons;

type
  TForm4 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel7: TPanel;
    Panel3: TPanel;
    SearchBox1: TSearchBox;
    DBGridUsuarios: TDBGrid;
    EdtNomeUser: TEdit;
    EdtCPFUser: TEdit;
    EdtTelefoneUser: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EdtRGUser: TEdit;
    Label4: TLabel;
    EdtNascimentoUser: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    EdtSenhaUser: TEdit;
    Label7: TLabel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel8: TPanel;
    Shape29: TShape;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Memo1: TMemo;
    Label12: TLabel;
    CheckCadastro: TCheckBox;
    Panel9: TPanel;
    CheckCadastroEmp: TCheckBox;
    CheckBox3: TCheckBox;
    CheckCadastroSala: TCheckBox;
    CheckCadastroPatri: TCheckBox;
    Panel10: TPanel;
    CheckMovimentacoes: TCheckBox;
    Panel11: TPanel;
    CheckAnalisarMovi: TCheckBox;
    CheckAdicionarMovi: TCheckBox;
    CheckExcluirMovi: TCheckBox;
    CheckOcorrencias: TCheckBox;
    Panel12: TPanel;
    CheckAnalisarOcorre: TCheckBox;
    CheckAdicionarOcorre: TCheckBox;
    CheckExcluirOcorre: TCheckBox;
    CheckUsuarios: TCheckBox;
    Panel13: TPanel;
    CheckCadastrarUser: TCheckBox;
    CheckPermissaoUser: TCheckBox;
    Label13: TLabel;
    Panel14: TPanel;
    Shape4: TShape;
    Label14: TLabel;
    Label15: TLabel;
    CbFuncaoUser: TComboBox;
    BtnSalavarUser: TSpeedButton;
    BtnAddUser: TSpeedButton;
    BtnEditarUser: TSpeedButton;
    BtnExcluirUser: TSpeedButton;
    BtnAtualizarUser: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

end.
