*** Settings ***
Documentation   Suite para testar a classe ContaLibrary

Library         ContaLibrary.py            

*** Test Cases ***
Quando abro uma nova conta deve retornar saldo ZERADO
    Abrir Conta

    ${saldo_final}      Obter Saldo
    ${saldo_esperado}   Convert to Number   0.0

    Should Be Equal     ${saldo_final}      ${saldo_esperado}