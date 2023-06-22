# DigiKala SysOps Assignment Answer

## Target

Create a simple CDN end-to-end flow to serve a web content from the origin server

## Main tool set

Linux, Vagrant, Bird, Python/Bash, Nginx, ELK stack

## Due Time

Five days

Note: Configuration must be done by vagrant or any other automated solution. The environment must be
reproducible across any platform even our laptops.

## Overview

We prepared five virtual machines with vagrant to serve our service. All VMs must use Linux as an operating
system.

We launch a sample web site and serve it via a proxy. On the other hand, our client must be routed with BGP protocol to access web content. In the end, we made some tuning on the proxy server to improve performance and having logs.

![scenario](https://github.com/YaserAmini88/TaskAssignment/assets/51445051/7fdde49d-5f0f-4a18-85fb-bb8068bd0f3c)

- Client: for sending and testing web content
- ISP router: route traffic to another side with BGP routing
- Edge Server: Act as a BGP router and web proxy
- Web Server: Run a simple web site with some content
- Logger: catch and gather log and event from EDGE server

## Networking

We need Three Isolated networks

- Between client and ISP router
- Between the ISP router and Edge router
- Between the Edge router, webserver, and logger

## Step 1

On Webserver, install a simple website with dynamic and static contact. You are free to use any web server.

## Step 2

Implement BGP routing between the ISP router and EDG server. Now the client can ping the edge server. You can use Bird (open-source router) to setup it.

## Step 3

Install Nginx as a proxy to forward web requests to the webserver. Now the client must see your sample website. Define some rules to cache static content.

## Step 4

Install ELK for gathering Nginx access/error logs in different elastic search indices. Required Nginx configurations also must be done at webserver side.

## Step 5

- Tune TCP stack on all server base on server functionality
- Rated (set 10rps) the number of requests that send to the webserver. The extra request must block with status code 429
- Write bash scripts for purging one file from cache storage.
- Add some information in the HTTP response to inform the client about server name, cache status, and response time.
- In heavy load, we need a solution to discard 20% of requests on Edge Servers. Create a bash/python to generate loads, and run it on client.
- On ELK side, create a retention mechanism to delete logs after X days/hours.

## Step 6

Document your environment
