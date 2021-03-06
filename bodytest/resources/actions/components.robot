*** Settings ***
Documentation                       Ações de componentes genéricos

*** Keywords ***
## Validations
Toaster Text Should Be
    [Arguments]                     ${expected_text}

    Wait For Elements State         css=.Toastify__toast-body >> text=${expected_text}      visible                             5

Alert Text Should be
    [Arguments]                     ${expected_text}

    Wait For Elements State         css=form span >> text=${expected_text}                  visible                             5

Field Should Be Type
    [Arguments]                     ${element}                                              ${type}

    ${attr}                         Get Attribute                                           ${element}                          type
    Should Be Equal                 ${attr}                                                 ${type}

Register Should Not Be Found
    Wait For Elements State         css=div >> text=Nenhum registro encontrado.             visible                             5
    Wait For Elements State         css=table                                               detached                            5

Total Items Should Be
    [Arguments]                     ${number}

    ${element}                      Set Variable                                            css=#pagination .total

    Wait For Elements State         ${element}                                              visible                             5
    Get Text                        ${element}                                              ==                                  Total: ${number}        

## Return Elements & Texts
Get Required Alerts
    [Arguments]                     ${index}
    ${span}                         Get Text                                                xpath=(//form//span)[${index}]            

    [Return]                        ${span}

Insert Too Many Characters
    ${varchar}                     Replace Variables                                       11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111264
    [Return]                       ${varchar}  

### links & Buttons
Request Removal By Key
    [Arguments]                     ${key}
    Click                           xpath=//td[contains(text(),"${key}")]/../td//button[@id="trash"]    

Confirm Removal
    Click                           text=SIM, pode apagar!

Cancel Removal       
    Click                           text=NÃO        