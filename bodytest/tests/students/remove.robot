*** Settings ***
Documentation                           Remover Alunos

Resource                                ${EXECDIR}/resources/base.robot

Test Setup                              Start Admin Session
Test Teardown                           Take Screenshot                          

*** Test Cases ***
Cenário: Remover aluno cadastrado

    &{student}                          Create Dictionary
    ...                                 name=Koi Targaryen
    ...                                 email=targaryen@gmail.com
    ...                                 age=18
    ...                                 weight=85
    ...                                 feet_tall=1.95

    Insert Student                      ${student}
    Go To Students
    Search Student By Name              name=${student.name}        
    Request Removal By Key              key=${student.email}
    Confirm Removal
    Toaster Text Should Be              expected_text=Aluno removido com sucesso.
    Student Should Not Be Visible       email=${student.email}

    [Teardown]                          Thinking And Take Screenshot            2

Cenário: Desistir da exclusão    

    &{student}                          Create Dictionary
    ...                                 name=Robert Downey Jr
    ...                                 email=ironman@marvel.com
    ...                                 age=18
    ...                                 weight=85
    ...                                 feet_tall=1.95

    Insert Student                      ${student}
    Go To Students
    Search Student By Name              name=${student.name}   
    Request Removal By Key              key=${student.email}
    Cancel Removal
    Student Should Be Visible           email=${student.email}      