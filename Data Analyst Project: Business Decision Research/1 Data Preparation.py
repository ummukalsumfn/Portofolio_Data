import pandas as pd  #Import Library Pandas

df = pd.read_csv('https://storage.googleapis.com/dqlab-dataset/data_retail.csv',sep=';')

print('Lima data teratas:') # Mencetak Lima data teratas
print(df.head())

print('\nInfo dataset:') # Info dataset
print(df.info())

import pandas as pd
df = pd.read_csv('https://storage.googleapis.com/dqlab-dataset/data_retail.csv', sep=';')

# Mengubah tipe data kolom First_Transaction dan Last_Transaction dari int ke datetime

# Kolom First_Transaction
df['First_Transaction'] = pd.to_datetime(df['First_Transaction']/1000, unit='s', origin='1970-01-01') 
# Kolom Last_Transaction
df['Last_Transaction']=pd.to_datetime(df['Last_Transaction']/1000,unit='s',origin='1970-01-01')

print('Lima data teratas:')
print(df.head())

print('\nInfo dataset:')
print(df.info())
