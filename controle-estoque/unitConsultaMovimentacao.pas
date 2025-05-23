unit unitConsultaMovimentacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, Mask, ExtCtrls, Grids, DBGrids;

type
  TformConsultaMovimentacao = class(TForm)
    panel1: TPanel;
    Label1: TLabel;
    panel2: TPanel;
    txtDataInicial: TMaskEdit;
    txtDataFinal: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    btConsultar: TButton;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Label4: TLabel;
    lblTotal: TLabel;
    procedure Sair1Click(Sender: TObject);
    procedure btConsultarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formConsultaMovimentacao: TformConsultaMovimentacao;

implementation

uses unitDM;

{$R *.dfm}

procedure TformConsultaMovimentacao.Sair1Click(Sender: TObject);
begin
   Application.Terminate;
end;

procedure TformConsultaMovimentacao.btConsultarClick(Sender: TObject);
begin
   DM.sqlMovimentacoes.Close;
   DM.sqlMovimentacoes.SQL.Clear;
   DM.sqlMovimentacoes.SQL.Text := 'SELECT * FROM movimentacoes WHERE date(data_hora) BETWEEN :pDataInicial AND :pDataFinal';
   DM.sqlMovimentacoes.ParamByName('pDataInicial').value   := FormatDateTime('yyyy-mm-dd hh:mm:ss', StrToDate(txtDataInicial.Text));
   DM.sqlMovimentacoes.ParamByName('pDataFinal').value := FormatDateTime('yyyy-mm-dd hh:mm:ss', StrToDate(txtDataFinal.Text));
   DM.sqlMovimentacoes.Open;

   lblTotal.Caption := IntToStr(DM.sqlMovimentacoes.RecordCount);
end;

procedure TformConsultaMovimentacao.FormShow(Sender: TObject);
begin
   DM.sqlMovimentacoes.Refresh;
   DM.sqlMoviProdutos.Refresh;

   lblTotal.Caption := IntToStr(DM.sqlMovimentacoes.RecordCount);

end;

end.

