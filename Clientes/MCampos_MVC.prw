#Include 'Protheus.ch'

//| Mantem os Campos desejados apartir de uma Estrutura... aCampos = { 'A1_COD','A1_LOJA',...}

/*****************************************************************************\
**---------------------------------------------------------------------------**
** FUN‚ÌO   : MCampos_MVC | AUTOR : Cristiano Machado  | DATA : 21/10/2015   **
**---------------------------------------------------------------------------**
** DESCRI‚ÌO: Filtra os Campos que devem ser mantidos na Estrutura MVC       **
**          : aCampos   -> Campos que deve ser Mantidos na Estrutura...      **
**          : oFWStruct -> Objeto deve ser passado por Referecia que contem  **
**          : o retorno da Funcao FWFormStruct ...                           **
**          : lMorV -> Informar se a Estrutura Ž V-View ou M-Model           **
**---------------------------------------------------------------------------**
** USO      : Especifico para o cliente                                      **
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
User Function MCampos_MVC( aCampos , oFWStruct, lMorV  )
*******************************************************************************

Default aCampos := {}

Private NPCAMPO := if(lMorV=='M', 3, 1 ) //| Posicao do Nome do Campo no Objeto Struct na  Model eh [3 e View eh [1] ...
//oFWStruct:ATRIGGERS := {}

	If Len(aCampos) > 0
		Opera(	aCampos, oFWStruct:aFields, @oFWStruct ) //| Mantem no Struct Apenas os Campos Contidos no aCampos
	EndIf

Return()
*******************************************************************************
Static Function Opera( aMantem, aLista , oFWStruct)
*******************************************************************************
Local lFind			:= .F.		//| Achou o campo no aMantem n‹o remove....
Local cFindCpo	:= ' '		//| Campo a ser procurado no aMantem...
Local nTLista		:= Len (aLista)

	For  nL :=  Len (aLista)  To Len (aMantem)  Step -1
		cFindCpo := aLista[nL][NPCAMPO]
		lFind := .F.
		IF ALLTRIM(cFindCpo) == 'U5_BAIRRO'
			TESTE:=0
		ENDIF
		For nM := 1 To Len (aMantem)

			If ( cFindCpo == aMantem[nM] )
				lFind := .T.
			EndIf

		Next

		if !lFind
			oFWStruct:RemoveField(cFindCpo)
		EndIf

	Next

Return( )

