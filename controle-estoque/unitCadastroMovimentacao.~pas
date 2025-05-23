unit unitCadastroMovimentacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, DBCtrls, Mask, DB, ExtCtrls;

type
  TformCadastroMovimentacao = class(TForm)
    inputDataHora: TDBEdit;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    cbTipo: TDBComboBox;
    DBMemo1: TDBMemo;
    Label2: TLabel;
    Label5: TLabel;
    btnInserir: TBitBtn;
    btnEditar: TBitBtn;
    btnExcluir: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    Label6: TLabel;
    Label9: TLabel;
    DBNavigator1: TDBNavigator;
    Label8: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit1: TDBEdit;
    Label10: TLabel;
    DBGrid2: TDBGrid;
    Label11: TLabel;
    lbTotalProdutos: TLabel;
    DBGrid3: TDBGrid;
    procedure btnInserirClick(Sender: TObject);
    procedure limparTela;
    procedure FormShow(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure inputDataHoraClick(Sender: TObject);
    procedure DBEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure DBMemo1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formCadastroMovimentacao: TformCadastroMovimentacao;

implementation

uses unitDM;

{$R *.dfm}

procedure TformCadastroMovimentacao.btnInserirClick(Sender: TObject);
begin
   DM.tbMovimentacoes.Insert;
   cbTipo.setFocus;
   DM.tbMovimentacoes.FieldByName('data_hora').Value := Now();
end;

procedure TformCadastroMovimentacao.limparTela;
var i: Integer;
begin
   for i := 0 to ComponentCount - 1 do
     begin
        if(Components[i] is TDBEdit) then
           TDBEdit(Components[i]).Clear
        end;
end;

procedure TformCadastroMovimentacao.FormShow(Sender: TObject);
begin
   DM.tbMovimentacoes.Insert;
   limparTela;
   cbTipo.setFocus;

   cbTipo.Items.Add('ENTRADA DE MERCADORIA');
   cbTipo.Items.Add('SAÍDA DE MERCADORIA');
   cbTipo.Items.Add('AJUSTE DE ESTOQUE');
   cbTipo.Items.Add('DEVOLUÇÃO DE COMPRA');
   cbTipo.Items.Add('DEVOLUÇÃO DE VENDA');

end;

procedure TformCadastroMovimentacao.btnEditarClick(Sender: TObject);
begin
   DM.tbMovimentacoes.Edit;
   cbTipo.setFocus;
end;

procedure TformCadastroMovimentacao.btnGravarClick(Sender: TObject);
begin
    DM.tbMovimentacoes.Post;
end;

procedure TformCadastroMovimentacao.btnCancelarClick(Sender: TObject);
begin
   DM.tbMovimentacoes.Cancel;
end;

procedure TformCadastroMovimentacao.btnExcluirClick(Sender: TObject);
begin
    DM.tbMovimentacoes.Delete;
end;

procedure TformCadastroMovimentacao.inputDataHoraClick(Sender: TObject);
begin
    DM.tbMovimentacoes.FieldByName('data_hora').Value := Now();
end;

procedure TformCadastroMovimentacao.DBEdit2KeyPress(Sender: TObject;
  var Key: Char);
begin
   Key := upCase(Key);
end;

procedure TformCadastroMovimentacao .DBMemo1KeyPress(Sender: TObject;
  var Key: Char);
begin
    Key := upCase(Key);
end;

end.
