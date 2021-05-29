***Settings***
Documentation                   Suíte de testes de Login do Administrator

Resource                        ../resources/base.robot

***Test Cases***
Login do Administrador
    [tags]                      admin
    New Browser                 chromium                        False
    New Page                    https://bodytest-web-koi.herokuapp.com

    Login With                  admin@bodytest.com              pwd123             
    Get Text                    css=aside strong                should be       Administrador
    Take Screenshot


Senha incorreta
    [tags]                      temp
    New Browser                 chromium                        False
    New Page                    https://bodytest-web-koi.herokuapp.com
    
    Login With                  admin@bodytest.com              abc123            
    
    Wait For Elements State     css=.Toastify__toast-body >> text=Usuário ou senha inválido     visible     5


Email incorreto
    [tags]                      temp
    New Browser                 chromium                        False
    New Page                    https://bodytest-web-koi.herokuapp.com
    
    Login With                  admin&bodytest.com              abc123            
    
    Wait For Elements State     css=form span >> text=Informe um e-mail válido                  visible     5


Senha não informada
    [tags]                      temp
    New Browser                 chromium                                                        False
    New Page                    https://bodytest-web-koi.herokuapp.com
    
    Login With                  admin&bodytest.com                                              ${EMPTY}             

    Wait For Elements State     css=form span >> text=A senha é obrigatória                     visible     5

Email não informado
    [tags]                      temp
    New Browser                 chromium                                                        False
    New Page                    https://bodytest-web-koi.herokuapp.com
    
    Login With                  ${EMPTY}                                                        abc123       

    Wait For Elements State     css=form span >> text=O e-mail é obrigatório                    visible     5

Email e Senha não informados
    [tags]                      temp
    New Browser                 chromium                                                        False
    New Page                    https://bodytest-web-koi.herokuapp.com

    Login With                  ${EMPTY}                                                        ${EMPTY}

    Wait For Elements State     css=form span >> text=O e-mail é obrigatório                    visible     5
    Wait For Elements State     css=form span >> text=A senha é obrigatória                     visible     5