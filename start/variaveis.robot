**Settings***
Documentation       Exemplos de variáveis

Library     app/nome.py

***Variables***
${APELIDO}      Papito

***Test Cases***
Exemplo 01
    # ${nome}     Set Variable        Fernando
    ${nome}     Obter Nome
    Set Suite Variable      ${nome}

    Log to Console          ${nome}

    Log to Console          ${APELIDO}

Exemplo 02
    Log to Console          ${nome}
    Log to Console          ${APELIDO}