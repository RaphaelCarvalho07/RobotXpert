*** Settings ***
Documentation               Ações de componentes genéricos

*** Keywords ***
Toaster Text Should Be
    [Arguments]                     ${expected_text}

    Wait For Elements State         css=.Toastify__toast-body >> text=${expected_text}      visible     5

Alert Text Should be
    [Arguments]                     ${expected_text}

    Wait For Elements State         css=form span >> text=${expected_text}                  visible     5

Get Required Alerts
    [Arguments]         ${index}
    ${span}             Get Text                xpath=(//form//span)[${index}]            

    [Return]            ${span}