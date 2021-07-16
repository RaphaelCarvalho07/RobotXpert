*** Settings ***
Documentation                   Cadastro de alunos

Resource                        ../resources/base.robot

Suite Setup                     Start Admin Session
Test Teardown                   Take Screenshot

*** Keywords ***
Check Type Field On Student Form
    [Arguments]                 ${element}                          ${type}

    Go To Students
    Go To Form Student
    Field Should Be Type        ${element}                          ${type}                               

*** Test Cases ***
Cenário: Novo aluno

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

    [Teardown]                  Thinking And Take Screenshot        2

Cenário: Não deve permitir email duplicado
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
    New Student                 student=${student}
    Toaster Text Should Be      Email já existe no sistema.

    [Teardown]                  Thinking And Take Screenshot        2

Cenário: Todos os campos devem ser obrigatórios
    
    
    @{expected_alerts}          Set Variable
    ...                         Nome é obrigatório
    ...                         O e-mail é obrigatório
    ...                         idade é obrigatória
    ...                         o peso é obrigatório
    ...                         a Altura é obrigatória

    @{got_alert}                Create List

    Go To Students
    Go To Form Student
    Submit Student Form

    FOR                         ${index}                            IN RANGE       1       6
        ${span}                 Get Required Alerts                 ${index}
        Append to List          ${got_alert}                        ${span}
    END

    Log                         ${expected_alerts}
    Log                         ${got_alert}

    Lists Should Be Equal       ${expected_alerts}                  ${got_alert}

Cenário: Validação dos campos numéricos
    [Tags]                      temp
    [Template]                  Check Type Field On Student Form
    ${AGE_FIELD}                number
    ${WEIGHT_FIELD}             number    
    ${FEET_TALL_FIELD}          number

Cenário: Validar campo do tipo email
    [Tags]                      temp
    [Template]                  Check Type Field On Student Form
    ${EMAIL_FIELD}              email
