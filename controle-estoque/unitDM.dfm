�
 TDM 0  TPF0TDMDMOldCreateOrderLeft� Top|HeightmWidth� TZConnectionconexaoControlsCodePagecGET_ACPUTF8StringsAsWideFieldAutoEncodeStrings	Connected	HostName	localhostPort�DatabaseestoqueUserrootProtocolmysql-5LeftTop  TZTable
tbProdutos
ConnectionconexaoActive		TableNameprodutosLeft`Top TIntegerFieldtbProdutosid	FieldNameidRequired	  TStringFieldtbProdutosnome	FieldNamenomeRequired	Size2  TStringFieldtbProdutosfabricante	FieldName
fabricanteRequired	Size  
TDateFieldtbProdutosvalidade	FieldNamevalidadeRequired	EditMask!99/99/00;1;_  TIntegerFieldtbProdutosestoque_atual	FieldNameestoque_atual   TDataSource
dsProdutosDataSet
tbProdutosLeft`Top@  TZTabletbMovimentacoes
ConnectionconexaoAfterScrolltbMovimentacoesAfterScrollBeforeDeletetbMovimentacoesBeforeDeleteActive		TableNamemovimentacoesLeft� Top  TDataSourcedsMovimentacoesDataSettbMovimentacoesLeft� Top@  TZTabletbMoviProdutos
Connectionconexao	AfterPosttbMoviProdutosAfterPostBeforeDeletetbMoviProdutosBeforeDeleteAfterDeletetbMoviProdutosAfterDeleteActive		TableNamemovimentacoes_produtosMasterFieldsidMasterSourcedsMovimentacoesLinkedFieldsid_movimentacoesLeftHTop TIntegerFieldtbMoviProdutosid	FieldNameidRequired	  TIntegerFieldtbMoviProdutosid_movimentacoes	FieldNameid_movimentacoesRequired	  TIntegerFieldtbMoviProdutosid_produtos	FieldNameid_produtosRequired	  TIntegerFieldtbMoviProdutosqtd	FieldNameqtdRequired	  TStringFieldtbMoviProdutosnomeProduto	FieldKindfkLookup	FieldNamenomeProdutoLookupDataSet
tbProdutosLookupKeyFieldsidLookupResultFieldnome	KeyFieldsid_produtosSize2Lookup	   TDataSourcedsMoviProdutosDataSettbMoviProdutosLeftHTop@  TZQuerysqlAumentaEstoque
ConnectionconexaoSQL.StringsJUPDATE produtos SET estoque_atual = estoque_atual + :pQtd  WHERE id = :pId ParamsDataType	ftUnknownNamepQtd	ParamType	ptUnknown DataType	ftUnknownNamepId	ParamType	ptUnknown  
DataSource
dsProdutosLeft Top� 	ParamDataDataType	ftUnknownNamepQtd	ParamType	ptUnknown DataType	ftUnknownNamepId	ParamType	ptUnknown    TZQuerysqlDiminuiEstoque
ConnectionconexaoSQL.StringsJUPDATE produtos SET estoque_atual = estoque_atual - :pQtd  WHERE id = :pId  ParamsDataType	ftUnknownNamepQtd	ParamType	ptUnknown DataType	ftUnknownNamepId	ParamType	ptUnknown  
DataSource
dsProdutosLeft� Top� 	ParamDataDataType	ftUnknownNamepQtd	ParamType	ptUnknown DataType	ftUnknownNamepId	ParamType	ptUnknown    TZQuerysqlMovimentacoes
ConnectionconexaoActive	SQL.StringsSELECT * FROM movimentacoes ParamsDataType	ftUnknownNamepDataInicial	ParamType	ptUnknown DataType	ftUnknownName
pDataFinal	ParamType	ptUnknown  
DataSourcedsMovimentacoesMasterFieldsidMasterSourcedsMovimentacoesLeft� Top� 	ParamDataDataType	ftUnknownNamepDataInicial	ParamType	ptUnknown DataType	ftUnknownName
pDataFinal	ParamType	ptUnknown    TDataSourcedsSqlMovimentacoesDataSetsqlMovimentacoesLeft� Top�   TDataSourcedsSqlAumentaEstoqueDataSetsqlAumentaEstoqueLeft Top�   TDataSourcedsSqlDiminuiEstoqueDataSetsqlDiminuiEstoqueLeft� Top�   TZQuerysqlMoviProdutos
ConnectionconexaoSortedFieldsidActive	SQL.Strings$SELECT * FROM movimentacoes_produtos  Params 
DataSourcedsMovimentacoesMasterFieldsidMasterSourcedsMovimentacoesIndexFieldNamesid AscLefthTop�  TIntegerFieldsqlMoviProdutosid	FieldNameidRequired	  TIntegerFieldsqlMoviProdutosid_movimentacoes	FieldNameid_movimentacoesRequired	  TIntegerFieldsqlMoviProdutosid_produtos	FieldNameid_produtosRequired	  TIntegerFieldsqlMoviProdutosqtd	FieldNameqtdRequired	  TStringFieldsqlMoviProdutosnomeProduto	FieldKindfkLookup	FieldNamenomeProdutoLookupDataSet
tbProdutosLookupKeyFieldsidLookupResultFieldnome	KeyFieldsid_produtosSize2Lookup	   TDataSourcedsSqlMoviProdutosDataSetsqlMoviProdutosLefthTop�    