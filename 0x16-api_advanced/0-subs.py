#!/usr/bin/python3
""" make get request to reddit api of a given subreddit"""

import requests


def number_of_subscribers(subreddit):
    """ return no of subscribe if it is valid subreddit"""
    if subreddit:
        url = f'https://www.reddit.com/r/{subreddit}/about.json'
        respond = requests.get(url, allow_redirects=False)
        sub = None
        if (respond.status_code == 200):

            sub = respond.json()['data'].get('subscribers')
        if sub:
            return sub
        return 0
