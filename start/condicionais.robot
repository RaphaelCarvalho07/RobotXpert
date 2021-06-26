*** Settings ***
Documentation       Trabalhando com Condicionais

*** Test Cases ***
Carteira de Motorista
    ${idade}=       Set Variable        18

    IF      ${idade} >= 18
        Log To Console      Você pode tirar sua CNH
    ELSE
        log to Console      Você pode andar de bicicleta
    END

Navegador
    [tags]          browser
    ${browser}=     Set Variable        Firefox

    IF          '${browser}' == 'Firefox'
        Log to Console      Chamando ${browser}
    ELSE IF     '${browser}' == 'Chrome' 
        Log to Console      Chamando ${browser}
    ELSE IF     '${browser}' == 'Webkit'  
        Log to Console      Chamando ${browser}
    ELSE
        Fail      Navegador Incorreto.
    END