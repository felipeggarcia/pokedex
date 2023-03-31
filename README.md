
# Pokedex
Este é um aplicativo de Pokedex que utiliza a PokeAPI para exibir informações básicas sobre os Pokemons. O aplicativo foi desenvolvido usando Flutter 3.7.8 e a arquitetura Clean Architecture, com o Flutter Bloc como gerenciador de estados.

## Pré-requisitos
Antes de executar o aplicativo, você precisará ter o Flutter 3.7.8 instalado em seu sistema. Além disso, é necessário ter uma conexão com a Internet para poder acessar a PokeAPI.

## Instalação
Para instalar o aplicativo, siga as instruções abaixo:

1. Clone este repositório em seu computador.

2. Abra o terminal e navegue até o diretório do projeto.

3. Execute o seguinte comando para baixar as dependências:


`flutter pub get`

Depois que as dependências forem baixadas, execute o aplicativo com o seguinte comando:


`flutter run`

## Funcionalidades
O aplicativo da Pokedex possui as seguintes funcionalidades:

* Exibir uma lista de Pokemons com nome, tipo e foto.
* Exibir informações detalhadas sobre um Pokemon selecionado, incluindo os tipos e habilidades do Pokemon.

## Arquitetura
O aplicativo foi desenvolvido usando a arquitetura Clean Architecture, que é uma abordagem para desenvolvimento de software que enfatiza a separação de responsabilidades entre as diferentes camadas de uma aplicação.

As camadas utilizadas neste projeto são:

Domain: contém as entidades e regras de negócio da aplicação.
Data: contém a implementação dos repositórios, que acessam os dados da PokeAPI.
Infra: contém as camadas de UI e Bloc.

## Bibliotecas
O aplicativo utiliza as seguintes bibliotecas:

Http: biblioteca para fazer requisições HTTP.
Equatable: biblioteca para comparar objetos em Dart.
Flutter Bloc: biblioteca para gerenciamento de estado.
Dartz: biblioteca que fornece ferramentas funcionais para lidar com erros e exceções em Dart.
Infinite Scroll Pagination: biblioteca que fornece uma maneira fácil de implementar paginação infinita em aplicativos Flutter
## Testes
O aplicativo possui testes de unidade e de widget, que podem ser executados com o seguinte comando:


`flutter test`
