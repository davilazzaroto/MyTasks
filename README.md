# MyTasks — Gerenciador de Tarefas

O **MyTasks** é um gerenciador de tarefas desktop desenvolvido em **Delphi 12**, utilizando VCL para a interface e Firebird para armazenar os dados.

Criei esse projeto para praticar Delphi, principalmente o desenvolvimento de aplicações com banco de dados, operações CRUD, validações e organização do código.

A ideia foi começar com um sistema simples e ir adicionando funcionalidades conforme avançava nos estudos.

## Funcionalidades

- Cadastro, edição e exclusão de tarefas.
- Organização das tarefas por categorias.
- Alteração da situação entre pendente e concluída.
- Filtros para visualizar tarefas por situação.
- Consulta dos detalhes de uma tarefa com duplo clique.
- Cadastro e gerenciamento de categorias.
- Pesquisa de categorias por nome ou código.
- Validações dos campos e confirmações antes de excluir registros.
- Criação automática do banco de dados e das tabelas na primeira execução.

## Tecnologias utilizadas

- **Delphi 12 / Object Pascal** — desenvolvimento da aplicação.
- **VCL** — interface gráfica.
- **Firebird** — banco de dados.
- **FireDAC** — conexão e consultas SQL.
- **Git** — versionamento do projeto.

## Estrutura do projeto

```text
MyTasks/
├── src/
│   ├── forms/          # Telas da aplicação
│   ├── datamodules/    # Conexão e consultas do banco
│   └── utils/          # Validações reutilizáveis
├── database/
│   └── scripts/        # Scripts SQL
└── README.md
```

## Como executar

Para utilizar o MyTasks, é necessário ter o **Firebird Server 3.0 ou superior** instalado e em execução no Windows, além da biblioteca `fbclient.dll` compatível com a arquitetura do executável.

O Firebird pode ser obtido no [site oficial](https://firebirdsql.org/).

### 1. Baixe o projeto

Clone o repositório ou baixe o ZIP pelo GitHub. Caso tenha baixado apenas o código-fonte, abra o projeto no Delphi 12 e compile.

Na pasta do executável, mantenha os seguintes arquivos:

```text
Gerenciador_Tarefas.exe
config.ini
fbclient.dll
scripts/
├── 01_categorias.sql
└── 02_tarefas.sql
```

### 2. Configure a conexão

Crie um arquivo `config.ini` na mesma pasta do executável:

```ini
[Database]
Server=localhost
Port=3050
Path=D:\MyTasks\Dados\MYTASKS.FDB
User=SYSDBA
```

Você pode alterar o caminho do banco conforme necessário. Se já tiver um banco existente, basta informar seu caminho no INI.

### 3. Configure a senha

A senha do Firebird é recuperada pela variável de ambiente `MYTASKS_DB_PASSWORD`, evitando deixá-la diretamente no arquivo de configuração.

No PowerShell, execute:

```powershell
[Environment]::SetEnvironmentVariable(
    "MYTASKS_DB_PASSWORD",
    "SUA_SENHA_FIREBIRD",
    "User"
)
```

Substitua pela senha do seu Firebird e abra novamente o terminal ou o aplicativo para que a variável seja reconhecida.

### 4. Execute o aplicativo

Pronto! Ao iniciar, o MyTasks verifica se o banco existe no caminho configurado.

Caso não exista, o sistema pergunta se deseja criá-lo. Confirmando, ele cria a pasta necessária, o arquivo `.FDB` e as tabelas por meio dos scripts SQL.

Assim, não é necessário criar o banco manualmente pelo IBExpert.

*Observação: a criação automática foi implementada para conexões locais. Para utilizar um servidor remoto, o banco deve estar previamente configurado no servidor.*

## Próximas melhorias

- [x] CRUD de tarefas e categorias.
- [x] Filtros e alteração da situação das tarefas.
- [x] Configuração da conexão por arquivo INI.
- [x] Criação automática do banco e das tabelas.
- [ ] Melhorar o tratamento de erros na inicialização.
- [ ] Testar a aplicação em outros computadores.
- [ ] Continuar aprimorando a interface.

---

Projeto pessoal desenvolvido para estudo e prática com Delphi, VCL e Firebird.