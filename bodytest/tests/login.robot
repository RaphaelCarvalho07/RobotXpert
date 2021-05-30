***Settings***
Documentation                   Suíte de testes de Login do Administrator

Resource                        ../resources/base.robot

Suite Setup                     Start Browser Session
Test Teardown                   Take Screenshot

***Test Cases***
Login do Administrador
    [tags]                      admin
    Go To Login Page
    Login With                  admin@bodytest.com              pwd123                 
    User Should Be Logged In    Administrador

    [Teardown]                  Clear LS And Take Screenshot

Senha incorreta
    [tags]                      temp
    Go To Login Page    
    Login With                  admin@bodytest.com              abc123            
    
    Toaster Text Should Be      Usuário ou senha inválido

    [Teardown]                  Thinking And Take Screenshot    2


Email incorreto
    [tags]                      temp
    Go To Login Page    
    Login With                  admin&bodytest.com              abc123            
    
    Alert Text Should be        Informe um e-mail válido


Senha não informada
    [tags]                      temp
    Go To Login Page    
    Login With                  admin&bodytest.com              ${EMPTY}             

    Alert Text Should be        A senha é obrigatória

Email não informado
    [tags]                      temp
    Go To Login Page    
    Login With                  ${EMPTY}                        abc123       

    Alert Text Should be        O e-mail é obrigatório

Email e Senha não informados
    [tags]                      temp
    Go To Login Page
    Login With                  ${EMPTY}                        ${EMPTY}

    Alert Text Should be        O e-mail é obrigatório
    Alert Text Should be        A senha é obrigatória