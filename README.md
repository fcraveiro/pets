![Descrição da segunda imagem](https://i.imgur.com/8ewQBxW.png)

# <span style="color:blue">Aplicativo de Urgência e Emergência Médica para Pets</span>

Este aplicativo tem como objetivo principal fornecer acesso rápido e fácil a informações essenciais de clínicas de urgência e emergência. Em situações onde o tempo é crucial, o usuário pode encontrar a clínica mais próxima e obter todos os detalhes necessários para um atendimento rápido e eficaz.

## <span style="color:blue">Sumário</span>

- [Funcionalidades](#funcionalidades)
- [Tecnologias Utilizadas](#tecnologias-utilizadas)
- [Versões Utilizadas](#versões-utilizadas)
- [Infra](#infra)
- [Como Contribuir](#como-contribuir)
- [Instalação](#instalação)
- [Licença](#licença)
- [Informações úteis](#informações-úteis)

## Funcionalidades

- **Cadastro de Clínicas**: O banco de dados do aplicativo possui um cadastro completo das clínicas de urgência e emergência disponíveis, com informações atualizadas e detalhadas.

- **Busca Rápida de Clínicas**: Permite ao usuário localizar rapidamente clínicas próximas com base na sua localização atual, exibindo as opções mais próximas no topo da lista.

- **Informações Detalhadas**: Exibe informações principais sobre as clínicas, incluindo nome, endereço, telefone, e-mail, especialidades e horário de funcionamento.

- **Contato Rápido via WhatsApp**: Inclui um botão para contato direto via WhatsApp, facilitando a comunicação imediata com a clínica desejada.

- **Cálculo de Distância**: Mostra a distância entre a localização do usuário e a clínica, ajudando na escolha da opção mais acessível.

- **Rotas com Google Maps ou Waze**: Integração com Google Maps e Waze para fornecer rotas detalhadas até a clínica escolhida, permitindo que o usuário navegue com facilidade até o local.

## Tecnologias Utilizadas

- **Flutter**: Para o desenvolvimento da interface do usuário, proporcionando uma experiência fluida e responsiva em dispositivos Android e iOS.
- **Supabase**: Utilizado como backend para armazenamento e gestão de dados, oferecendo um banco de dados relacional robusto e escalável.
- **Google Maps API**: Para cálculo de distâncias e fornecimento de rotas detalhadas.
- **Waze**: Como uma opção adicional para navegação.

## Versões Utilizadas

[![Flutter](https://img.shields.io/badge/Flutter-v3.19.6-blue?logo=flutter)](https://flutter.dev)  
[![Dart](https://img.shields.io/badge/Dart-v3.3.4-blue?logo=dart)](https://dart.dev)  
[![Supabase](https://img.shields.io/badge/Supabase-v1.0-green?logo=supabase)](https://supabase.io)

## Infra

A tecnologia escolhida para o desenvolvimento do app deste projeto foi `Flutter`. Saiba mais em: [flutter.dev](https://flutter.dev/)

A tecnologia escolhida para o banco de dados foi o Supabase `Supabase`. Saiba mais em: [supabase.com](https://supabase.com/))

## Como Contribuir

Estamos abertos a contribuições da comunidade para melhorar o aplicativo. Se você tiver sugestões, encontrar bugs ou quiser adicionar novas funcionalidades, sinta-se à vontade para abrir uma issue ou enviar um pull request.

## Instalação

Para executar este projeto localmente, siga os passos abaixo:

1. Clone o repositório:
 
   ```bash
   git clone https://github.com/seu-usuario/seu-repositorio.git

2. Navegue até o diretório do projeto:

   ```bash
   cd seu-repositorio

3. Instale as dependências:

   ```bash
   flutter pub get

4. Configure o Supabase:

   Crie um projeto no Supabase.
   Configure as tabelas conforme descrito na documentação.
   Adicione as credenciais do Supabase no arquivo .env.

5. Execute o aplicativo:

   ```bash
   flutter run

## Licença

Este projeto é distribuído sob a Licença MIT, o que permite o uso, cópia, modificação, fusão, publicação, distribuição, sublicenciação, e/ou venda de cópias do software, desde que as cópias do software sejam acompanhadas pelo aviso de direitos autorais e este aviso de permissão.

## Informações úteis

   Stores
   
   ```bash
   CREATE TABLE stores (
      id UUID PRIMARY KEY,
      name VARCHAR(255) NOT NULL,
      email VARCHAR(255) UNIQUE NOT NULL,
      activity_id UUID NOT NULL,
      bairro VARCHAR(255) NOT NULL,
      likes INT DEFAULT 0,
      address VARCHAR(255) NOT NULL,
      number INT4,
      city VARCHAR(255) NOT NULL,
      state VARCHAR(2) NOT NULL,
      cep VARCHAR(10) NOT NULL,
      phones VARCHAR[]
   );
   ```

   Atibidades

   ```bash
   CREATE TABLE public.activities (
      id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
      name VARCHAR(255) NOT NULL
   );
   ```

   Serviços

   ```bash
   CREATE TABLE public.services (
      id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
      name VARCHAR(255) NOT NULL,
      description TEXT,
      priority INT4,
      description TEXT
   );
   ```

   Relacionamento Stores/Services

   ```bash
   CREATE TABLE public.store_services (
      store_id UUID NOT NULL,
      service_id UUID NOT NULL,
      PRIMARY KEY (store_id, service_id),
      FOREIGN KEY (store_id) REFERENCES public.stores(id) ON DELETE CASCADE,
      FOREIGN KEY (service_id) REFERENCES public.services(id) ON DELETE CASCADE
   );
   ```


