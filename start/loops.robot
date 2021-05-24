***Settings***
Documentation       Laços de repeetição (Loops)

***Variables***
@{AVENGERS}                 Hulk        Thor                Ironman     Cap     Spiderman
@{JUSTICE}                  Superman    Wonder Woman        Batman      Arrow

***Test Cases***
Meu Primeiro Loop

    FOR     ${item}     IN      @{AVENGERS}
        IF      $item == 'Spiderman'
            Log To Console  Obtendo o vingador: ${item}         
        END         
    END

Outro Loop
    [tags]      thor
    FOR     ${item}     IN      @{AVENGERS}
         Exit For Loop IF  $item == 'Thor'
         Log To Console  Obtendo o vingador: ${item}    
    END