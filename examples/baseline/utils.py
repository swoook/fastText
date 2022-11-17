import requests
import os
import csv
import pandas as pd

def get(url): return requests.get(url)
    
def download(url, filepath):
    file_directory = os.path.dirname(filepath)
    if not os.path.exists(file_directory): os.makedirs(file_directory)
    with open(filepath, 'wb') as file:
        response = requests.get(url)             
        file.write(response.content)
        
def get_nmsc(url):
    result = requests.get(url)
    result = result.content.decode('utf-8')
    result = list(csv.reader(result.splitlines(), delimiter='\t'))
    result = pd.DataFrame(
        data=result[1:],
        columns=result[0],
    ).set_index('id')
    
    return result