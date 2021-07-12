*** Settings ***
Documentation       Tudo começa aqui, meu arquivo base do projeto de automação

Library             Browser

Resource            actions/auth.robot      
Resource            actions/nav.robot  

*** Keywords ***
Start Browser Session
    New Browser                 chromium                        true          
    New Page                    about:blank

Clear LS And Take Screenshot
    Take Screenshot
    LocalStorage Clear

Thinking And Take Screenshot
    [Arguments]         ${timeout}
    
    Sleep               ${timeout}
    Take Screenshot