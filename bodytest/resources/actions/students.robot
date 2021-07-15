*** Settings ***
Documentation                   Ações da feature de gestão de alunos

*** Keywords ***
Go To Form Student
    Click                       css=a[href$="alunos/new"] 
    Wait for Elements State     css=h1 >> text=Novo aluno                           visible                     5

Submit Student Form
    Click                       xpath=//button[contains(text(), "Salvar")]    

New Student
    [Arguments]                 ${student}  

    Fill Text                   css=input[name=name]                                ${student.name}
    Fill Text                   css=input[name=email]                               ${student.email}
    Fill Text                   css=input[name=age]                                 ${student.age}
    Fill Text                   css=input[name=weight]                              ${student.weight}
    Fill Text                   css=input[name=feet_tall]                           ${student.feet_tall}

    Submit Student Form