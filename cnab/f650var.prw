#include "totvs.ch"

*********************************************************************
User Function F650var()
*********************************************************************
Local nI := 0

DbSelectarea("SE1")
If ( IndexOrd() ) <> 24
	DbOrderNickName("NUMBCO")
EndIf

If !Empty(cNossoNum)

	U_FPosCNab(@cNossoNum, @cNumTit)
EndIf
Return()
*********************************************************************
User Function F200var()
*********************************************************************
Local nI := 0
LOCAL cNossoNum 	:= PARAMIXB[1][4] // NOSSO NUMERO
LOCAL cNumTit 		:= ""

DbSelectarea("SE1")
If ( IndexOrd() ) <> 24
	DbOrderNickName("NUMBCO")
EndIf

If !Empty(cNossoNum)
	U_FPosCNab(@cNossoNum, @cNumTit)
EndIf

Return()
*********************************************************************
User Function FPosCNab(cNossoNum, cNumTit)
*********************************************************************


If DbSeek(xFilial("SE1")+cNossoNum,.F.)
	cNumTit := SE1->E1_PREFIXO+SE1->E1_NUM+SE1->E1_PARCELA+SE1->E1_TIPO
EndIf

Return()
