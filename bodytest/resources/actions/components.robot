*** Settings ***
Documentation               Ações de componentes genéricos

*** Keywords ***
Toaster Text Should Be
    [Arguments]                     ${expected_text}
        Wait For Elements State     css=.Toastify__toast-body >> text=${expected_text}      visible     5