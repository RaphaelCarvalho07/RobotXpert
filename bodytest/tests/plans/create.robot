*** Settings ***
Documentation                       Cadastro de Planos

Resource                            ${EXECDIR}/resources/base.robot

Suite Setup                         Start Admin Session
Test Teardown                       Take Screenshot

*** Test Cases ***
Cenário: Calcular preço total do plano

    &{plan}                         Create Dictionary       
    ...                             title=Koi Teste
    ...                             duration=12
    ...                             price=19,99     
    ...                             total=R$ 239,88
    
    Go To Plans
    Go To Form Plan
    Fill Plan Form                  plan=${plan}
    Total Plan Should Be            total=${plan.total}                    