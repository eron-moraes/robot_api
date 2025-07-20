*** Settings ***
Library    RequestLibrary

*** Variables ***
*** Keywords ***
Criar Sessão
    [Arguments]    ${url}
    Create Session    alias=api    url=${url}

Encerrar Sessão
    Delete All Session
*** Test Cases ***