#Include 'Protheus.ch'
#Include 'FWMVCDef.ch'

//#Define MODEL_OPERATION_VIEW 3


********************************************************************************************
User Function Exec_Ficha_Cliente()
********************************************************************************************
Local aButtons := {{.F.,Nil},{.F.,Nil},{.F.,Nil},{.T.,Nil},{.T.,Nil},{.T.,Nil},{.T.,'Fechar'},{.T.,Nil},{.T.,Nil},{.T.,Nil},{.T.,Nil},{.T.,Nil},{.T.,Nil},{.T.,Nil}}

Local cTitulo			:= 'Ficha Cliente'
Local cPrograma		:= 'FichaCLi_MVC'
Local nOperation		:= MODEL_OPERATION_UPDATE
Local oDlg					:= Nil
Local bCloseOnOk		:= NIL // { || .T. }
Local bOk					:= NIL //{ || .T. }
Local nPercReducao	:= 0
Local aEnableButtons	:= NIL //aButtons
Local bCancel			:= NIL //{ || .T. }


DbSelectArea("SA1");DbSetOrder(1)
DbSeek(xFilial("SA1")+'17182801',.F.)


FWExecView (cTitulo, cPrograma, nOperation, oDlg, bCloseOnOk, bOk, nPercReducao, aEnableButtons, bCancel )


Return Nil
