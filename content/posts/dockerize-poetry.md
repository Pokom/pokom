---
title: "Dockerize Poetry"
date: 2021-10-29T09:22:38-04:00
draft: true
---

[Poetry](https://python-poetry.org/docs/) is yet another tool to manage pythons virtual environments. 
It's straightfoward to get an application setup using poetry, however the next question is usually "How can I run this in production?".
The goal of this post is to explore how to setup a Dockerfile that sets up the application to be able to be run as a container. 

>> The primary issue I was running into was creating the container on Raspberry Pi 4
- [ ] TODO: Convert this into "Creating a python container on ARM"

## Sample Application

Let's take a simple application that loads the [people in space](http://open-notify.org/Open-Notify-API/People-In-Space/) and try to containerize it!

{{<highlight "python">}}
import requests

if __name__ == "__main__":
    r = requests.get('http://api.open-notify.org/astros.json')
    astronauts = r.json()
    print(f"There are ${astronauts['number']} people in space.")
    for person in astronauts['people']:
        print(person['name'])
{{</highlight>}}

This application as a single depedency, [requests](https://docs.python-requests.org/en/latest/) that is used to fetch data from http end points. It will print out the number of folks in space, and a list of their names.

## Containerize application

- [ ] TODO

