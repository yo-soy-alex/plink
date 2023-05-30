#Para formatar o arquivo ped

import pandas as pd

# lê o arquivo CSV em um DataFrame

df = pd.read_csv('genotipos_PZCQ_NEL(1).csv', sep = ",", header= None)

# Defina a função que separa os caracteres por espaço
def separar_por_espaco(string):
    return ' '.join(string)

# Defina a função que separa os caracteres por espaço
def separar_por_espaco(string):
    if isinstance(string, str):
        return ' '.join(string)
    else:
        return string

# Aplique a função à segunda coluna do DataFrame
df.iloc[:,1] = df.iloc[:,1].apply(separar_por_espaco)

# Função para adicionar colunas com valores 0 em um DataFrame
def adicionar_colunas(df, indices):
    for idx in indices:
        col_name = f'NovaColuna{idx}'
        df.insert(idx, col_name, 0)

# Índices das colunas a serem adicionadas
indices_colunas = [0, 2, 3, 4, 5]

# Adicionar colunas com valor 0 em cada DataFrame
adicionar_colunas(df, indices_colunas)

# exibe as primeiras 5 linhas do DataFrame, verificamos se esta tudo OK
print(df.head())

# Guarda o dataframe 
df.to_csv('geotipos.ped', sep='\t', index=False, header=False)

