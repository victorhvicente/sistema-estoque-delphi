unit unitPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls;

type
  TformPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Sistema1: TMenuItem;
    Sair1: TMenuItem;
    Cadastros1: TMenuItem;
    CadastrosdeProdutos1: TMenuItem;
    Movimentaes1: TMenuItem;
    GerenciarMovimentaes1: TMenuItem;
    ConsultarMovimentaes1: TMenuItem;
    imagemFormPrincipal: TImage;
    procedure Sair1Click(Sender: TObject);
    procedure CadastrosdeProdutos1Click(Sender: TObject);
    procedure GerenciarMovimentaes1Click(Sender: TObject);
    procedure ConsultarMovimentaes1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formPrincipal: TformPrincipal;

implementation

uses unitCadastroProduto, unitCadastroMovimentacao,
  unitConsultaMovimentacao;

{$R *.dfm}

procedure TformPrincipal.Sair1Click(Sender: TObject);
begin
    if(Application.MessageBox('Deseja realmente sair?','Atenção', MB_ICONQUESTION+MB_YESNO) = mryes) then
      begin
         Application.Terminate;
      end;
end;

procedure TformPrincipal.CadastrosdeProdutos1Click(Sender: TObject);
begin
   formCadastroProduto.ShowModal;
end;

procedure TformPrincipal.GerenciarMovimentaes1Click(Sender: TObject);
begin
   formCadastroMovimentacao.ShowModal;
end;

procedure TformPrincipal.ConsultarMovimentaes1Click(Sender: TObject);
begin
   formConsultaMovimentacao.ShowModal();
end;

end.
