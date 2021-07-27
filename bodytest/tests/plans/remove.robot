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

    [Teardown]                              Thinking And Take Screenshot                    2

Cenário: Remover Plano Cadastrado Teclando Enter
    [Tags]                                  temp1

    &{plan}                                 Create Dictionary
    ...                                     title=Remove Registered Plan With Key Enter
    ...                                     duration=4
    ...                                     price=50.00

    Insert Plan                             plan=${plan}

    Go To Plans
    Search Plan By Title                    title=${plan.title}
    Request Removal By Key                  key=${plan.title}
    Wait For Elements State                 css=[role="dialog"]                             visible
    Keyboard Key                            press                                           ArrowRight
    Keyboard Key                            press                                           Enter
    Toaster Text Should Be                  expected_text=Plano removido com sucesso
    Plan Title Should Not Be Visible        title=${plan.title}

    [Teardown]                              Thinking And Take Screenshot                    2

Cenário: Desistir da Exclusão do Plano

    &{plan}                                 Create Dictionary
    ...                                     title=Cancel Remove Registered Plan
    ...                                     duration=6
    ...                                     price=380.00

    Insert Plan                             ${plan}

    Go To Plans
    Search Plan By Title                    title=${plan.title}
    Request Removal By Key                  key=${plan.title}
    Cancel Removal
    Plan Title Should Be Visible            title=${plan.title}
    
