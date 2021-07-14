*** Settings ***
Documentation                   Cadastro de alunos

Resource                        ../resources/base.robot

Suite Setup                     Start Admin Session

*** Test Cases ***
Novo aluno
    Remove Student              koi@gmail.com
    Go To Students
    Go To Form Student
    New Student  
    ...     name=Rapha Koi
    ...     email=koi@gmail.com  
    ...     age=34
    ...     weight=83
    ...     feet_tall=1.74
    Toaster Text Should Be      Aluno cadastrado com sucesso.

    [Teardown]                  Thinking And Take Screenshot                        2