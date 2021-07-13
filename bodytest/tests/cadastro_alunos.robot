*** Settings ***
Documentation                   Cadastro de alunos

Resource                        ../resources/base.robot

Suite Setup                     Start Browser Session

*** Test Cases ***
Novo aluno
    # Pré-condição
    Go To Login Page
    Login With                  admin@bodytest.com                                  pwd123                 
    User Should Be Logged In    Administrador

    Click                       css=a[href$=alunos]
    Wait for Elements State     css=h1 >> text=Gestão de alunos                     visible                     5     

    Click                       css=a[href$="alunos/new"] 
    Wait for Elements State     css=h1 >> text=Novo aluno                           visible                     5

    # Ações do cenário

    Fill Text                   css=input[name=name]                                Raphael Koi
    Fill Text                   css=input[name=email]                               koi@gmail.com
    Fill Text                   css=input[name=age]                                 34
    Fill Text                   css=input[name=weight]                              83
    Fill Text                   css=input[name=feet_tall]                           1.70

    Click                       xpath=//button[contains(text(), "Salvar")]

    # Validação

    Toaster Text Should Be      Aluno cadastrado com sucesso.
    [Teardown]                  Thinking And Take Screenshot                        2