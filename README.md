# Projeto de Banco de Dados E-commerce

Este é um projeto de banco de dados para um sistema de e-commerce, criado com o objetivo de demonstrar a modelagem e implementação de um banco de dados para um sistema de comércio eletrônico. O banco de dados foi desenvolvido com base no modelo relacional e inclui várias tabelas relacionadas que representam diferentes entidades e suas interações.

## Modelo do Banco de Dados

O modelo do banco de dados inclui as seguintes tabelas:

- `accounts`: Armazena informações comuns para clientes Pessoa Jurídica e Pessoa Física.
- `customers`: Contém informações detalhadas sobre os clientes, com referência à tabela `accounts`.
- `products`: Armazena informações sobre os produtos disponíveis para venda.
- `orders`: Registra os pedidos feitos pelos clientes, com detalhes sobre status, pagamento e entrega.
- `payments`: Armazena informações sobre as diferentes formas de pagamento associadas a um pedido.
- `product_stock`: Mantém o controle do estoque de produtos e sua localização.
- `suppliers`: Registra os fornecedores de produtos.
- `sellers`: Contém informações sobre os vendedores envolvidos no comércio dos produtos.
- `product_seller`: Relaciona os produtos disponíveis com os vendedores que os comercializam.
- `product_order`: Associa produtos aos pedidos, com detalhes sobre a quantidade e status dos produtos nos pedidos.
- `stock_location`: Relaciona os produtos com as localizações específicas do estoque.
- `product_supplier`: Associa produtos aos fornecedores, com detalhes sobre a quantidade fornecida por cada fornecedor.

## Como Utilizar

Para criar o banco de dados no seu sistema de gerenciamento de banco de dados, basta executar o script SQL fornecido no arquivo `ecommerce.sql`. O script criará todas as tabelas e relacionamentos necessários.

## Perguntas Respondidas com SQL

O projeto inclui algumas queries SQL para responder a algumas perguntas específicas sobre os dados do banco de dados:

1. Quantos pedidos foram feitos por cada cliente?
2. Algum vendedor também é fornecedor?
3. Relação de produtos fornecedores e estoques.
4. Relação de nomes dos fornecedores e nomes dos produtos.

As queries SQL para cada pergunta estão disponíveis no arquivo `queries.sql`.

## Contribuição

Sinta-se à vontade para fazer melhorias ou adições a este projeto. Basta abrir uma "issue" ou enviar um "pull request" com suas sugestões.

## Licença

Este projeto está licenciado sob a Licença MIT. Para mais detalhes, consulte o arquivo `LICENSE`.

---
Este projeto foi criado com base em um modelo de banco de dados fictício para fins de demonstração e aprendizado. Os dados apresentados são fictícios e não representam informações reais.

