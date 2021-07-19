***Settings***
Documentation                   Suíte de testes de Login do Administrator

Resource                        ${EXECDIR}/resources/base.robot

Suite Setup                     Start Browser Session
Test Teardown                   Take Screenshot

***Test Cases***
Cenário: Login do Administrador
    [tags]                      admin
    Go To Login Page
    Login With                  admin@bodytest.com              pwd123                 
    User Should Be Logged In    Administrador

    [Teardown]                  Clear LS And Take Screenshot

Cenário: Senha incorreta
    Go To Login Page    
    Login With                  admin@bodytest.com              abc123            
    
    Toaster Text Should Be      Usuário e/ou senha inválidos.

    [Teardown]                  Thinking And Take Screenshot    2

Cenário: Email não cadastrado
    Go To Login Page    
    Login With                  rapha@gmail.com              abc123            
    
    Toaster Text Should Be      Usuário e/ou senha inválidos.

    [Teardown]                  Thinking And Take Screenshot    2


Cenário: Email incorreto
    Go To Login Page    
    Login With                  admin&bodytest.com              abc123            
    
    Alert Text Should be        Informe um e-mail válido


Cenário: Senha não informada
    Go To Login Page    
    Login With                  admin&bodytest.com              ${EMPTY}             

    Alert Text Should be        A senha é obrigatória

Cenário: Email não informado
    Go To Login Page    
    Login With                  ${EMPTY}                        abc123       

    Alert Text Should be        O e-mail é obrigatório

Cenário: Email e Senha não informados
    Go To Login Page
    Login With                  ${EMPTY}                        ${EMPTY}

    Alert Text Should be        O e-mail é obrigatório
    Alert Text Should be        A senha é obrigatória