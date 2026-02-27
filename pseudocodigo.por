programa {

funcao cadeia nome_carta(inteiro valor) {
    se (valor == 1)  { retorne "4  (mais fraca do baralho)" }
    se (valor == 2)  { retorne "5" }
    se (valor == 3)  { retorne "6" }
    se (valor == 4)  { retorne "7" }
    se (valor == 5)  { retorne "Dama  (Q)" }
    se (valor == 6)  { retorne "Valete (J)" }
    se (valor == 7)  { retorne "Rei   (K)" }
    se (valor == 8)  { retorne "As" }
    se (valor == 9)  { retorne "2" }
    se (valor == 10) { retorne "3" }
    se (valor == 11) { retorne "Manilha de Ouro" }
    se (valor == 12) { retorne "Manilha de Espadas" }
    se (valor == 13) { retorne "Manilha de Copas" }
    se (valor == 14) { retorne "Manilha de Paus (mais forte)" }
    retorne "Carta invalida"
}

funcao inteiro selecionar_carta_media(inteiro mao[]) {
    inteiro a
    inteiro b
    inteiro c
    inteiro temp
    a = mao[0]
    b = mao[1]
    c = mao[2]

    se (a > b) {
        temp = a
        a = b
        b = temp
    }
    se (b > c) {
        temp = b
        b = c
        c = temp
    }
    se (a > b) {
        temp = a
        a = b
        b = temp
    }
    retorne b
}

funcao logico tenho_carta_maior(inteiro mao[], inteiro carta_mesa) {
    para (inteiro i = 0; i < 3; i++) {
        se (mao[i] > carta_mesa) {
            retorne verdadeiro
        }
    }
    retorne falso
}

funcao inteiro selecionar_menor_carta_vencedora(inteiro mao[], inteiro carta_mesa) {
    inteiro menor
    menor = 99
    para (inteiro i = 0; i < 3; i++) {
        se (mao[i] > carta_mesa) {
            se (mao[i] < menor) {
                menor = mao[i]
            }
        }
    }
    retorne menor
}

funcao inteiro selecionar_carta_mais_fraca(inteiro mao[]) {
    inteiro fraca
    fraca = 99
    para (inteiro i = 0; i < 3; i++) {
        se (mao[i] < fraca) {
            fraca = mao[i]
        }
    }
    retorne fraca
}

funcao jogar_na_mesa(inteiro carta) {
    escreva("  Carta Jogada: ", nome_carta(carta), "\n")
    escreva("  Valor numerico: ", carta, "\n")
}

funcao inicio() {

    inteiro minha_mao[3]
    inteiro carta_adversario_mesa
    inteiro minha_carta_escolhida
    logico mesa_estiver_vazia = falso

    // Tabela oficial de cartas do trucão paulista (Baseamos no que estava dentro do Artigo - Tabela 1)
    escreva("  TRUCO - TABELA DAS CARTAS (Ordem crecente = 1 mais fraco -> 14 mais forte)\n")
    escreva("  Valor  1  ->  4\n")
    escreva("  Valor  2  ->  5\n")
    escreva("  Valor  3  ->  6\n")
    escreva("  Valor  4  ->  7\n")
    escreva("  Valor  5  ->  Dama  (Q)\n")
    escreva("  Valor  6  ->  Valete (J)\n")
    escreva("  Valor  7  ->  Rei   (K)\n")
    escreva("  Valor  8  ->  As\n")
    escreva("  Valor  9  ->  2\n")
    escreva("  Valor 10  ->  3\n")
    escreva("  Valor 11  ->  Manilha de Ouro\n")
    escreva("  Valor 12  ->  Manilha de Espadas\n")
    escreva("  Valor 13  ->  Manilha de Copas\n")
    escreva("  Valor 14  ->  Manilha de Paus\n")

    // Leitura da carta do joador
    escreva("Quais são suas 3 cartas?\n")
    para (inteiro i = 0; i < 3; i++) {
        escreva("Digite o valor da carta", i + 1, " (1 a 14): ")
        leia(minha_mao[i])
        escreva(">> Carta ", i + 1, ": ", nome_carta(minha_mao[i]), "\n")
    }

    // Leitura da carta do adversariuos
    escreva("\nCarta do adversario\n")
    escreva("Digite o valor da carta do adversario na mesa (1 a 14): ")
    leia(carta_adversario_mesa)
    escreva(">> Adversario jogou: ", nome_carta(carta_adversario_mesa), "\n")

    // Raciocinio do agente inteligente
    escreva("\nRACIOCINIO DO AGENTE\n")
    se (mesa_estiver_vazia == verdadeiro) {
        minha_carta_escolhida = selecionar_carta_media(minha_mao)
        escreva("-> Mesa vazia. Estrategia: Jogar carta mediana para sondar.\n")
    } senao {
        se (tenho_carta_maior(minha_mao, carta_adversario_mesa) == verdadeiro) {
            minha_carta_escolhida = selecionar_menor_carta_vencedora(minha_mao, carta_adversario_mesa)
            escreva("-> Tenho carta maior! Estrategia: Economizar as fortes,\n")
            escreva("   jogar a menor carta que ainda garante a vitoria.\n")
        } senao {
            minha_carta_escolhida = selecionar_carta_mais_fraca(minha_mao)
            escreva("-> Nao tenho carta maior. Estrategia: Descartar (sujar)\n")
            escreva("   a pior carta da mao.\n")
        }
    }

    // Resultado final da rodada
    jogar_na_mesa(minha_carta_escolhida)

    escreva("\nResultado da Rodada\n")
    se (minha_carta_escolhida > carta_adversario_mesa) {
        escreva("RESULTADO: Você venceu está rodada!\n")
    } senao {
        se (minha_carta_escolhida == carta_adversario_mesa) {
            escreva("RESULTADO: Empate nesta rodada!\n")
        } senao {
            escreva("RESULTADO: O Adversário venceu está rodada!\n")
        }
    }
}
}