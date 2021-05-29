*** Settings ***
Documentation       Ações de autorização


*** Keywords ***
Go To Login Page
    New Browser                 chromium                        false          
    New Page                    https://bodytest-web-koi.herokuapp.com

Login With
    [Arguments]     ${email}    ${pass}

    Fill Text                   css=input[name=email]           ${email}
    Fill Text                   css=input[name=password]        ${pass}
    Click                       text=Entrar

Toaster Text Should Be
    [Arguments]                     ${expected_text}
        Wait For Elements State     css=.Toastify__toast-body >> text=${expected_text}     visible     5

Alert Text Should be
    [Arguments]                     ${expected_text}
        Wait For Elements State     css=form span >> text=${expected_text}                  visible     5