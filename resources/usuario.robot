*** Settings ***
Library    RequestsLibrary
Library    String
Library    OperatingSystem
Library    Collections

*** Variables ***
*** Keywords ***
Criar Sessão   
    [Arguments]    ${url}
    Create Session    alias=api    url=${url}

Encerrar Sessão
    Delete All Sessions

Cadastrar Usuário
    ${body}         Get File               path=${EXECDIR}/Json/usuario.json

    ${header}       Create Dictionary      Content-Type=application/json

    ${response}     POST On Session        alias=api    url=/usuarios
    ...             headers=${header}
    ...             data=${body}
    ...             expected_status=201
    ${id}           Set Variable           ${response.json()['_id']}
    Dictionary Should Contain Value       ${response.json()}    Cadastro realizado com sucesso
    RETURN    ${id}

Consulta Usuario Lista
    ${header}       Create Dictionary      Content-Type=application/json
    ${response}     GET On Session        alias=api    url=/usuarios
    ...             headers=${header}
    ...             expected_status=200   

Consulta Usuario ID
    [Arguments]    ${id}
    ${header}       Create Dictionary      Content-Type=application/json
    ${response}     GET On Session        alias=api    url=/usuarios/${id}
    ...             headers=${header}
    ...             expected_status=200 