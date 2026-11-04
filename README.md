# MyTasks — Gerenciador de Tarefas

O **MyTasks** é uma aplicação desktop desenvolvida em Delphi para gerenciamento de tarefas pessoais. O sistema permite cadastrar, consultar, editar, excluir e acompanhar tarefas por meio de uma interface simples e organizada.

O projeto foi desenvolvido como forma de praticar **Delphi, Object Pascal, VCL, FireDAC e Firebird**, aplicando conceitos de programação orientada a objetos, operações CRUD, consultas SQL, validações e organização de código.

Um dos recursos implementados é a **criação automática do banco de dados**. Na primeira execução, caso o arquivo do banco não exista, o aplicativo pode criar a pasta, gerar o banco Firebird e executar os scripts necessários para preparar as tabelas.

## Funcionalidades

### Gerenciamento de tarefas

- Cadastro de tarefas com título, descrição e categoria.
- Listagem das tarefas cadastradas.
- Edição e exclusão de tarefas.
- Alteração da situação entre pendente e concluída.
- Filtro por situação: todas, pendentes ou concluídas.
- Visualização dos detalhes por meio de duplo clique.
- Validação dos campos antes de salvar.

### Gerenciamento de categorias

- Cadastro, edição e exclusão de categorias.
- Listagem e consulta das categorias cadastradas.
- Pesquisa por nome ou código.
- Seleção de categorias por meio de uma janela de consulta.

### Interface

- Interface gráfica desenvolvida com VCL.
- Formulários separados por funcionalidade.
- Utilização de `TDBGrid` para exibição dos registros.
- Menus de contexto para alteração da situação das tarefas.
- Ícones e elementos visuais para facilitar a navegação.

### Banco de dados

- Persistência de dados utilizando Firebird.
- Integração com o banco por meio do FireDAC.
- Consultas SQL parametrizadas.
- Configuração externa da conexão por meio do `config.ini`.
- Senha recuperada de uma variável de ambiente.
- Verificação da existência do banco em conexões locais.
- Criação automática do arquivo `.FDB`, mediante confirmação.
- Criação da pasta do banco, quando necessário.
- Execução automática dos scripts SQL para criação das tabelas e relacionamentos.

## Tecnologias utilizadas

| Tecnologia | Utilização |
|---|---|
| Delphi 12 | Ambiente de desenvolvimento |
| Object Pascal | Implementação das funcionalidades |
| VCL | Interface gráfica desktop |
| Firebird 3.0+ | Banco de dados relacional |
| FireDAC | Conexão e manipulação dos dados |
| SQL | Consultas e estrutura do banco |
| Git e GitHub | Versionamento do projeto |

**Observação:** os scripts atuais utilizam colunas `IDENTITY`, disponíveis a partir do Firebird 3.0. Recomenda-se utilizar uma versão compatível e verificar a versão efetivamente testada no projeto.

## Estrutura do projeto

O código está organizado em unidades com responsabilidades específicas.

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
├── database/
│   └── scripts/
│       ├── 01_categorias.sql
│       └── 02_tarefas.sql
│
├── README.md
└── ...
```

### Principais unidades

- **uFrmPrincipal:** gerenciamento das tarefas, filtros e operações de cadastro.
- **uFrmCategorias:** cadastro e manutenção das categorias.
- **uFrmConsultaCategorias:** pesquisa e seleção de categorias.
- **uFrmDetalhesTarefa:** visualização das informações de uma tarefa.
- **uDmPrincipal:** conexão com o Firebird, consultas e inicialização do banco de dados.
- **uValidacoes:** funções reutilizáveis para validação dos campos.

## Requisitos

Para executar o MyTasks, são necessários:

- Windows.
- Firebird Server compatível, instalado e em execução.
- Biblioteca `fbclient.dll` compatível com a arquitetura do executável.
- Arquivo `config.ini` configurado.
- Variável de ambiente `MYTASKS_DB_PASSWORD` definida.
- Scripts SQL disponíveis na pasta `scripts` ao lado do executável, para a criação de um banco novo.

**Não é necessário criar manualmente o banco ou as tabelas na primeira execução local.** O aplicativo oferece essa opção automaticamente.

Para abrir, modificar e compilar o código-fonte, é necessário ter o Delphi 12 com suporte a VCL e FireDAC.

## Instalação e configuração

### 1. Baixar o projeto

Clone o repositório utilizando o Git:

```bash
git clone URL_DO_REPOSITORIO
```

Ou acesse o repositório no GitHub e selecione **Code → Download ZIP**.

Caso não exista um executável disponibilizado na seção de Releases, será necessário abrir o projeto no Delphi e compilá-lo.

### 2. Instalar o Firebird

O MyTasks utiliza o Firebird como gerenciador de banco de dados.

Faça o download pelo site oficial:

https://firebirdsql.org/

Instale uma versão compatível com os scripts SQL do projeto e verifique se o serviço do Firebird está em execução.

A porta padrão utilizada é `3050`.

### 3. Preparar os arquivos da aplicação

Para executar o MyTasks, organize os arquivos da seguinte maneira:

```text
MyTasks/
├── Gerenciador_Tarefas.exe
├── config.ini
├── fbclient.dll
└── scripts/
    ├── 01_categorias.sql
    └── 02_tarefas.sql
```

Os arquivos SQL são utilizados para preparar automaticamente a estrutura de um banco novo.

O aplicativo precisa ter acesso aos scripts durante a primeira inicialização.

### 4. Configurar o config.ini

Crie um arquivo chamado `config.ini` na mesma pasta do executável.

Exemplo:

```ini
[Database]
Server=localhost
Port=3050
Path=D:\MyTasks\Dados\MYTASKS.FDB
User=SYSDBA
```

| Parâmetro | Descrição |
|---|---|
| Server | Endereço do servidor Firebird |
| Port | Porta de conexão |
| Path | Caminho do arquivo `.FDB` |
| User | Usuário do banco de dados |

O caminho informado é apenas um exemplo.

Você pode utilizar outra pasta, desde que o Firebird tenha permissão para acessar o local.

Caso o banco já exista em outro diretório, basta informar seu caminho em `Path`. Não é necessário recompilar o aplicativo.

**Importante:** para conexões remotas, o caminho informado deve ser válido no computador que hospeda o Firebird. A criação automática de pastas e bancos foi implementada para conexões locais.

### 5. Configurar a senha do Firebird

Por segurança, a senha não é armazenada no `config.ini`.

O MyTasks utiliza a variável de ambiente:

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

Substitua `SUA_SENHA_FIREBIRD` pela senha do usuário configurado no Firebird.

Após definir a variável, feche e abra novamente o terminal ou o Delphi para que a configuração seja reconhecida.

Não publique credenciais reais no GitHub.

### 6. Configurar a fbclient.dll

A biblioteca `fbclient.dll` permite a comunicação entre o aplicativo e o Firebird.

Coloque uma versão compatível na mesma pasta do executável.

A arquitetura da biblioteca deve corresponder à do aplicativo. Por exemplo, um executável Win32 precisa de uma biblioteca cliente de 32 bits.

A biblioteca cliente não substitui a instalação do Firebird Server.

### 7. Executar o MyTasks

Com o Firebird instalado e os arquivos configurados, execute `Gerenciador_Tarefas.exe`.

Na inicialização, o sistema:

1. Localiza e lê o arquivo `config.ini`.
2. Recupera a senha pela variável de ambiente.
3. Verifica a existência do banco de dados, quando a conexão é local.
4. Se o banco existir, conecta normalmente.
5. Se o banco não existir, solicita confirmação para criá-lo.
6. Após a confirmação, cria a pasta necessária e o arquivo `.FDB`.
7. Executa os scripts SQL para criar as tabelas e os relacionamentos.
8. Estabelece a conexão e disponibiliza as funcionalidades.

Após esse processo, o sistema estará pronto para cadastrar categorias e tarefas.

**Atenção:** se você já possui um banco com dados cadastrados, configure o caminho correto no INI. Não é necessário criar outro banco.

## Estrutura do banco de dados

O MyTasks utiliza duas tabelas principais.

### CATEGORIAS

Armazena as categorias utilizadas para organizar as tarefas.

| Campo | Descrição |
|---|---|
| ID | Identificador da categoria |
| NOME | Nome da categoria |
| DESCRICAO | Descrição opcional |

O campo `ID` possui geração automática, e o nome da categoria possui uma restrição de unicidade.

### TAREFAS

Armazena as informações das tarefas cadastradas.

| Campo | Descrição |
|---|---|
| ID | Identificador da tarefa |
| TITULO | Título da tarefa |
| DESCRICAO | Descrição opcional |
| CONCLUIDA | Situação da tarefa: 0 ou 1 |
| DATA_CRIACAO | Data e hora do cadastro |
| CATEGORIA_ID | Categoria vinculada à tarefa |

A tabela `TAREFAS` possui uma chave estrangeira que referencia `CATEGORIAS`.

Os scripts de criação estão disponíveis em `database/scripts`.

## Validações implementadas

O sistema realiza validações para evitar o cadastro de informações inválidas.

Entre elas:

- Título obrigatório.
- Limite de 100 caracteres para o título.
- Limite de 500 caracteres para a descrição.
- Categoria obrigatória.
- Código de categoria inteiro e positivo.
- Verificação da existência da categoria.
- Confirmação antes da exclusão de registros.
- Tratamento de exceções nas operações de cadastro, edição e exclusão.

As funções de validação reutilizáveis foram organizadas na unidade `uValidacoes`.

## Conceitos praticados

Durante o desenvolvimento, foram trabalhados conceitos como:

- Programação orientada a objetos com Object Pascal.
- Desenvolvimento de aplicações desktop.
- Componentes VCL.
- Organização de código em unidades.
- DataModules.
- Operações CRUD.
- Consultas SQL parametrizadas.
- Chaves primárias e estrangeiras.
- Validação de dados.
- Tratamento de exceções.
- Leitura de arquivos INI.
- Variáveis de ambiente.
- Criação e inicialização de bancos de dados.
- Execução de scripts SQL pelo FireDAC.
- Versionamento com Git.

## Melhorias futuras

- [x] Configuração externa da conexão com o banco.
- [x] Verificação da existência do banco.
- [x] Criação automática do banco de dados.
- [x] Criação das tabelas por meio de scripts SQL.
- [ ] Melhorar o tratamento de falhas durante a inicialização do banco.
- [ ] Adicionar uma verificação da estrutura do banco.
- [ ] Realizar testes de distribuição em outros computadores.
- [ ] Continuar aprimorando a interface gráfica.

## Objetivo do projeto

O MyTasks é um projeto pessoal desenvolvido para praticar Delphi e desenvolvimento de aplicações desktop integradas a bancos de dados.

A proposta é evoluir a aplicação gradualmente, aplicando novos conhecimentos e melhorando a organização, a interface e as funcionalidades.

O código-fonte está disponível para consulta e fins de estudo.