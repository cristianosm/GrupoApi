#include "protheus.ch"


/*****************************************************************************\
**---------------------------------------------------------------------------**
** FUN��O   : NomeProg    | AUTOR : Cristiano Machado  | DATA : 07/10/2015   **
**---------------------------------------------------------------------------**
** DESCRI��O: Este ponto de entrada � executado ap�s as aberturas dos        **
**          : SXs(dicion�rio de dados). Ao acessar pelo SIGAMDI, este ponto  **
**          : de entrada � chamado ao entrar na rotina. Pelo modo SIGAADV, a **
**          : abertura dos SXs �  executado ap�s o login.                    **
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


//ApMsgAlert("Usu�rio "+ cId + " - " + Alltrim(cNome)+" efetuou login �s "+Time())



Return Nil