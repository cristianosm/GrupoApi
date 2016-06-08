#Include 'Protheus.ch'
#Include 'FWMVCDef.ch'

//-------------------------------------------------------------------
/*/{Protheus.doc} ModelDef
Defini�‹o do modelo de Dados

@author cristianosm

@since 14/10/2015
@version 1.0
/*/
//-------------------------------------------------------------------

Static Function ModelDef()

Local oModel
 
Local oStr_SA1:= FWFormStruct(1, 'SA1') //| Clientes  
Local oStr_SE1:= FWFormStruct(1, 'SE1') //| Titulos
Local oStr_CNA:= FWFormStruct(1, 'CNA') //| Contratos
Local oStr_SA7:= FWFormStruct(1, 'SA7') //| Produtos
//Local oStr_SUS:= FWFormStruct(1, 'SUS') //| Contatos
Local oStr_SUA:= FWFormStruct(1, 'SUA') //| Historico

Local oStr_TRC := FWMCustoStr('TTRC') //| Tabela Customizada Exemplo Model

Local aCpo_SA1	:= { 'A1_FILIAL' , 'A1_COD' ,  'A1_LOJA' ,  'A1_NOME' } 
 
 U_MCampos_MVC( aCpo_SA1 , @oStr_SA1 , 'M' )  //| Mantem na Estrutura apenas os Campos contidos no array...
 
 U_CriaTab_MVC('TTRC') // Monta TABELA AUXILIAR para Estrutura CUSTOMIZADA MVC


oModel := MPFormModel():New('FichaCli_MVC') 

//oModel:SetDescription('Principal')

oModel:addFields('FIELD_SA1',,oStr_SA1)

oModel:addGrid('GRID_SE1','FIELD_SA1',oStr_SE1)
oModel:addGrid('GRID_CNA','FIELD_SA1',oStr_CNA)
oModel:addGrid('GRID_SA7','FIELD_SA1',oStr_SA7)
//oModel:addGrid('GRID_SUS','FIELD_SA1',oStr_SUS)
oModel:addGrid('GRID_SUA','FIELD_SA1',oStr_SUA)

oModel:addGrid('GRID_TRC' , 'FIELD_SA1' ,oStr_TRC )

oModel:SetRelation('GRID_SE1',{ { 'E1_CLIENTE'	, 'A1_COD' }, { 'E1_LOJA'	, 'A1_LOJA' } }, SE1->(IndexKey(1)) )
oModel:SetRelation('GRID_CNA',{ { 'CNA_CLIENT'	, 'A1_COD' }, { 'CNA_LOJACL', 'A1_LOJA' } }, CNA->(IndexKey(1)) )
oModel:SetRelation('GRID_SA7',{ { 'A7_CLIENTE'	, 'A1_COD' }, { 'A7_LOJA'	, 'A1_LOJA' } }, SA7->(IndexKey(1)) )
//oModel:SetRelation('GRID_SUS',{ { 'US_CODCLI'	, 'A1_COD' }, { 'US_LOJACLI', 'A1_LOJA' } }, SUS->(IndexKey(1)) )
oModel:SetRelation('GRID_SUA',{ { 'UA_CLIENTE'	, 'A1_COD' }, { 'UA_LOJA'	, 'A1_LOJA' } }, SUA->(IndexKey(1)) )

oModel:SetRelation('GRID_TRC',{ { 'A1_COD'	, 'A1_COD' }, { 'A1_LOJA'	, 'A1_LOJA' } }, TTRC->(IndexKey(1)) )


oModel:getModel('FIELD_SA1'):SetDescription('Cliente')

oModel:getModel('GRID_SE1'):SetDescription('Titulos')
oModel:getModel('GRID_CNA'):SetDescription('Contratos')
oModel:getModel('GRID_SA7'):SetDescription('Produtos')
//oModel:getModel('GRID_SUS'):SetDescription('Contatos')
oModel:getModel('GRID_SUA'):SetDescription('Historico')

oModel:getModel('GRID_TRC'):SetDescription('Usuarios')

Return oModel
//-------------------------------------------------------------------
/*/{Protheus.doc} ViewDef
Definição do interface

@author cristiano.machado

@since 15/10/2015
@version 1.0
/*/
//-------------------------------------------------------------------

Static Function ViewDef()

Local oView
Local oModel := ModelDef()

Local oStr_SA1 := FWFormStruct(2, 'SA1') //| Clientes
Local oStr_SE1 := FWFormStruct(2, 'SE1') //| Titulos
Local oStr_CNA := FWFormStruct(2, 'CNA') //| Contratos
Local oStr_SA7 := FWFormStruct(2, 'SA7') //| Produtos
//Local oStr_SUS := FWFormStruct(2, 'SUS') //| Contatos
Local oStr_SUA := FWFormStruct(2, 'SUA') //| Historico

Local oStr_TRC := FWVCustoStr('TTRC') //| Tabela Customizada Exemplo View

Local aCpo_SA1	:= { 'A1_FILIAL' , 'A1_COD' ,  'A1_LOJA' ,  'A1_NOME' } 
 

 U_MCampos_MVC( aCpo_SA1 , @oStr_SA1 , 'V' )  //| Mantem na Estrutura apenas os Campos contidos no array...
 
 oStr_SA1:SetNoFolder() //| Se quisermos retirar as pastas que estão configuradas em uma estrutura, por exemplo, pelo uso da função FWFormStruct, usamos o método SetNoFolder

oView := FWFormView():New() //| Cria Janela e Box Principal... (Default)

oView:SetModel(oModel)		//| Define o Modelo de Dados que estara Disponivel para ser Utilizado nesta View...

oView:AddField(		'FORM_SA1' 	, oStr_SA1	,'FIELD_SA1' 	)		//|  Cria Formulário de dados (FIELD)  baseado numa Estrutura (SA1)...

oView:AddGrid( 		'FORM_SE1' 	, oStr_SE1	,'GRID_SE1'		)		//|  Cria Grade de dados (GRID)  baseado numa Estrutura (SE1)...
oView:AddGrid(		'FORM_CNA' 	, oStr_CNA	,'GRID_CNA'		)  		//|  Cria Grade de dados (GRID)  baseado numa Estrutura (CNA)...
oView:AddGrid(		'FORM_SA7' 	, oStr_SA7	,'GRID_SA7'		)  		//|  Cria Grade de dados (GRID)  baseado numa Estrutura (SA7)...
//oView:AddGrid(		'FORM_SUS' 	, oStr_SUS	,'GRID_SUS'		)  		//|  Cria Grade de dados (GRID)  baseado numa Estrutura (SUS)...
oView:AddGrid(		'FORM_SUA' 	, oStr_SUA	,'GRID_SUA'		)  		//|  Cria Grade de dados (GRID)  baseado numa Estrutura (SUA)...

oView:AddGrid(		'FORM_TRC' 	, oStr_TRC	,'GRID_TRC'		)  		//|  Cria Grade de dados (GRID)  baseado numa Estrutura (SUA)...


oView:CreateFolder( 'FOLD_CAB') //| Cria Pasta  dentro da box  ( Obrigatório )

oView:AddSheet('FOLD_CAB','FOLHA_SA1','Cliente')  //| Cria Folha (sheet) que irá receber um formulario ou grade dentro de uma pasta anteriormente criada...


oView:CreateHorizontalBox( 'BOX_CAB_SA1', 50, /*owner*/, /*lUsePixel*/, 'FOLD_CAB', 'FOLHA_SA1') //| Cria Caixa ( Superior ) com divisao Horizontal dentro de uma Folha (sheet)..
oView:CreateHorizontalBox( 'BOX_DET_ALL', 50, /*owner*/, .F., 'FOLD_CAB', 'FOLHA_SA1') //| Cria Caixa ( Inferior ) com divisao Horizontal dentro de uma Folha (sheet)...



oView:CreateFolder( 'FOLD_DET', 	'BOX_DET_ALL' )		//| Cria Pasta no Box (Inferior) ...

oView:AddSheet('FOLD_DET'	,'FOLHA_SE1'	,'Titulos'		) //| Cria a Folha (Sheet) que irá receber os Dados Titulos (SE1)
oView:AddSheet('FOLD_DET'	,'FOLHA_CNA'	,'Contratos'	) //| Cria a Folha (Sheet) que irá receber os Dados Contratos (CNA)
oView:AddSheet('FOLD_DET'	,'FOLHA_SA7'	,'Produtos'		) //| Cria a Folha (Sheet) que irá receber os Dados Contratos (CNA)
oView:AddSheet('FOLD_DET'	,'FOLHA_SUS'	,'Contatos'		) //| Cria a Folha (Sheet) que irá receber os Dados Contratos (CNA)
oView:AddSheet('FOLD_DET'	,'FOLHA_SUA'	,'Historico'	) //| Cria a Folha (Sheet) que irá receber os Dados Contratos (CNA)

oView:AddSheet('FOLD_DET'	,'FOLHA_TRC'	,'Usuarios'	) //| Cria a Folha (Sheet) que irá receber os Dados Contratos (CNA)



oView:CreateHorizontalBox( 'BOX_DET_SE1', 100, /*owner*/, /*lUsePixel*/, 'FOLD_DET', 'FOLHA_SE1')		//| Cria Caixa ( Completa ) com divisao Horizontal dentro de uma Folha (sheet)..
oView:CreateHorizontalBox( 'BOX_DET_CNA', 100, /*owner*/, /*lUsePixel*/, 'FOLD_DET', 'FOLHA_CNA') 	//| Cria Caixa ( Completa ) com divisao Horizontal dentro de uma Folha (sheet)..
oView:CreateHorizontalBox( 'BOX_DET_SA7', 100, /*owner*/, /*lUsePixel*/, 'FOLD_DET', 'FOLHA_SA7') 	//| Cria Caixa ( Completa ) com divisao Horizontal dentro de uma Folha (sheet)..
oView:CreateHorizontalBox( 'BOX_DET_SUS', 100, /*owner*/, /*lUsePixel*/, 'FOLD_DET', 'FOLHA_SUS') 	//| Cria Caixa ( Completa ) com divisao Horizontal dentro de uma Folha (sheet)..
oView:CreateHorizontalBox( 'BOX_DET_SUA', 100, /*owner*/, /*lUsePixel*/, 'FOLD_DET', 'FOLHA_SUA') 	//| Cria Caixa ( Completa ) com divisao Horizontal dentro de uma Folha (sheet)..

oView:CreateHorizontalBox( 'BOX_DET_TRC', 100, /*owner*/, /*lUsePixel*/, 'FOLD_DET', 'FOLHA_TRC') 	//| Cria Caixa ( Completa ) com divisao Horizontal dentro de uma Folha (sheet)..
 
 
 
oView:SetOwnerView('FORM_SA1','BOX_CAB_SA1') 	//| Define o Box que irá apresentar a Estrutura de Dados na Tela....

oView:SetOwnerView('FORM_SE1','BOX_DET_SE1') //| Define o Box que irá apresentar a Estrutura de Dados na Tela....
oView:SetOwnerView('FORM_CNA','BOX_DET_CNA') //| Define o Box que irá apresentar a Estrutura de Dados na Tela....
oView:SetOwnerView('FORM_SA7','BOX_DET_SA7') //| Define o Box que irá apresentar a Estrutura de Dados na Tela....
//oView:SetOwnerView('FORM_SUS','BOX_DET_SUS') //| Define o Box que irá apresentar a Estrutura de Dados na Tela....
oView:SetOwnerView('FORM_SUA','BOX_DET_SUA') //| Define o Box que irá apresentar a Estrutura de Dados na Tela....

oView:SetOwnerView('FORM_TRC','BOX_DET_TRC') //| Define o Box que irá apresentar a Estrutura de Dados na Tela....

Return oView

//-------------------------------------------------------------------
/*/{Protheus.doc} FWMCustoStr
Monta Estrutura Customizada para a Model

@author cristiano.machado

@since 15/10/2015
@version 1.0
/*/
//-------------------------------------------------------------------

Static Function FWMCustoStr()

//| Help -> http://tdn.totvs.com/display/public/mp/FWFormModelStruct
Local oModelStruct := FWFormModelStruct():New()

//| AddTable() -> Adiciona uma estrutura que represente uma tabela. Esta pode ser do dicionário de dados ou qualquer outra tabela.
oModelStruct:AddTable(	'TTRC',,'Usuarios')	

//| AddField(< cTitulo >, < cTooltip >, < cIdField >, < cTipo >, < nTamanho >, [ nDecimal ], [ bValid ], [ bWhen ], [ aValues ], [ lObrigat ], [ bInit ], < lKey >, [ lNoUpd ], [ lVirtual ], [ cValid ])-> NIL
oModelStruct:AddField(	'Filial'		,' '	, 'A1_FILIAL'		, 'C', 6	, 0, , , {}, .F., FwBuildFeature( STRUCT_FEATURE_WHEN, '.T.' ) , .F., .F., .F., , )
oModelStruct:AddField(	'Codigo'		,' '	, 'A1_COD'			, 'C', 6	, 0, , , {}, .F., FwBuildFeature( STRUCT_FEATURE_WHEN, '.T.'  ) , .F., .F., .F., , )
oModelStruct:AddField(	'Loja'			,' '	, 'A1_LOJA'			, 'C', 2	, 0, , , {}, .F., FwBuildFeature( STRUCT_FEATURE_WHEN, '.T.'  ) , .F., .F., .F., , )
oModelStruct:AddField(	'Nome'		,' '	, 'A1_NOME'		, 'C', 40	, 0, , , {}, .F., FwBuildFeature( STRUCT_FEATURE_WHEN, '.T.'  ) , .F., .F., .F., , )
oModelStruct:AddField(	'Produto'	,' '	, 'A1_PRODUTO'	, 'C', 15	, 0, , , {}, .F., FwBuildFeature( STRUCT_FEATURE_WHEN, '.T.'  ) , .F., .F., .F., , )

//|AddIndex(< nOrdem >, < cOrdem >, < cKey >, < cDescription >, < cLookUp >, < cNickName >, < lShow >)-> NIL
oModelStruct:AddIndex( 1, 'CODIGO', 'A1_FILIAL+A1_COD', 'Codigo', '', '', .T. )

Return oModelStruct
//-------------------------------------------------------------------
/*/{Protheus.doc} FWVCustoStr
//| Monta Estrutura Customizada para a View

@author cristiano.machado

@since 15/10/2015
@version 1.0
/*/
//-------------------------------------------------------------------

Static Function FWVCustoStr() 

//| help -> http://tdn.totvs.com/display/framework/FWFormViewStruct
Local oViewStruct := FWFormViewStruct():New()

//| AddField(<cIdField >, <cOrdem >, <cTitulo >, <cDescric >, <aHelp >, <cType >, <cPicture >, <bPictVar >, <cLookUp >, <lCanChange >, <cFolder >, <cGroup >, [ aComboValues ], [ nMaxLenCombo ], <cIniBrow >, <lVirtual >, <cPictVar >, [ lInsertLine ], [ nWidth ])-
oViewStruct:AddField(	'A1_COD'			,'01','Usuario'		,'Usuario'		,{' '} ,'C' ,'@!' ,Nil ,'' ,.T. ,Nil ,Nil ,{} ,Nil ,Nil ,.F. ,Nil )
oViewStruct:AddField(	'A1_LOJA'			,'02','Loja'			,'Loja'			,{' '} ,'C' ,'@!' ,Nil ,'' ,.T. ,Nil ,Nil ,{} ,Nil ,Nil ,.F. ,Nil  )
oViewStruct:AddField(	'A1_NOME'			,'03','Nome'		,'Nome'			,{' '} ,'C' ,'@!' ,Nil ,'' ,.T. ,Nil ,Nil ,{} ,Nil ,Nil ,.F. ,Nil  )
oViewStruct:AddField(	'A1_PRODUTO'	,'04','Produto'	,'Produto'		,{' '} ,'C' ,'@!' ,Nil ,'' ,.T. ,Nil ,Nil ,{} ,Nil ,Nil ,.F. ,Nil  ) 


Return oViewStruct
