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
    Update A Student                student=${msmarvel}       
    Toaster Text Should Be          expected_text=Aluno atualizado com sucesso.

    [Teardown]                      Thinking And Take Screenshot                                            2

*** Keywords ***

Go To Student Update Form
    [Arguments]                     ${email}

    Click                           xpath=//td[contains(text(), "${email}")]/..//a[@class="edit"]
    Wait for Elements State         css=h1 >> text=Edição de aluno                                          visible                                 5

Update A Student
    [Arguments]                     ${student}  

    Fill Text                       ${NAME_FIELD}                                       ${student.name}
    Fill Text                       ${EMAIL_FIELD}                                      ${student.email}
    Fill Text                       ${AGE_FIELD}                                        ${student.age}
    Fill Text                       ${WEIGHT_FIELD}                                     ${student.weight}
    Fill Text                       ${FEET_TALL_FIELD}                                  ${student.feet_tall}

    Submit Student Form