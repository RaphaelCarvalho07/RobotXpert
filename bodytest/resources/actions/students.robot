*** Settings ***
Documentation                   Ações da feature de gestão de alunos

*** Keywords ***
Go To Form Student
    Click                       css=a[href$="alunos/new"] 
    Wait for Elements State     css=h1 >> text=Novo aluno                           visible                     5

New Student
    [Arguments]                 ${name}     ${email}    ${age}      ${weight}       ${feet_tall}  

    Fill Text                   css=input[name=name]                                ${name}
    Fill Text                   css=input[name=email]                               ${email}
    Fill Text                   css=input[name=age]                                 ${age}
    Fill Text                   css=input[name=weight]                              ${weight}
    Fill Text                   css=input[name=feet_tall]                           ${feet_tall}

    Click                       xpath=//button[contains(text(), "Salvar")]  