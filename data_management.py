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


df.to_csv('teste_script.ped', sep='\t', index=False, header=False)

# exibe as primeiras 5 linhas do DataFrame
print(df.head())