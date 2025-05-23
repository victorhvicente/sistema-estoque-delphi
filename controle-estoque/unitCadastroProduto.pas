unit unitCadastroProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Mask, DBCtrls, Buttons, DB;

type
  TformCadastroProduto = class(TForm)
    Label1: TLabel;
    btnInserir: TBitBtn;
    btnEditar: TBitBtn;
    btnExcluir: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    inputNomeProduto: TDBEdit;
    inputValidade: TDBEdit;
    DBEdit4: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBGrid1: TDBGrid;
    inputFabricante: TDBEdit;
    Label4: TLabel;
    totalProdutos: TLabel;

    procedure inputNomeProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure btnInserirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure limparTela;
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formCadastroProduto: TformCadastroProduto;

implementation

uses unitDM;

{$R *.dfm}

procedure TformCadastroProduto.inputNomeProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  Key := UpCase(Key);  // Converte para maiúscula
end;

procedure TformCadastroProduto.DBEdit2KeyPress(Sender: TObject; var Key: Char);
begin
  Key := UpCase(Key);  // Converte para maiúscula
end;

procedure TformCadastroProduto.btnInserirClick(Sender: TObject);
begin
  // Inicia inserção no dataset
  DM.tbProdutos.Insert;
  inputNomeProduto.setFocus;
  totalProdutos.Caption := IntToStr(DM.tbProdutos.RecordCount);
end;

procedure TformCadastroProduto.btnGravarClick(Sender: TObject);
begin
  // Verifica se está em modo de inserção ou edição antes de postar
  if (DM.tbProdutos.State in [dsInsert, dsEdit]) then
    DM.tbProdutos.Post;
end;

procedure TformCadastroProduto.limparTela;
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TDBEdit then
      TDBEdit(Components[i]).Clear;
  end;
end;

procedure TformCadastroProduto.FormShow(Sender: TObject);
begin
  limparTela; // Limpa os campos ao exibir o formulário
  DM.tbProdutos.Insert;
   totalProdutos.Caption := IntToStr(DM.tbProdutos.RecordCount);
end;

procedure TformCadastroProduto.btnCancelarClick(Sender: TObject);
begin
   DM.tbProdutos.Cancel;
end;

procedure TformCadastroProduto.btnEditarClick(Sender: TObject);
begin
   DM.tbProdutos.Edit;
   inputNomeProduto.setFocus;
end;

procedure TformCadastroProduto.btnExcluirClick(Sender: TObject);
begin
   DM.tbProdutos.Delete;
   totalProdutos.Caption := IntToStr(DM.tbProdutos.RecordCount);
end;

end.

