# Importa a biblioteca necessária para conectar e interagir com o banco de dados MySQL
import pymysql
from datetime import datetime

# Configurações para conectar ao banco de dados MySQL
# Substitua 'seu_usuario', 'sua_senha' e 'correios' com suas credenciais reais
config = {
    'host': 'localhost', # O endereço do servidor MySQL, geralmente 'localhost' se estiver rodando localmente
    'user': 'seu_usuario', # Seu nome de usuário do MySQL
    'password': 'sua_senha', # Sua senha do MySQL
    'database': 'correios' # O nome do banco de dados ao qual você deseja se conectar
}

# Dados fictícios para serem inseridos nas tabelas do banco de dados

# Lista de clientes a serem adicionados
clientes = [
    ('Amanda Rodrigues', '11122233344', 'amanda.rodrigues@example.com', '(11) 98765-4336', 'Rua P, 606', 'São Paulo', 'SP', '01234-582'),
    ('Bruno Almeida', '22233344455', 'bruno.almeida@example.com', '(21) 98765-4337', 'Rua Q, 707', 'Rio de Janeiro', 'RJ', '01234-583')
]

# Lista de pacotes a serem adicionados
pacotes = [
    ('Pacote de Eletrônicos Pequenos', 0.8, 12.0, 180.00, 16), # Descrição, peso, dimensão, valor, ID do cliente
    ('Pacote de Acessórios', 0.3, 8.0, 50.00, 17)
]

# Lista de agentes a serem adicionados
agentes = [
    ('Agente P', 'agente.p@example.com', '(11) 91234-5693'), # Nome, email, telefone
    ('Agente Q', 'agente.q@example.com', '(21) 91234-5694')
]

# Lista de envios a serem adicionados
envios = [
    (16, 16, '2023-10-16 08:00:00', '2023-10-20 10:00:00', 'Em trânsito'), # ID do pacote, ID do agente, data de envio, data de entrega, status
    (17, 17, '2023-10-17 09:00:00', '2023-10-21 11:00:00', 'Em trânsito')
]

# Lista de rastreamentos a serem adicionados
rastreamento = [
    (16, '2023-10-16 08:00:00', 'São Paulo, SP', 'Pacote postado'), # ID do envio, data e hora, localização, status atual
    (16, '2023-10-17 09:00:00', 'Campinas, SP', 'Em trânsito'),
    (17, '2023-10-17 09:00:00', 'Rio de Janeiro, RJ', 'Pacote postado'),
    (17, '2023-10-18 10:00:00', 'Nova Iguaçu, RJ', 'Em trânsito')
]

try:
    # Estabelece uma conexão com o banco de dados MySQL usando as configurações fornecidas
    conn = pymysql.connect(**config)

    # Cria um cursor, que é um objeto que permite executar comandos SQL no banco de dados
    cursor = conn.cursor()

    # Insere os dados dos clientes na tabela 'clientes'
    cursor.executemany('''
    INSERT INTO clientes (cli_nome, cli_cpf, cli_email, cli_telefone, cli_endereco, cli_cidade, cli_estado, cli_cep)
    VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
    ''', clientes)

    # Insere os dados dos pacotes na tabela 'pacotes'
    cursor.executemany('''
    INSERT INTO pacotes (pac_descricao, pac_peso, pac_dimensao, pac_valor, pac_cli_id)
    VALUES (%s, %s, %s, %s, %s)
    ''', pacotes)

    # Insere os dados dos agentes na tabela 'agentes'
    cursor.executemany('''
    INSERT INTO agentes (ag_nome, ag_email, ag_tel)
    VALUES (%s, %s, %s)
    ''', agentes)

    # Insere os dados dos envios na tabela 'envios'
    cursor.executemany('''
    INSERT INTO envios (env_pac_id, env_ag_id, env_data_envio, env_data_entrega, env_status_envio)
    VALUES (%s, %s, %s, %s, %s)
    ''', envios)

    # Insere os dados de rastreamento na tabela 'rastreamento'
    cursor.executemany('''
    INSERT INTO rastreamento (ras_envio_id, ras_data_hora, ras_localizacao, ras_status_atual)
    VALUES (%s, %s, %s, %s)
    ''', rastreamento)

    # Confirma as alterações no banco de dados
    conn.commit()
    print("Dados inseridos com sucesso!")

# Captura e imprime qualquer erro que ocorra durante a execução do bloco try
except pymysql.MySQLError as e:
    print(f"Erro ao conectar ao MySQL: {e}")

# O bloco finally é executado independentemente de ocorrer um erro ou não
finally:
    # Fecha o cursor e a conexão para liberar recursos
    if 'cursor' in locals():
        cursor.close()
    if 'conn' in locals():
        conn.close()
