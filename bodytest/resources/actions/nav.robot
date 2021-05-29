*** Settings ***
Documentation       Ação do menu superior de navegação

*** Keywords ***
User Should Be Logged In
    [Arguments]                 ${user_name}
    Get Text                    css=aside strong                should be       ${user_name}