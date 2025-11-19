# KeepInventory

📦 Sistema de Controle de Inventário Patrimonial

KeepInventory é um sistema completo de controle de inventário desenvolvido em Delphi/Pascal para gerenciamento de bens patrimoniais. O sistema permite controle de prédios, salas, itens (notebooks, móveis, equipamentos), movimentações, ocorrências e relatórios de depreciação.

## 🚀 Funcionalidades Principais

* 🏢 **Gestão de Empresas e Predios**: Cadastro e administração de estruturas organizacionais
* 🏠 **Controle de Salas**: Gerenciamento de espaços físicos e localizações
* 💻 **Controle de Patrimônio**: Registro completo de bens com depreciação automática
* 🔄 **Movimentações**: Acompanhamento de transferências entre locais
* 🐛 **Registro de Ocorrências**: Sistema de incidentes e análise de problemas
* 📊 **Dashboard**: Métricas e indicadores em tempo real
* 🔍 **Rastreamento**: Localização e histórico de itens
* 📈 **Relatórios de Depreciação**: Análise do valor contábil dos bens
* 👥 **Gestão de Usuários**: Controle de acesso e permissões
* 📋 **Sistema de Auditoria**: Logs completos de todas as operações
* 📁 **Importação em Massa**: Importação de dados via CSV

## 🛠️ Stack Tecnológico

* **Frontend**: VCL Forms (Delphi)
* **Backend**: Pascal/Delphi
* **Banco de Dados**: PostgreSQL
* **Conectividade**: FireDAC
* **Arquitetura**: MVC (Model-View-Controller)

## 📋 Pré-requisitos

* Delphi IDE (versão compatível com projetos .dpr)
* PostgreSQL Server
* Bibliotecas FireDAC para PostgreSQL
* Componentes VCL

## 🏗️ Estrutura do Projeto

O projeto segue uma arquitetura MVC organizada em camadas:

```
src/
├── view/           # Componentes de interface (.pas/.dfm)
├── controller/     # Lógica de controle intermediando view e service
├── service/        # Regras de negócio e orquestração
├── repository/     # Acesso direto ao banco de dados
├── model/          # Entidades e estruturas de dados
├── dto/            # Data Transfer Objects
└── helper/         # Utilitários e funções auxiliares
```

## 🗃️ Estrutura do Banco de Dados

Principais tabelas:

* `usuarios` - Gestão de usuários e permissões
* `bens` - Itens do patrimônio
* `predios` - Estruturas físicas
* `salas` - Localizações específicas
* `movimentacoes` - Histórico de movimentações
* `ocorrencias` - Registros de problemas
* `empresas` - Organizações

## 🚀 Instalação e Configuração

### Configuração do Ambiente

1. Instale o PostgreSQL Server
2. Configure as bibliotecas PostgreSQL no Delphi
3. Garanta que as DLLs do PostgreSQL estejam na pasta `lib/`

### Banco de Dados

1. Crie um banco de dados PostgreSQL
2. Execute os scripts de criação de tabelas (disponíveis na pasta `backup/`)
3. Configure as permissões de acesso

### Compilação e Execução

1. Abra `src/KeepInventory.dpr` no Delphi
2. Configure as bibliotecas PostgreSQL em library path
3. Compile (Ctrl+F9)
4. Execute (F9)

### Configuração de Conexão

* Use o formulário de conexão (ConnectionView)
* As configurações são salvas em `conexao.ini`
* Parâmetros necessários: server, port, database, username, password

## 📖 Uso

### Login e Autenticação

1. Execute a aplicação
2. Configure a conexão com o banco de dados na tela inicial
3. Faça login com credenciais válidas
4. Acessível conforme as permissões do usuário

### Cadastro de Itens

1. Acesse o módulo de Cadastros
2. Selecione tipo de item (Patrimônio, Empresa, Prédio, Sala)
3. Preencha as informações obrigatórias
4. Salve o registro

### Importação em Massa

* Use o módulo de importação CSV
* Siga o modelo disponível em `src/Win32/Debug/modelo\\\\\\\_importacao\\\\\\\_patrimonio.csv`

## 🤝 Contribuição

Contribuições são bem-vindas! Para adicionar novos módulos:

1. Criar Model em `src/model/`
2. Criar DTO em `src/dto/`
3. Implementar Repository em `src/repository/`
4. Criar Service em `src/service/`
5. Implementar Controller em `src/controller/`
6. Criar View em `src/view/`
7. Adicionar referências no `KeepInventory.dpr`

## 📝 Licença

Este projeto é desenvolvido para uso interno de gestão patrimonial.

## 📞 Suporte

Para dúvidas ou problemas técnicos, verifique:

* Documentação interna do projeto
* Logs de auditoria para análise de erros
* Configurações de conexão em `conexao.ini`

---

*KeepInventory - Sistema completo de gestão patrimonial*

