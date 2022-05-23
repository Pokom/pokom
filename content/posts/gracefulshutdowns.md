---
title: "Graceful Shutdowns"
date: 2022-05-23T13:36:02-04:00
draft: true
---

When running applications in a containerized environment, handling shutdowns gracefully is essential to ensuring high availability. 
`Graceful Shutdown` has ~3.3M search results on Google, but there isn't a precise defition of what it means.
For our purposes, let's assume graceful shutdown refers to the ability for a process to shutdown without interfering with ongoing requests. 

My goal for this post is for you to walk away with the following:
1. Why modern applications need them
2. Different types of shutdowns
3. How to implement graceful shutdowns

## Why Do we need them?

Between continuous delivery, complex cloud environments, and just general blah bvlah blah, there's a high likelyhood that your application is going to need to be restarted.
Let's only consider the continuous delivery example: everytime a change is released into production your application is going to restart.
Depending on how your application is hosted, this will likely require **some** degree of downtime. 
When you're running within Kubernetes, a `SIGTERM` signal will be sent to the application to let it know that it should shutdown.

[ ] TODO: Simple example

## How to reason about shutdowns

[ ] TODO

## Implement graceful shutdowns

[ ] TODO
