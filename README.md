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


