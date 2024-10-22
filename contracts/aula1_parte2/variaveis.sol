// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract ExemploVariavel {
    uint8 public maxPermit = 255;
    uint8 public testLimit;
    int256 public negativo = -1;
    uint256 public numero;
    int256 public numeroNegativo;

    //external é uma conta externa (eos - external owner account) que pode chamar
    function inserirMaxUint(uint8 _numero) external {
        testLimit = _numero;
    }

    function inserirNumero(uint256 _numero) external {
        numero = _numero;
    }

    /*
        Elementos da Função:

        Visibilidade:

        external: Significa que a função pode ser chamada por contratos externos e transações fora do contrato.
        Isso também implica que não pode ser chamada internamente sem o uso da sintaxe this.testNegativo(...).
        Modificador:

        view: Indica que a função não altera o estado da blockchain. Ou seja, ela apenas lê dados e não pode modificar variáveis armazenadas ou emitir eventos.
        Parâmetro de Entrada:

        _numero: Um valor do tipo uint256 (inteiro positivo sem sinal).
        Como uint256 é sempre não negativo, provavelmente a lógica da função vai tentar converter esse valor em um número negativo no retorno.
        Retorno:

        A função retorna um int256, que é um tipo inteiro com sinal (permite valores negativos e positivos).
    */
    function testNegativo(int256 _numero) external view returns(int256) {
        int256 NumNegativo = _numero;
        int256 somaDosNegativos = negativo - NumNegativo;
        return (somaDosNegativos);
    }
}