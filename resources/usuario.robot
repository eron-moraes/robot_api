*** Settings ***
Library    RequestsLibrary

*** Variables ***

*** Keywords ***
Criar Sessão   
    [Arguments]    ${url}
    Create Session    alias=api    url=${url}

Encerrar Sessão
    Delete All Sessions

*** Test Cases ***