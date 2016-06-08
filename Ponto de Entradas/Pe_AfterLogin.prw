#include "protheus.ch"


/*****************************************************************************\
**---------------------------------------------------------------------------**
** FUN‚ÌO   : NomeProg    | AUTOR : Cristiano Machado  | DATA : 07/10/2015   **
**---------------------------------------------------------------------------**
** DESCRI‚ÌO: Este ponto de entrada Ž executado ap—s as aberturas dos        **
**          : SXs(dicion‡rio de dados). Ao acessar pelo SIGAMDI, este ponto  **
**          : de entrada Ž chamado ao entrar na rotina. Pelo modo SIGAADV, a **
**          : abertura dos SXs Ž  executado ap—s o login.                    **
**---------------------------------------------------------------------------**
** USO      : Especifico para o cliente Grupo API                            **
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
User Function AfterLogin()
*******************************************************************************

Local cId		:= ParamIXB[1]
Local cNome 	:= ParamIXB[2]


SetKey(VK_F8, {|| U_ExecMyFunc()})


//ApMsgAlert("Usu‡rio "+ cId + " - " + Alltrim(cNome)+" efetuou login ˆs "+Time())



Return Nil