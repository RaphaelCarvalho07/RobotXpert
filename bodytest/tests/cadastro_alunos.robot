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