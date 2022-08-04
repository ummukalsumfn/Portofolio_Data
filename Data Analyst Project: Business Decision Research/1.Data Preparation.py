#1.Data Preparation
import pandas as pd  #Import Library Pandas

df = pd.read_csv('https://storage.googleapis.com/dqlab-dataset/data_retail.csv',sep=';')

print('Lima data teratas:') # Mencetak Lima data teratas
print(df.head())

print('\nInfo dataset:') # Info dataset
print(df.info())
