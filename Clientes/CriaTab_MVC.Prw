#Include 'Protheus.ch'

/*****************************************************************************\
**---------------------------------------------------------------------------**
** FUN‚ÌO   : NomeProg    | AUTOR : Cristiano Machado  | DATA : 21/10/2015   **
**---------------------------------------------------------------------------**
** DESCRI‚ÌO:                                                                **
**---------------------------------------------------------------------------**
** USO      : Especifico para o cliente  XXXXXX                              **
**---------------------------------------------------------------------------**
**---------------------------------------------------------------------------**
**            ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL.              **
**---------------------------------------------------------------------------**
**   PROGRAMADOR   |   DATA   |            MOTIVO DA ALTERACAO               **
**---------------------------------------------------------------------------**
**                 |          |                                              **
**                 |          |                                              **
\*---------------------------------------------------------------------------*/
*******************************************************************************
User Function CriaTab_MVC(_cAlias)
*******************************************************************************

	CriaArqTrab(_cAlias) //| Cria Estrutura Tabela Local |

	RodaQuery('AUX')		//| Executa Query |

//	LoadDados(_cAlias)				//| Carrega os Dados Query para Tabela Local |

	DbSelectArea(_cAlias)

Return( _cAlias )
*******************************************************************************
Static Function RodaQuery(_cAlias)
*******************************************************************************
	Local cSql 			:= ' '
	Local cCursor 		:= ' '		//| Alias da Tabela
	local lModo			:= 'Q' 	//| Q-> Query
	local lMostra		:= .F.		//| Se deve Apresentar a Query na Tela para Edicao....
	local lChange		:= .F.		//| Se deve submeter a query ˆ funcao  changeQuery...

	Default _cAlias := 'AUX'

	cCursor := _cAlias

	cSql += "Select A1_FILIAL, A1_COD, A1_LOJA, A1_NOME, 'PRODUTO 01' A1_PRODUTO From SA1010 "
	cSql += "Where A1_COD = '171828'  "
	cSql += "And A1_LOJA  = '01'  "
	cSql += "And D_E_L_E_T_ = ' '  "

	U_ExecMySql( cSql , cCursor , lModo, lMostra, lChange )

Return()
*******************************************************************************
Static Function CriaArqTrab(_cAlias)
*******************************************************************************

	aStruFile := 	{	{	'A1_FILIAL'	,'C', 6	, 0	},;
		{	'A1_COD'			,'C', 6	, 0	},;
		{	'A1_LOJA'		,'C', 2	, 0	},;
		{	'A1_NOME'		,'C', 40	, 0	},;
		{	'A1_PRODUTO'	,'C', 15	, 0	} }

	aStruIndex	:= 	{ 'A1_FILIAL+A1_COD' }

	_cAliasFile := _cAlias

// Cria Arquivo de Trabalho baseado no aStruFile e aStruIndex
	U_MyFile( aStruFile, aStruIndex, Nil, Nil, _cAliasFile, Nil, Nil )

Return()
*******************************************************************************
Static Function loadDados(_cAlias)
*******************************************************************************
	DbSelectArea('AUX');DbGotop()

	While !EOF()
		DbSelectArea(_cAlias)
		RecLock(_cAlias,.T.)

		_cAlias->A1_FILIAL		:= AUX->A1_FILIAL
		_cAlias->A1_COD			:= AUX->A1_COD
		_cAlias->A1_LOJA			:= AUX->A1_LOJA
		_cAlias->A1_NOME			:= AUX->A1_NOME
		_cAlias->A1_PRODUTO		:= AUX->A1_PRODUTO

		Msunlock()

		DbSelectArea('AUX')
		DbSkip()
	EndDo

	DbSelectArea('AUX')
	DbCloseArea()

Return()

