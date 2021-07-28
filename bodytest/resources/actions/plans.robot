*** Settings ***
Documentation                       Ações da feature de Gestão de Planos

*** Variables ***
${TITLE_FIELD}                      id=title  
${DURATION_FIELD}                   id=duration
${PRICE_FIELD}                      css=input[name=price]
${TOTAL_FIELD}                      css=input[name=total]

*** Keywords ***
## Forms
Submit Plan Form
    Click                           xpath=//button[contains(text(), "Salvar")]    

Fill Plan Form 
    [Arguments]                     ${plan}  

    Fill Text                       ${TITLE_FIELD}                              ${plan.title}
    Fill Text                       ${DURATION_FIELD}                           ${plan.duration}
    Fill Text                       ${PRICE_FIELD}                              ${plan.price}

Search Plan By Title
    [Arguments]                     ${title}
    Fill Text                       css=input[placeholder="Buscar plano"]       ${title}                                      

## Links & Buttons
Go To Form Plan
    Click                           css=a[href$="planos/new"] 
    Wait for Elements State         css=h1 >> text=Novo plano                   visible                 5

Give Up Registration
    Click                           text=Voltar    

## Validations
Total Plan Should Be
    [Arguments]                     ${total}
    Get Attribute                   ${TOTAL_FIELD}                              value                   ==              ${total}

Check If Page Plans                   
    Wait For Elements State         css=h1 >> text=Gestão de Planos             visible                 5    

Plan Title Should Be Visible
    [Arguments]                     ${title}

    Wait For Elements State         css=table tbody tr >> text=${title}                                 visible         5

Plan Title Should Not Be Visible
    [Arguments]                     ${title}

    Wait For Elements State         css=table tbody tr >> text=${title}                                 detached        5           
