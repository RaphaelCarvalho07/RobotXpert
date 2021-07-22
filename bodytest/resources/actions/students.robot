*** Settings ***
Documentation                       Ações da feature de Gestão de Alunos

*** Variables ***
${NAME_FIELD}                       css=input[name=name]
${EMAIL_FIELD}                      css=input[name=email]
${AGE_FIELD}                        css=input[name=age]
${EMAIL_FIELD}                      css=input[name=email]
${WEIGHT_FIELD}                     css=input[name=weight]
${FEET_TALL_FIELD}                  css=input[name=feet_tall]

*** Keywords ***

## Forms
Submit Student Form
    Click                           xpath=//button[contains(text(), "Salvar")]    

Fill Form Student
    [Arguments]                     ${student}  

    Fill Text                       ${NAME_FIELD}                                                               ${student.name}
    Fill Text                       ${EMAIL_FIELD}                                                              ${student.email}
    Fill Text                       ${AGE_FIELD}                                                                ${student.age}
    Fill Text                       ${WEIGHT_FIELD}                                                             ${student.weight}
    Fill Text                       ${FEET_TALL_FIELD}                                                          ${student.feet_tall}

    Submit Student Form

Search Student By Name
    [Arguments]                     ${name}
    Fill Text                       css=input[placeholder="Buscar aluno"]                                       ${name}    

### Formato usado pelo Papito
# Update A Student
#     [Arguments]                     ${student}  

#     Fill Text                       ${NAME_FIELD}                                       ${student.name}
#     Fill Text                       ${EMAIL_FIELD}                                      ${student.email}
#     Fill Text                       ${AGE_FIELD}                                        ${student.age}
#     Fill Text                       ${WEIGHT_FIELD}                                     ${student.weight}
#     Fill Text                       ${FEET_TALL_FIELD}                                  ${student.feet_tall}

#     Submit Student Form                                        

## Links & Buttons
Go To Form Student
    Click                           css=a[href$="alunos/new"] 
    Wait for Elements State         css=h1 >> text=Novo aluno                                                   visible                 5

Go To Student Update Form
    [Arguments]                     ${email}

    Click                           xpath=//td[contains(text(), "${email}")]/..//a[@class="edit"]
    Wait for Elements State         css=h1 >> text=Edição de aluno                                              visible                 5     

Request Removal By Email
    [Arguments]                     ${email}
    Click                           xpath=//td[contains(text(),"${email}")]/../td//button[@id="trash"]    

Confirm Removal
    Click                           text=SIM, pode apagar!

Cancel Removal       
    Click                           text=NÃO

## Validations
Student Should Not Be Visible
    [Arguments]                     ${email}

    Wait For Elements State         xpath=//td[contains(text(),"${email}")]                                     detached                5

Student Should Be Visible
    [Arguments]                     ${email}

    Wait For Elements State         xpath=//td[contains(text(),"${email}")]                                     visible                 5

Student Name Should Be Visible
    [Arguments]                     ${name}

    Wait For Elements State         css=table tbody tr >> text=${name}                                          visible                 5           