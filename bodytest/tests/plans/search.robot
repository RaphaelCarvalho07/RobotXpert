*** Settings ***
Documentation                           Buscar Planos

Resource                                ${EXECDIR}/resources/base.robot

Suite Setup                             Start Admin Session
Test Teardown                           Take Screenshot

*** Test Cases ***
Cenário: Busca exata
    [Tags]                              temp

    &{plan}                             Create Dictionary
    ...                                 title=Search a specific plan
    ...                                 duration=33
    ...                                 price=25.00

    Remove Plan By Title                title=${plan.title}
    Insert Plan                         plan=${plan}     
    Go To Plans
    Search Plan By Title                title=${plan.title}
    Plan Title Should Be Visible        title=${plan.title}
    Total Items Should Be               number=1

Cenário: Registro não encontrado
    [Tags]                              temp
    
    ${title}                            Set Variable                        Non-Existent Plan

    Remove Plan By Title                title=${title}
    Go To Plans
    Search Plan By Title                title=${title}
    Register Should Not Be Found

Buscar Planos Por Termo Único
    [Tags]                              temp1
    
    ${fixture}                          Get JSON                            file_name=plans-search.json
    ${plans}                            Set Variable                        ${fixture.plans}
    ${word}                             Set Variable                        ${fixture.word}
    ${total}                            Set Variable                        ${fixture.total}

    Remove Plan By Title                title=${word}

    FOR                                 ${item}                             IN                                  @{plans}
        Insert Plan                     ${item}
    END

    Go To Plans
    Search Plan By Title                title=${word}     
    Total Items Should Be               number=${total}  