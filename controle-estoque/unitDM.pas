unit unitDM;

interface

uses
  SysUtils, Classes, ZDataset, DB, ZAbstractRODataset, ZAbstractDataset,
  ZAbstractTable, ZAbstractConnection, ZConnection, Dialogs;

type
  TDM = class(TDataModule)
    conexao: TZConnection;
    tbProdutos: TZTable;
    dsProdutos: TDataSource;
    tbMovimentacoes: TZTable;
    dsMovimentacoes: TDataSource;
    tbMoviProdutos: TZTable;
    dsMoviProdutos: TDataSource;
    sqlAumentaEstoque: TZQuery;
    sqlDiminuiEstoque: TZQuery;
    sqlMovimentacoes: TZQuery;
    dsSqlMovimentacoes: TDataSource;
    dsSqlAumentaEstoque: TDataSource;
    dsSqlDiminuiEstoque: TDataSource;
    tbProdutosid: TIntegerField;
    tbProdutosnome: TStringField;
    tbProdutosfabricante: TStringField;
    tbProdutosvalidade: TDateField;
    tbProdutosestoque_atual: TIntegerField;
    tbMoviProdutosid: TIntegerField;
    tbMoviProdutosid_movimentacoes: TIntegerField;
    tbMoviProdutosid_produtos: TIntegerField;
    tbMoviProdutosqtd: TIntegerField;
    tbMoviProdutosnomeProduto: TStringField;
    sqlMoviProdutos: TZQuery;
    dsSqlMoviProdutos: TDataSource;
    sqlMoviProdutosid: TIntegerField;
    sqlMoviProdutosid_movimentacoes: TIntegerField;
    sqlMoviProdutosid_produtos: TIntegerField;
    sqlMoviProdutosqtd: TIntegerField;
    sqlMoviProdutosnomeProduto: TStringField;
    procedure tbMoviProdutosAfterPost(DataSet: TDataSet);
    procedure tbMoviProdutosAfterDelete(DataSet: TDataSet);
    procedure calcularTotais;
    procedure tbMovimentacoesAfterScroll(DataSet: TDataSet);
    procedure tbMoviProdutosBeforeDelete(DataSet: TDataSet);
    procedure tbMovimentacoesBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses unitCadastroMovimentacao;

{$R *.dfm}

procedure TDM.tbMoviProdutosAfterPost(DataSet: TDataSet);
begin
   calcularTotais;

   if (tbMovimentacoes.FieldByName('tipo').Value = 'ENTRADA DE MERCADORIA') then
     begin
        sqlAumentaEstoque.ParamByName('pId').Value := tbMoviProdutos.FieldByName('id_produtos').Value;
        sqlAumentaEstoque.ParamByName('pQtd').Value := tbMoviProdutos.FieldByName('qtd').Value;
        sqlAumentaEstoque.ExecSQL;
     end;

     if (tbMovimentacoes.FieldByName('tipo').Value = 'SAÍDA DE MERCADORIA') then
     begin
        sqlDiminuiEstoque.ParamByName('pId').Value := tbMoviProdutos.FieldByName('id_produtos').Value;
        sqlDiminuiEstoque.ParamByName('pQtd').Value := tbMoviProdutos.FieldByName('qtd').Value;
        sqlDiminuiEstoque.ExecSQL;
     end;
end;

procedure TDM.tbMoviProdutosAfterDelete(DataSet: TDataSet);
begin
   calcularTotais;

end;

procedure TDM.calcularTotais;
var
  totais : Integer;

begin
   if(tbMoviProdutos.State in [dsBrowse]) then
     begin
        tbMoviProdutos.First;
         
         totais := 0;
         while not tbMoviProdutos.Eof do
             begin
                 totais := totais + tbMoviProdutos.FieldByName('qtd').Value;

                  tbMoviProdutos.Next;
             end;

          formCadastroMovimentacao.lbTotalProdutos.Caption := IntToStr(totais);
     end
end;

procedure TDM.tbMovimentacoesAfterScroll(DataSet: TDataSet);
begin
    calcularTotais;
end;

procedure TDM.tbMoviProdutosBeforeDelete(DataSet: TDataSet);
begin
   if (tbMovimentacoes.FieldByName('tipo').Value = 'ENTRADA DE MERCADORIA') then
     begin
        sqlDiminuiEstoque.ParamByName('pId').Value := tbMoviProdutos.FieldByName('id_produtos').Value;
        sqlDiminuiEstoque.ParamByName('pQtd').Value := tbMoviProdutos.FieldByName('qtd').Value;
        sqlDiminuiEstoque.ExecSQL;
     end;

     if (tbMovimentacoes.FieldByName('tipo').Value = 'SAÍDA DE MERCADORIA') then
     begin
        sqlAumentaEstoque.ParamByName('pId').Value := tbMoviProdutos.FieldByName('id_produtos').Value;
        sqlAumentaEstoque.ParamByName('pQtd').Value := tbMoviProdutos.FieldByName('qtd').Value;
        sqlAumentaEstoque.ExecSQL;
     end;
end;
procedure TDM.tbMovimentacoesBeforeDelete(DataSet: TDataSet);
begin
   if tbMoviProdutos.RecordCount > 0 then
     begin
        ShowMessage('Existem produtos cadastrados nessa movimentação. Exclua-se primeiro.');
        abort;
     end
end;

end.
