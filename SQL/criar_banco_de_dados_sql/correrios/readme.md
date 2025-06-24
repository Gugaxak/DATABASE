# Pasta de Scripts e Banco de Dados

Esta pasta contém os arquivos necessários para configurar e alimentar o banco de dados MySQL chamado `correios`. Aqui você encontrará um script Python para inserir dados no banco de dados e o esquema SQL para criar e popular o banco de dados.

## Conteúdo da Pasta

- `PYTHON_PARA_ALIMENTAR_BANCO_CORRERIOS.py`: Um script Python para inserir dados no banco de dados MySQL.
- `correios.sql`: Um arquivo SQL contendo o esquema e os dados iniciais para criar e popular o banco de dados.

## Pré-requisitos

Antes de executar o script Python, certifique-se de ter o seguinte instalado:

- Python 3.x
- Biblioteca `pymysql` (pode ser instalada usando `pip install pymysql`)
- Um servidor MySQL em execução

## Configuração do Banco de Dados

1. **Criar o Banco de Dados**:
   - Utilize o arquivo `correios.sql` para criar o banco de dados e as tabelas necessárias. Você pode fazer isso executando o script SQL no MySQL Workbench ou usando o comando `mysql -u seu_usuario -p correios < correios.sql` no terminal.

2. **Configurar o Script Python**:
   - Substitua as credenciais no script `alimentar_banco_de_dados.py` com suas próprias credenciais do MySQL:
     ```python
     config = {
         'host': 'localhost',
         'user': 'seu_usuario',
         'password': 'sua_senha',
         'database': 'correios'
     }
     ```

## Estrutura do Banco de Dados

O banco de dados `correios` contém as seguintes tabelas:

- **clientes**: Armazena informações sobre os clientes.
- **pacotes**: Armazena informações sobre os pacotes enviados pelos clientes.
- **agentes**: Armazena informações sobre os agentes responsáveis pelos envios.
- **envios**: Armazena informações sobre os envios dos pacotes.
- **rastreamento**: Armazena informações sobre o rastreamento dos pacotes durante o envio.

## Como Executar o Script Python

1. Clone o repositório para sua máquina local.
2. Instale as dependências necessárias usando `pip install pymysql`.
3. Configure as credenciais do banco de dados no script Python.
4. Execute o script usando o comando:
   ```bash
   python alimentar_banco_de_dados.py
