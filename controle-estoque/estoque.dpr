program estoque;

uses
  Forms,
  unitPrincipal in 'unitPrincipal.pas' {formPrincipal},
  unitCadastroProduto in 'unitCadastroProduto.pas' {formCadastroProduto},
  unitCadastroMovimentacao in 'unitCadastroMovimentacao.pas' {formCadastroMovimentacao},
  unitConsultaMovimentacao in 'unitConsultaMovimentacao.pas' {formConsultaMovimentacao},
  unitDM in 'unitDM.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TformPrincipal, formPrincipal);
  Application.CreateForm(TformCadastroProduto, formCadastroProduto);
  Application.CreateForm(TformCadastroMovimentacao, formCadastroMovimentacao);
  Application.CreateForm(TformConsultaMovimentacao, formConsultaMovimentacao);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
