# MyTasks — Gerenciador de Tarefas

O **MyTasks** é uma aplicação desktop desenvolvida em Delphi para gerenciamento de tarefas pessoais, permitindo cadastrar, consultar, editar, excluir e acompanhar tarefas de forma simples e organizada.

O projeto foi criado com o objetivo de praticar o desenvolvimento de aplicações desktop utilizando **Delphi, VCL, FireDAC e Firebird**, explorando conceitos como programação orientada a objetos, operações CRUD, validação de dados, consultas SQL e organização do código.

Além das funcionalidades de gerenciamento, o projeto também utiliza um arquivo externo de configuração para facilitar a conexão com diferentes bancos de dados.

## Funcionalidades

### Gerenciamento de tarefas
- Cadastro de tarefas com título, descrição e categoria.
- Listagem das tarefas cadastradas.
- Edição e exclusão de tarefas.
- Alteração da situação das tarefas entre pendente e concluída.
- Filtro de tarefas por situação: todas, pendentes ou concluídas.
- Visualização dos detalhes de uma tarefa por meio de duplo clique.
- Validação dos campos antes de salvar os registros.

### Gerenciamento de categorias
- Cadastro de categorias.
- Consulta e listagem das categorias cadastradas.
- Edição e exclusão de categorias.
- Pesquisa de categorias por nome ou código.
- Seleção de categorias por meio de uma janela de consulta.

### Interface
- Interface gráfica desenvolvida com VCL.
- Organização das funcionalidades em formulários.
- Utilização de tabelas (`TDBGrid`) para exibição dos registros.
- Menus de contexto para alteração da situação das tarefas.
- Ícones e elementos visuais para facilitar a navegação.

### Banco de dados
- Persistência de dados utilizando Firebird.
- Comunicação com o banco por meio do FireDAC.
- Consultas SQL parametrizadas.
- Configuração externa da conexão utilizando um arquivo `config.ini`.
- Verificação da existência do arquivo do banco em conexões locais.

## Tecnologias utilizadas

| Tecnologia | Utilização |
|---|---|
| Delphi 12 | Linguagem e ambiente de desenvolvimento |
| Object Pascal | Implementação das funcionalidades |
| VCL | Desenvolvimento da interface gráfica |
| Firebird 2.5 | Banco de dados relacional |
| FireDAC | Conexão e comunicação com o banco |
| SQL | Consultas e manipulação dos registros |
| Git e GitHub | Versionamento do projeto |

## Estrutura do projeto

O projeto está organizado em unidades com responsabilidades específicas.

```text
MyTasks/
├── src/
│   ├── forms/
│   │   ├── uFrmPrincipal.pas
│   │   ├── uFrmCategorias.pas
│   │   ├── uFrmConsultaCategorias.pas
│   │   └── uFrmDetalhesTarefa.pas
│   │
│   ├── datamodules/
│   │   └── uDmPrincipal.pas
│   │
│   └── utils/
│       └── uValidacoes.pas
│
├── README.md
└── ...
```

**Principais unidades:**

- `uFrmPrincipal`: formulário principal, responsável pelo gerenciamento das tarefas.
- `uFrmCategorias`: formulário de cadastro e manutenção das categorias.
- `uFrmConsultaCategorias`: consulta e seleção de categorias.
- `uFrmDetalhesTarefa`: visualização detalhada das informações de uma tarefa.
- `uDmPrincipal`: gerenciamento da conexão com o Firebird e dos componentes de acesso aos dados.
- `uValidacoes`: funções reutilizáveis para validação dos campos.

## Requisitos

Para executar o projeto, são necessários:

- Windows.
- Firebird Server instalado e em execução.
- Banco de dados do MyTasks previamente criado e com as tabelas necessárias.
- Biblioteca `fbclient.dll` compatível com a arquitetura do executável.
- Arquivo `config.ini` configurado.
- Variável de ambiente `MYTASKS_DB_PASSWORD` definida.

Para abrir, modificar e compilar o código-fonte, é necessário ter o **Delphi 12** instalado, com suporte aos componentes VCL e FireDAC.

## Instalação e configuração

### 1. Obter o projeto

Clone o repositório utilizando o Git:

```bash
git clone URL_DO_REPOSITORIO
```

Ou utilize a opção **Code → Download ZIP** no GitHub para baixar os arquivos.

Se o repositório contiver apenas o código-fonte, será necessário abrir o projeto no Delphi e compilá-lo.

### 2. Instalar o Firebird

O MyTasks utiliza o Firebird como sistema gerenciador de banco de dados.

Para executar a aplicação, instale o Firebird Server compatível com o banco utilizado.

Site oficial:

https://firebirdsql.org/

O projeto foi desenvolvido e testado utilizando o **Firebird 2.5**.

Após a instalação, verifique se o serviço do Firebird está em execução.

A porta padrão utilizada é `3050`.

### 3. Configurar o banco de dados

O aplicativo utiliza um banco Firebird com as seguintes tabelas principais:

**CATEGORIAS**

Armazena as categorias utilizadas para organizar as tarefas.

**TAREFAS**

Armazena as tarefas cadastradas, incluindo título, descrição, data de criação, situação e categoria vinculada.

O banco deve estar previamente criado e com sua estrutura configurada antes da primeira execução.

**Importante:** a criação automática do banco e das tabelas ainda não está disponível nesta versão.

### 4. Configurar o arquivo config.ini

O MyTasks utiliza um arquivo `config.ini` para armazenar as informações necessárias à conexão com o banco de dados.

Crie um arquivo chamado `config.ini` na mesma pasta do executável, com o seguinte conteúdo:

```ini
[Database]
Server=localhost
Port=3050
Path=D:\MyTasks\Dados\MYTASKS.FDB
User=SYSDBA
```

**Descrição dos parâmetros:**

| Parâmetro | Descrição |
|---|---|
| Server | Endereço do servidor Firebird |
| Port | Porta utilizada pelo servidor |
| Path | Caminho do arquivo do banco de dados |
| User | Usuário utilizado na conexão |

O caminho informado em `Path` é apenas um exemplo e deve ser ajustado conforme o local em que o banco está armazenado.

Caso o banco seja movido para outra pasta, basta atualizar o caminho no `config.ini`, sem necessidade de recompilar o aplicativo.

Para conexões remotas, o caminho informado deve corresponder ao local do banco no servidor Firebird.

### 5. Configurar a senha do banco

Por segurança, a senha de conexão não é armazenada diretamente no arquivo `config.ini`.

O aplicativo utiliza uma variável de ambiente chamada:

```text
MYTASKS_DB_PASSWORD
```

No Windows, abra o PowerShell e execute:

```powershell
[Environment]::SetEnvironmentVariable(
    "MYTASKS_DB_PASSWORD",
    "SUA_SENHA_FIREBIRD",
    "User"
)
```

Substitua `SUA_SENHA_FIREBIRD` pela senha correspondente ao usuário configurado no banco.

Depois de definir a variável, feche e abra novamente o Delphi ou o terminal utilizado para iniciar a aplicação, para que o novo ambiente seja reconhecido.

**Atenção:** não publique senhas reais, bancos com dados pessoais ou arquivos de configuração contendo credenciais no repositório.

### 6. Configurar a biblioteca fbclient.dll

A biblioteca `fbclient.dll` permite que o aplicativo se comunique com o Firebird.

Coloque uma versão compatível com o Firebird utilizado e com a arquitetura do executável na pasta da aplicação.

Exemplo:

```text
MyTasks/
├── MyTasks.exe
├── config.ini
└── fbclient.dll
```

A biblioteca cliente não substitui a instalação do Firebird Server.

### 7. Executar a aplicação

Com o Firebird instalado, o banco criado, o arquivo INI configurado e a variável de ambiente definida, execute o aplicativo.

Na inicialização, o MyTasks:

1. Localiza o arquivo `config.ini`.
2. Lê os parâmetros de conexão.
3. Recupera a senha da variável de ambiente.
4. Verifica a existência do banco, quando configurado para uma conexão local.
5. Estabelece a conexão com o Firebird.
