*** Settings ***
Library    RequestLibrary
Resource ../resources/usuario.robot
Suite Setup       Criar Sessão    https://serverest.dev/
Suite Teardown    Encerrar Sessão   

*** Variables ***
*** Keywords ***

*** Test Cases ***