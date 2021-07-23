*** Settings ***
Documentation                       Cadastro de Planos

Resource                            ${EXECDIR}/resources/base.robot

Suite Setup                         Start Admin Session
Test Teardown                       Take Screenshot

*** Test Cases ***
Cenário: Calcular preço total do plano

    &{plan}                         Create Dictionary       
    ...                             title=Koi Teste
    ...                             duration=12
    ...                             price=19,99     
    ...                             total=R$ 239,88
    
    Go To Plans
    Go To Form Plan
    Fill Plan Form                  plan=${plan}
    Total Plan Should Be            total=${plan.total}

Cenário: Cadastrar Novo Plano
    [Tags]                          temp
    &{plan}                         Create Dictionary       
    ...                             title=Plano Novo
    ...                             duration=12
    ...                             price=50,00  
    ...                             total=R$ 600,00

    Remove Plan By title            ${plan.title}
    Go To Plans
    Go To Form Plan
    Fill Plan Form                  plan=${plan}
    Submit Plan Form
    Toaster Text Should Be          expected_text=Plano cadastrado com sucesso

    [Teardown]                      Thinking And Take Screenshot                    2      

Cenário: Validar Campos Obrigatórios
    [Tags]                          temp

    @{expected_alerts}              Set Variable
    ...                             Informe o título do plano
    ...                             Informe a duração do plano em meses
    @{got_alert}                    Create List

    Go To Plans
    Go To Form Plan
    Submit Plan Form

    FOR                             ${index}                                        IN RANGE       1       3
        ${span}                     Get Required Alerts                             ${index}
        Append to List              ${got_alert}                                    ${span}
    END

    Log                             ${expected_alerts}
    Log                             ${got_alert}

    Lists Should Be Equal           ${expected_alerts}                              ${got_alert}

    [Teardown]                      Thinking And Take Screenshot                    2

Cenário: Desistir do Cadastro do Novo Plano
    [Tags]                          temp
    
    &{plan}                         Create Dictionary       
    ...                             title=Desistir do Plano
    ...                             duration=6
    ...                             price=80,00  
    ...                             total=R$ 480,00

    Go To Plans
    Go To Form Plan
    Fill Plan Form                  plan=${plan}
    Give Up Registration
    Check If Page Plans

Cenário: Validar Limite Máximo de Caracteres Campo Title
    [Tags]                          temp

    &{plan}                         Create Dictionary       
    ...                             title=Too Many Characters
    ...                             duration=6
    ...                             price=80,00  
    ...                             total=R$ 480,00

    Go To Plans
    Go To Form Plan
    ${plan.title}                   Insert Too Many Characters
    Fill Plan Form                  plan=${plan}       
    Submit Plan Form
    Toaster Text Should Be          Erro cadastrar aluno!      #os toasters estão vindo com mensagem relacionada aos Alunos.

    [Teardown]                      Thinking And Take Screenshot                    2
    







