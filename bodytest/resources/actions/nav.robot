*** Settings ***
Documentation       Ação do menu superior de navegação

*** Keywords ***
Go To Students
    Click                       css=a[href$=alunos]
    Wait for Elements State     css=h1 >> text=Gestão de alunos                     visible                     5

User Should Be Logged In
    [Arguments]                 ${user_name}
    Get Text                    css=aside strong                should be       ${user_name}