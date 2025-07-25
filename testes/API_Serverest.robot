*** Settings ***

Resource    ../Resources/usuario.robot
Suite Setup       Criar Sessão    https://serverest.dev
Suite Teardown    Encerrar Sessão

*** Variables ***
    
*** Test Cases ***

CRUD Usuario
      ${id}    Cadastrar Usuário
      Consulta Usuario Lista
      Consulta Usuario ID    ${id}  
