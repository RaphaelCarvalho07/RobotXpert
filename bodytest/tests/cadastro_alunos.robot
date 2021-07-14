*** Settings ***
Documentation                   Cadastro de alunos

Resource                        ../resources/base.robot

Suite Setup                     Start Admin Session

*** Test Cases ***
Novo aluno

    &{student}                  Create Dictionary
    ...                         name=Rapha Koi
    ...                         email=koi@gmail.com
    ...                         age=34
    ...                         weight=83
    ...                         feet_tall=1.74   
    
    Remove Student              ${student.email}
    Go To Students
    Go To Form Student
    New Student                 ${student}
    Toaster Text Should Be      Aluno cadastrado com sucesso.

    [Teardown]                  Thinking And Take Screenshot                        2

Não deve permitir email duplicado
    [Tags]                      dup

    &{student}                  Create Dictionary
    ...                         name=Raphilske Koi
    ...                         email=raphilske@gmail.com
    ...                         age=20
    ...                         weight=70
    ...                         feet_tall=1.80   
    
    Insert Student              ${student}

    Go To Students
    Go To Form Student
    New Student                 ${student}
    Toaster Text Should Be      Email já existe no sistema.

    [Teardown]                  Thinking And Take Screenshot                        2