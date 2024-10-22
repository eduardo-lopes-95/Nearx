// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract ExemploVariavelP2 {
    bool permissao;
    address public contaRegistrada;
    string public nome;
    bytes public MeusBytes;

    function mudarPermissao(bool _change) external {
        permissao = _change;
    }

    function RegistrarEndereco(address _endereco) external {
        contaRegistrada = _endereco;
    }

    /*
        Elementos da Função:

        Visibilidade:

        external: A função só pode ser chamada por contratos ou contas externas. Não pode ser chamada diretamente por outras funções internas do contrato, a menos que seja via this.registrarMeuEndereco(...).
        Parâmetro de Entrada:

        _meunome: Uma string armazenada na memória durante a execução da função. Esse dado existe apenas enquanto a função é executada e não é persistido na blockchain por padrão.
        Variável de Estado:

        A função atribui o endereço do chamador (msg.sender) à variável contaRegistrada. Essa variável deve ser declarada previamente no contrato como uma variável de estado do tipo address.

    */

    function registrarMeuEndereco(string memory _meunome) external {
        contaRegistrada = msg.sender;
        nome = _meunome;
    }

    function armazenarDados(bytes memory _dados) public {
        MeusBytes = _dados;
    }

    /*
    
    Elementos da Função
        Visibilidade:

        external: Esta função pode ser chamada por outras contas ou contratos externos. Não pode ser chamada diretamente dentro do contrato sem usar a sintaxe this.convertStringBytes(...).
        Modificador:

        pure: Indica que a função não lê nem modifica o estado da blockchain. Ela apenas realiza operações baseadas nos parâmetros fornecidos.
        Parâmetro de Entrada:

        _minhafrase: Uma string passada como parâmetro. A string é armazenada temporariamente na memória durante a execução da função.
        Retorno:

        A função retorna um valor do tipo bytes32, que é uma sequência fixa de 32 bytes.
    */

    function convertStringBytes(string memory _minhafrase) external pure returns (bytes32) {
        bytes32 minhafrase = bytes32(bytes(_minhafrase));
        return minhafrase;
    }

    function obterTamanhoDados() public view returns (uint256) {
        return MeusBytes.length;
    }
}