*** Settings ***
Documentation                               Remover Plano Cadastrado

Resource                                    ${EXECDIR}/resources/base.robot

Test Setup                                  Start Admin Session
Test Teardown                               Take Screenshot

*** Test Cases ***
Cenário: Remover Plano Cadastrado
    [Tags]                                  temp

    &{plan}                                 Create Dictionary
    ...                                     title=Remove Registered Plan
    ...                                     duration=4
    ...                                     price=50.00

    Insert Plan                             plan=${plan}
    
    Go To Plans
    Search Plan By Title                    title=${plan.title}
    Request Removal By Key                  key=${plan.title}
    Confirm Removal
    Toaster Text Should Be                  expected_text=Plano removido com sucesso
    Plan Title Should Not Be Visible        title=${plan.title}

    [Teardown]                              Thinking And Take Screenshot                            2

Cenário: Remover Plano Cadastrado Teclando Enter
    [Tags]                                  temp

    &{plan}                                 Create Dictionary
    ...                                     title=Remove Registered Plan With Key Enter
    ...                                     duration=4
    ...                                     price=50.00

    Insert Plan                             plan=${plan}

    Go To Plans
    Search Plan By Title                    title=${plan.title}
    Request Removal By Key                  key=${plan.title}
    Wait For Elements State                 css=[role="dialog"]                                     visible
    Keyboard Key                            press                                                   ArrowRight
    Keyboard Key                            press                                                   Enter
    Toaster Text Should Be                  expected_text=Plano removido com sucesso
    Plan Title Should Not Be Visible        title=${plan.title}

    [Teardown]                              Thinking And Take Screenshot                            2

Cenário: Desistir da Exclusão do Plano
    [Tags]                                  temp

    &{plan}                                 Create Dictionary
    ...                                     title=Cancel Remove Registered Plan
    ...                                     duration=6
    ...                                     price=380.00

    Remove Plan By Title                    title=${plan.title}
    Insert Plan                             ${plan}

    Go To Plans
    Search Plan By Title                    title=${plan.title}
    Request Removal By Key                  key=${plan.title}
    Cancel Removal
    Plan Title Should Be Visible            title=${plan.title}

Cenário: Desistir da Exclusão do Plano Teclando ESC
    [Tags]                                  temp

    &{plan}                                 Create Dictionary
    ...                                     title=Cancel Remove Registered Plan With Key ESC
    ...                                     duration=7
    ...                                     price=38.00

    Remove Plan By Title                    title=${plan.title}
    Insert Plan                             ${plan}

    Go To Plans
    Search Plan By Title                    title=${plan.title}
    Request Removal By Key                  key=${plan.title}
    Wait For Elements State                 css=[role="dialog"]                                     visible
    Keyboard Key                            press                                                   Escape
    Plan Title Should Be Visible            title=${plan.title}

Cenário: Desistir da Exclusão do Plano Teclando ENTER
    [Tags]                                  temp

    &{plan}                                 Create Dictionary
    ...                                     title=Cancel Remove Registered Plan With Key ENTER
    ...                                     duration=9
    ...                                     price=108.00

    Remove Plan By Title                    title=${plan.title}
    Insert Plan                             ${plan}

    Go To Plans
    Search Plan By Title                    title=${plan.title}
    Request Removal By Key                  key=${plan.title}
    Wait For Elements State                 css=[role="dialog"]                                     visible
    Keyboard Key                            press                                                   Enter
    Plan Title Should Be Visible            title=${plan.title}    


    
