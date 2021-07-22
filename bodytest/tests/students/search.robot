*** Settings ***
Documentation                                   Buscar Alunos

Resource                                        ${EXECDIR}/resources/base.robot

Suite Setup                                     Start Admin Session
Test Teardown                                   Take Screenshot

*** Test Cases ***
Cenário: Busca exata

    &{student}                                  Create Dictionary
    ...                                         name=Steve Jobs
    ...                                         email=jobs@apple.com
    ...                                         age=45
    ...                                         weight=80
    ...                                         feet_tall=1.80

    Remove Student By Name                      ${student.name}
    Insert Student                              ${student}
    Go To Students              
    Search Student By Name                      name=${student.name}
    Student Name Should Be Visible              name=${student.name}
    Total Items Should Be                       number=1

Cenário: Registro não encontrado

    ${name}                                     Set Variable                                    Barão Zemo             

    Remove Student By Name                      name=${name} 
    Go To Students
    Search Student By Name                      name=${name} 
    Register Should Not Be Found    

Cenário: Busca alunos por um único termo
    [Tags]     json 

    # David
    # David Guetta
    # David Bowie    
    # David Beckham

    ${fixture}                                  Get JSON                                        file_name=students-search.json

    ${students}                                 Set Variable                                    ${fixture['students']}

    ${word}                                     Set Variable                                    ${fixture['word']}
    ${total}                                    Set Variable                                    ${fixture['total']}

    Remove Student By Name                      name=${word}

    FOR                                         ${item}                                         IN                                                   @{students}
        Insert Student                          ${item}
    END

    Go To Students
    Search Student By Name                      name=${word}
    
    FOR                                         ${item}                                         IN                                                   @{students}
        Student Name Should Be Visible          name=${item['name']}
    END

    Total Items Should Be                       number=${total}