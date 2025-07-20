*** Settings ***
Library    RequestsLibrary
Library    String
Library    OperatingSystem
Library    Collections

Resource    ../Resources/usuario.robot
Suite Setup       Criar Sessão    https://serverest.dev
Suite Teardown    Encerrar Sessão

*** Variables ***

*** Test Cases ***
Cadastrar Usuário
      ${body}        Get File    path=${EXECDIR}/Json/usuario.json

      ${header}      Create Dictionary    Content-Type=application/json$

      ${response}    POST On Session    alias=api    url=/usuarios
      ...            headers=${header}    
      ...            data=${body}    
      ...            expected_status=201
      ${id}          Set Variable    ${response()['_id']}
      Dictionary Should Contain Value    ${response()}    Cadastro realizado com sucesso