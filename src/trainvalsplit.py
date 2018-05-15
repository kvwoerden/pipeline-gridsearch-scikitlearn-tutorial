import pandas as pd
from sklearn.model_selection import train_test_split
import numpy as np
np.random.seed(42)

def author_names(acronym):
    if acronym == 'EAP':
        return 'Poe'
    elif acronym == 'HPL':
        return 'Lovecraft'
    elif acronym == 'MWS':
        return 'Shelley'

train = pd.read_csv('data/raw/train.csv')
train['author'] = train['author'].apply(author_names)
train.drop(columns=['id'], axis=1, inplace=True)
data, val = train_test_split(train)

data.to_csv('data/talk/data.csv', index=False)
val.to_csv('data/talk/val.csv', index=False)
