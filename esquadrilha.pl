resolve_avioes(S) :-
    S = esquadrilha(_,_,_,_,_), % Define a estrutura de 5 posições

    % 1. O avião do Cel. Milton solta fumaça Vermelha.
    algum_aviao(A1, S), piloto(A1, milton), fumaca(A1, vermelha),
    
    % 2. O Rádio transmissor do Ten. Walter está com problemas.
    algum_aviao(A2, S), piloto(A2, walter), anomalia(A2, radio),
    
    % 3. O piloto do avião que solta fumaça Verde adora Pescar.
    algum_aviao(A3, S), fumaca(A3, verde), esporte(A3, pescar),
    
    % 4. O Major Rui joga Futebol nos finais de semana.
    algum_aviao(A4, S), piloto(A4, rui), esporte(A4, futebol),
    
    % 5. O avião que solta fumaça Verde está imediatamente à direita do avião que solta fumaça Branca.
    exatamente_a_direita(A5_Dir, A5_Esq, S), fumaca(A5_Dir, verde), fumaca(A5_Esq, branca),
    
    % 6. O piloto que bebe Leite está com o Altímetro desregulado.
    algum_aviao(A6, S), bebida(A6, leite), anomalia(A6, altimetro),
    
    % 7. O piloto do avião que solta fumaça Preta bebe Cerveja.
    algum_aviao(A7, S), fumaca(A7, preta), bebida(A7, cerveja),
    
    % 8. O praticante de Natação pilota o avião que solta fumaça Vermelha.
    algum_aviao(A8, S), esporte(A8, natacao), fumaca(A8, vermelha),
    
    % 9. O Cap. Farfarelli está na ponta esquerda da formação.
    posicao(1, A9, S), piloto(A9, farfarelli),
    
    % 10. O piloto que bebe Café voa ao lado do avião que está com pane no sistema Hidráulico.
    ao_lado(A10_Cafe, A10_Hid, S), bebida(A10_Cafe, cafe), anomalia(A10_Hid, hidraulico),
    
    % 11. O piloto que bebe Cerveja voa ao lado do piloto que enfrenta problemas na Bússola.
    ao_lado(A11_Cerveja, A11_Bussola, S), bebida(A11_Cerveja, cerveja), anomalia(A11_Bussola, bussola),
    
    % 12. O homem que pratica Equitação gosta de beber Chá.
    algum_aviao(A12, S), esporte(A12, equitacao), bebida(A12, cha),
    
    % 13. O Cap. Nascimento bebe somente Água.
    algum_aviao(A13, S), piloto(A13, nascimento), bebida(A13, agua),
    
    % 14. O Cap. Farfarelli voa ao lado do avião que solta fumaça Azul.
    algum_aviao(A14_Farfarelli, S), piloto(A14_Farfarelli, farfarelli),
    algum_aviao(A14_Azul, S), fumaca(A14_Azul, azul),
    ao_lado(A14_Farfarelli, A14_Azul, S),
    
    % 15. Na formação, há exatamente um avião entre o que tem problema Hidráulico e o com pane no Altímetro, não necessariamente nessa ordem.
    separado_por_um(A15_Hid, A15_Alt, S), anomalia(A15_Hid, hidraulico), anomalia(A15_Alt, altimetro),
    
    % --- Fechamento ---
    % Garante que os itens não mencionados nas pistas também façam parte da solução.
    
    algum_aviao(A_Fechamento1, S), anomalia(A_Fechamento1, temperatura),
    algum_aviao(A_Fechamento2, S), esporte(A_Fechamento2, tenis).

% aviao(Fumaça, Piloto, Anomalia, Bebida, Esporte)
fumaca(aviao(F,_,_,_,_), F).
piloto(aviao(_,P,_,_,_), P).
anomalia(aviao(_,_,A,_,_), A).
bebida(aviao(_,_,_,B,_), B).
esporte(aviao(_,_,_,_,E), E).

algum_aviao(X, esquadrilha(X,_,_,_,_)).
algum_aviao(X, esquadrilha(_,X,_,_,_)).
algum_aviao(X, esquadrilha(_,_,X,_,_)).
algum_aviao(X, esquadrilha(_,_,_,X,_)).
algum_aviao(X, esquadrilha(_,_,_,_,X)).

exatamente_a_direita(X, Y, esquadrilha(Y,X,_,_,_)).
exatamente_a_direita(X, Y, esquadrilha(_,Y,X,_,_)).
exatamente_a_direita(X, Y, esquadrilha(_,_,Y,X,_)).
exatamente_a_direita(X, Y, esquadrilha(_,_,_,Y,X)).

exatamente_a_esquerda(X, Y, S) :-
    exatamente_a_direita(Y, X, S).

em_algum_lugar_entre(M,I,F,esquadrilha(I,M,F,_,_)).
em_algum_lugar_entre(M,I,F,esquadrilha(I,M,_,F,_)).
em_algum_lugar_entre(M,I,F,esquadrilha(I,M,_,_,F)).
em_algum_lugar_entre(M,I,F,esquadrilha(I,_,M,F,_)).
em_algum_lugar_entre(M,I,F,esquadrilha(I,_,M,_,F)).
em_algum_lugar_entre(M,I,F,esquadrilha(I,_,_,M,F)). 
em_algum_lugar_entre(M,I,F,esquadrilha(_,I,M,F,_)).
em_algum_lugar_entre(M,I,F,esquadrilha(_,I,M,_,F)).
em_algum_lugar_entre(M,I,F,esquadrilha(_,I,_,M,F)).
em_algum_lugar_entre(M,I,F,esquadrilha(_,_,I,M,F)).

posicao(1, X, esquadrilha(X,_,_,_,_)).
posicao(2, X, esquadrilha(_,X,_,_,_)).
posicao(3, X, esquadrilha(_,_,X,_,_)).
posicao(4, X, esquadrilha(_,_,_,X,_)).
posicao(5, X, esquadrilha(_,_,_,_,X)).

em_algum_lugar_a_esquerda(X,Y,esquadrilha(X,Y,_,_,_)).
em_algum_lugar_a_esquerda(X,Y,esquadrilha(X,_,Y,_,_)).
em_algum_lugar_a_esquerda(X,Y,esquadrilha(X,_,_,Y,_)).
em_algum_lugar_a_esquerda(X,Y,esquadrilha(X,_,_,_,Y)).
em_algum_lugar_a_esquerda(X,Y,esquadrilha(_,X,Y,_,_)).
em_algum_lugar_a_esquerda(X,Y,esquadrilha(_,X,_,Y,_)).
em_algum_lugar_a_esquerda(X,Y,esquadrilha(_,X,_,_,Y)).
em_algum_lugar_a_esquerda(X,Y,esquadrilha(_,_,X,Y,_)).
em_algum_lugar_a_esquerda(X,Y,esquadrilha(_,_,X,_,Y)).
em_algum_lugar_a_esquerda(X,Y,esquadrilha(_,_,_,X,Y)).

em_algum_lugar_a_direita(X, Y, S) :-
    em_algum_lugar_a_esquerda(Y, X, S).

ao_lado(X, Y, S) :-
    exatamente_a_direita(X, Y, S);
    exatamente_a_direita(Y, X, S).

uma_das_pontas(X, esquadrilha(X,_,_,_,_)).
uma_das_pontas(X, esquadrilha(_,_,_,_,X)).

separado_por_um(X, Y, esquadrilha(X,_,Y,_,_)).
separado_por_um(X, Y, esquadrilha(_,X,_,Y,_)).
separado_por_um(X, Y, esquadrilha(_,_,X,_,Y)).
separado_por_um(X, Y, esquadrilha(Y,_,X,_,_)).
separado_por_um(X, Y, esquadrilha(_,Y,_,X,_)).
separado_por_um(X, Y, esquadrilha(_,_,Y,_,X)).