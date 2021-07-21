*** Settings ***
Documentation                                   Buscar Alunos

Library                                         OperatingSystem

Resource                                        ${EXECDIR}/resources/base.robot

# Suite Setup                                     Start Admin Session
# Test Teardown                                   Take Screenshot

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
    ${file}=                                    Get File                                        ${EXECDIR}/resources/fixtures/students-search.json
    ${json_object}                              Evaluate                                        json.loads($file)                                           json
    # Log To Console                              ${json_object['students']}

    FOR                                         ${item}                                         IN                                                          @{json_object['students']}
        Log To Console                          ${item['name']}
    END