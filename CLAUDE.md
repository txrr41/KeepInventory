# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

KeepInventory é um sistema de controle de inventário desenvolvido em Delphi/Pascal para gerenciamento de bens patrimoniais. O sistema permite controle de prédios, salas, itens (notebooks, móveis, equipamentos), movimentações, ocorrências e relatórios de depreciação.

## Architecture

O projeto segue uma arquitetura MVC organizada em camadas:

- **src/view/**: Componentes de interface (formulários .pas/.dfm)
- **src/controller/**: Lógica de controle intermediando view e service
- **src/service/**: Regras de negócio e orquestração
- **src/repository/**: Acesso direto ao banco de dados
- **src/model/**: Entidades e estruturas de dados
- **src/dto/**: Data Transfer Objects para comunicação entre camadas
- **src/helper/**: Utilitários e funções auxiliares

## Database

- **PostgreSQL** como banco principal
- **FireDAC** para conexão via Delphi
- Configuração de conexão salva em `conexao.ini`
- Scripts de backup na pasta `backup/`

## Development Environment

- **Delphi IDE** (versão compatível com projetos .dpr)
- Componente **FireDAC** para conectividade com PostgreSQL
- Bibliotecas PostgreSQL necessárias na pasta `lib/`

## Build & Run

Para compilar e executar o projeto:
1. Abra `src/KeepInventory.dpr` no Delphi
2. Configure as bibliotecas PostgreSQL em library path
3. Compile (Ctrl+F9) e Run (F9)

## Common Development Tasks

### Adicionar Novo Módulo
1. Criar Model em `src/model/`
2. Criar DTO em `src/dto/`
3. Implementar Repository em `src/repository/`
4. Criar Service em `src/service/`
5. Implementar Controller em `src/controller/`
6. Criar View em `src/view/`
7. Adicionar referências no `KeepInventory.dpr`

### Configurar Conexão
- Use o formulário de conexão (ConnectionView)
- Configurações salvas em `conexao.ini`
- Parâmetros necessários: server, port, database, username, password

### Importação de Dados
- CSV de patrimônio via `PatrimonioImportacaoCSV.pas`
- Modelo em `src/Win32/Debug/modelo_importacao_patrimonio.csv`

## Key Features

- Gestão de usuários com controle de permissões
- Controle de bens patrimoniais com depreciação
- Movimentação entre prédios/salas
- Registro de ocorrências e análise
- Dashboard com métricas
- Rastreamento de itens
- Relatórios de depreciação
- Sistema de auditoria e logs

## Database Schema

Principais tabelas:
- `usuarios` - Gestão de usuários
- `bens` - Itens do patrimônio
- `predios` - Estruturas físicas
- `salas` - Localizações específicas
- `movimentacoes` - Histórico de movimentações
- `ocorrencias` - Registros de problemas
- `empresas` - Organizações

## Dependencies

- **FireDAC Components**: Conectividade PostgreSQL
- **VCL Forms**: Interface Windows
- **PostgreSQL DLLs**: Drivers em `lib/`
- **Componentes blur**: `uBlurHelper.pas` para UI