#!/usr/bin/python3
"""  Gather data from an API"""
import requests
import csv
import sys


def get_todo():
    id = sys.argv[1]
    url = f"https://jsonplaceholder.typicode.com/users/{id}/todos"
    user_url = f"https://jsonplaceholder.typicode.com/users/{id}"
    respond = requests.get(url).json()
    name = requests.get(user_url).json().get('username')

    data = "" 
    for item in respond:
        data += "{},{},{},{}\n".format(str(item['userId']) , str(name) , str(item['completed']) , str(item['title']))
    save_to = f'{id}.csv'
    with open(save_to, 'w') as f:
        f.write(data)
	#writer = csv.writer(f)
        # writer.writerows(data)



if __name__ == '__main__':
    get_todo()
