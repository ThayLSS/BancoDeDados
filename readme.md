🚗 **Sistema de Locadora de Veículos (SQL)**
Este repositório contém a modelagem e implementação de um banco de dados relacional para gerenciar o ciclo operacional de uma locadora de veículos. O sistema controla desde o estoque de frotas entre filiais até o faturamento final e histórico de locações.

📝 **Sobre o Projeto**
O banco de dados foi projetado para suportar o fluxo completo de uma locadora, incluindo:

Gestão de Frota: Classificação por categorias e rastreio de quilometragem.

Ciclo de Locação: Diferenciação entre reservas antecipadas e locações efetivadas.

Logística: Controle de retirada e devolução em diferentes filiais.

Inteligência de Dados: Uso de Views, Procedures e Functions para automação de multas e relatórios financeiros.

🏗️ **Estrutura do Banco de Dados**
Tabelas Principais
FILIAL: Unidades físicas da locadora.

CATEGORIA: Definição de tipos de veículos e valores de diária base.

VEICULO: Cadastro técnico dos carros (placa, Renavam, KM).

CLIENTE / FUNCIONARIO: Cadastro de usuários e operadores.

RESERVA: Registro de intenção de locação.

LOCACAO: Registro histórico da execução da locação (valores finais, multas e KM de devolução).

🛠️ **Decisões de Modelagem**
Separação Reserva x Locação: Permite manter o histórico de intenções (reservas) mesmo que o cliente não compareça, sem poluir a tabela de faturamento real.

Redundância Estratégica: A tabela LOCACAO armazena dados da reserva no momento da execução para garantir a integridade histórica, caso a reserva original seja alterada futuramente.

Automação: * Function: Calcula automaticamente multas baseadas em dias de atraso.

Procedure: Processa a devolução atualizando o status do veículo e calculando o valor final de uma só vez.

📊 **Relatórios e Views**
O sistema conta com camadas de visualização prontas:

vw_faturamento_mensal: Consolidação financeira agrupada por filial e período.

vw_utilizacao_frota: Dashboard em tempo real sobre veículos disponíveis vs. em manutenção ou locados.

🚀 **Como Executar**
Certifique-se de ter o MySQL 8.0+ instalado.

Execute o script de criação do schema:

**SQL**
CREATE DATABASE LOCADORA_DE_CARRO;
USE LOCADORA_DE_CARRO;
Execute os scripts na seguinte ordem:

Criação de Tabelas e Constraints.

Inserção de dados mestres (Filiais, Categorias).

Criação de Views, Functions e Procedures.

Scripts de Teste (Reservas e Locações).

![Diagrama do Banco de Dados](https://github.com/ThayLSS/BancoDeDados/blob/4c9ed564b0f823cd961c149635fb66b876bc6a82/1-Diagrama%20PNG.png)
)
