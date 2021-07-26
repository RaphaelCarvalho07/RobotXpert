*** Settings ***
Documentation                       Cadastro de Planos

Resource                            ${EXECDIR}/resources/base.robot

Suite Setup                         Start Admin Session
Test Teardown                       Thinking And Take Screenshot                    timeout=2

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

    [Teardown]                      Take Screenshot

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
    Total Items Should Be           number=1

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

Cenário: Desistir do Cadastro do Novo Plano
    [Tags]                          temp
    
    &{plan}                         Create Dictionary       
    ...                             title=Desistir do Plano
    ...                             duration=6
    ...                             price=80,00  

    Go To Plans
    Go To Form Plan
    Fill Plan Form                  plan=${plan}
    Give Up Registration
    Check If Page Plans
    
    [Teardown]                      Take Screenshot

Cenário: Validar Limite Máximo de Caracteres campo Title
    [Tags]                          temp

    &{plan}                         Create Dictionary       
    ...                             title=Too Many Characters
    ...                             duration=6
    ...                             price=80,00  

    Go To Plans
    Go To Form Plan
    ${plan.title}                   Insert Too Many Characters
    Fill Plan Form                  plan=${plan}       
    Submit Plan Form
    Toaster Text Should Be          Erro cadastrar aluno!      #os toasters estão vindo com mensagem relacionada aos Alunos.

Cenário: Validar Limite Máximo de Duração do Plano
    [Tags]                          temp

    &{plan}                         Create Dictionary       
    ...                             title=Too Many Duration's Month
    ...                             duration=61
    ...                             price=30,00  

    Go To Plans
    Go To Form Plan
    Fill Plan Form                  plan=${plan}
    Submit Plan Form
    Alert Text Should be            expected_text=A duração dever ser no máximo 60 meses 

Cenário: Informar valor R$ 0,00 no campo Preço Mensal
    [Tags]                          temp

    &{plan}                         Create Dictionary       
    ...                             title=Price like 0,00
    ...                             duration=12
    ...                             price=0,00  

    Go To Plans
    Go To Form Plan
    Fill Plan Form                  plan=${plan}
    Submit Plan Form
    Toaster Text Should Be          expected_text=O valor do plano deve ser maior que zero!

Cenário: Validar Limite Máximo de Valor do Plano
    [Tags]                          temp

    &{plan}                         Create Dictionary       
    ...                             title=Amount higher than allowed
    ...                             duration=12
    ...                             price=800000000,00

    Go To Plans
    Go To Form Plan
    Fill Plan Form                  plan=${plan}
    Submit Plan Form
    Toaster Text Should Be          expected_text=Erro cadastrar aluno!

Cenário: Criar Plano duplicado
    [Tags]                          temp1

    &{plan}                         Create Dictionary       
    ...                             title=Duplicated Plan
    ...                             duration=12
    ...                             price=50.00

    Remove Plan By Title            ${plan.title}
    Insert Plan                     ${plan}
    Go To Plans
    Go To Form Plan
    Fill Plan Form                  plan=${plan}
    Submit Plan Form                
    Toaster Text Should Be          expected_text=Plano cadastrado com sucesso
    Check If Page Plans
    Search Plan By Title            title=${plan.title}
    Plan Title Should Be Visible    title=${plan.title}
    Total Items Should Be           2







