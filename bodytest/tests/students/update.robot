*** Settings ***
Documentation                       Atualizar Alunos

Resource                            ${EXECDIR}/resources/base.robot

Suite Setup                         Start Admin Session
Test Teardown                       Take Screenshot

*** Test Cases ***
Cenário: Atualizar um aluno já cadastrado

    ${fixture}                      Get JSON                                                                file_name=students-update.json          

    ${kamalakhan}                   Set Variable                                                            ${fixture.before}
    ${msmarvel}                     Set Variable                                                            ${fixture.after}

    Remove Student By Name          ${kamalakhan.name}
    Remove Student By Name          ${msmarvel.name}

    
    Insert Student                  ${kamalakhan}
    Go To Students
    Search Student By Name          name=${kamalakhan.name}
    Go To Student Update Form       email=${kamalakhan.email}
    Fill Form Student               student=${msmarvel}       
    Toaster Text Should Be          expected_text=Aluno atualizado com sucesso.

    [Teardown]                      Thinking And Take Screenshot                                            2

