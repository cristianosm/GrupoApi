#Include 'Protheus.ch'

*******************************************************************************
User Function Exemplo_CondPag()
*******************************************************************************

//| Parametros |
nValTot		:= 1000							//| Valor total da duplicata.
cCond			:= '001'							//| Código da condição de pagamento.
dDatai			:= dDataBase					//| Data inicial para considerar desdobramento.

nValIpi		:= Nil								//| Valor do IPI destacado.
nValSolid	:= Nil								//| Valor do ICMS Solidário.
aImpVar		:= Nil								//| 	Array contendo a sigla e valor dos impostos calculados para outros países.
aE4				:= Nil								//| 	Array contendo dados semelhantes ao da SE4 (Condição de pagamento.
nAcrescimo	:= Nil								//| Valor do acréscimo.
nInicio3		:=	 Nil								//| 	Intervalo entre duplicatas - condição de pagamento Tipo 3 (SIGALOJA).
aDias3			:= Nil								//| Dias para o vencimento das duplicatas - condição de pagamento Tipo 3 (SIGALOJA)

//| Retorno |
aVenc			:= {}								//| Array contendo os vencimentos e valores calculados pelo desdobramento, com base na configuração da condição de pagamento informada.

aVenc := condicao( nValTot,cCond,nValIpi,dDatai,nValSolid,aImpVar,aE4,nAcrescimo,nInicio3,aDias3)


Tela(aVenc)


//| EXEMPLO DO RETORNO |
//| "aVenc"	{ size=1 }
//|	AVENC[1]	{ size=2 }
//|		AVENC[1][1]	25/11/2015
//|		AVENC[1][2]	1000

Return()
*******************************************************************************
Static Function Tela(aVenc)
*******************************************************************************
Local oDlgAtr


	oDlgAtr  := MSDialog():New(050, 050, 300, 380,'Parcelas',,,.F.,,,,,,.T.,,/*oFont*/,.T. )

	oBrowse := TCBrowse():New(001, 003, 160, 110,,{'Vencimento','Valor'},{},oDlgAtr,,,,,{||},,/*oFont*/,,,,,.F.,,.T.,,.F.,,.T.,.F.)
	oBrowse:SetArray(aVenc)

	oBrowse:AddColumn( TCColumn():New('Vencimento'	, {|| 						aVenc[oBrowse:NAT,01] },,,,"LEFT",,.F.,.T.,,,,.F.,) )
	oBrowse:AddColumn( TCColumn():New('Valor'			, {|| Transform(	aVenc[oBrowse:NAT,02] ,'@E 999,999.99')  },,,,"LEFT",,.F.,.T.,,,,.F.,) )


	oBtnSair := TButton():New(113, 005, "Sair", oDlgAtr,{|| oDlgAtr:End() },30,010,,,.F.,.T.,.F.,,.F.,,,.F. )

	oBtnSair:SetFocus()
	oDlgAtr:Activate(,,,.T.)

Return()