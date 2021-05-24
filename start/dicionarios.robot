***Settings***
Documentation       Conhecendo os Dicionários do Robot (Nativo do Python)

***Variables***
# ${SIMPLES}      Fernando
# @{CARROS}       chevette        opala       camaro      mustang
&{CARRO}        nome=Chevette       hp=1500     portas=2        cor=marrom

***Test Cases***
Obtendo valores de um dicionário
    Log To Console      ${CARRO.nome}