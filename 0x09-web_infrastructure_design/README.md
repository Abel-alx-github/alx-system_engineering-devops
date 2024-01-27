<h1 align="center">Web infrastructure design</h1>

**Author by ABEL TIBESO**

# **List of Tasks and Answers**

- [Task 0 Simple web stack](#task-0-simple-web-stack)
   - [Answer](#answer1) 
- [Task 1 Distributed web infrastructure](#task-1-distributed-web-infrastructure)
   - [Answer](#answer2) 
- [Task 2 Secured and monitored web infrastructure](#task-2-secured-and-monitored-web-infrastructure)
   - [Answer](#answer3)



## [Task 0 Simple web stack] <a name="task-0-simple-web-stack"></a>
~~~
A lot of websites are powered by simple web infrastructure, a lot of time it is composed of a single server with a LAMP stack.

On a whiteboard, design a one server web infrastructure that hosts the website that is reachable via www.foobar.com. Start your explanation by having a user wanting to access your website.

Requirements:

You must use:
1 server
1 web server (Nginx)
1 application server
1 application files (your code base)
1 database (MySQL)
1 domain name foobar.com configured with a www record that points to your server IP 8.8.8.8
You must be able to explain some specifics about this infrastructure:
What is a server
What is the role of the domain name
What type of DNS record www is in www.foobar.com
What is the role of the web server
What is the role of the application server
What is the role of the database
What is the server using to communicate with the computer of the user requesting the website
You must be able to explain what the issues are with this infrastructure:
SPOF
Downtime when maintenance needed (like deploying new code web server needs to be restarted)
Cannot scale if too much incoming traffic
Please, remember that everything must be written in English to further your technical ability in a variety of settings.
~~~
## [Answer] <a name="answer1"></a>
Explanation
~~~
1. User Wants to Access Website:
   User types www.foobar.com into their browser.

2. DNS Lookup:
   Browser contacts a DNS server to translate the domain name into an IP address.
   DNS server finds the www record for foobar.com, pointing to IP 8.8.8.8.
   Connection to Server:

3. Browser establishes a connection with the server at IP 8.8.8.8.
   Web Server (Nginx):
   Receives the request from the browser.
   Serves static files (HTML, CSS, JavaScript) directly.
   Passes dynamic requests to the application server.

4. Application Server:
   Processes dynamic requests.
   Interacts with the database to retrieve or store data as needed.
   Generates dynamic content (e.g., personalized pages, search results).

5. Database (MySQL):
   Stores website data persistently (user information, content, product listings).
   Provides data to the application server when requested.

Response Back to User:
   Application server sends generated content back to the web server.
   Nginx sends the complete response (static and dynamic content) back to the user's browser.
   Browser renders the website content for the user to view.
~~~

**What is a server?**
>  A physical or virtual machine that hosts the website's components and resources.

**What is the role of the domain name?**
> it is a human-readable name (like www.foobar.com) that maps to the server's IP address, making it easier for users to find the website.

**What type of DNS record www is in www.foobar.com?**
> In terms of DNS (Domain Name System) records, the "www" subdomain is typically associated with a CNAME (Canonical Name) record

**What is the role of the web server?**
> it receives requests, serves static files, and directs dynamic requests to the application server.

**What is the role of the application server?**
> processes dynamic requests, interacts with the database, and generates dynamic content.

**What is the role of the database?**
> stores and manages website data in a structured way.

**What is the server using to communicate with the computer of the user requesting the website?**
> HTTP and HTTPS are the primary protocols used for web communication between servers and user computers.

**Issues with this infrastructure:**
> **Single Point of Failure (SPOF)**: If the server fails, the entire website goes down.
> 
> **Downtime for Maintenance:** Tasks like deploying new code or updating software often require restarting the web server, causing brief downtime.

> **Scalability Limitatio!
ns:** One server can handle limited traffic. High traffic can cause performance issues or crashes.
![0-simple_web_stack](https://github.com/Abel-alx-github/alx-system_engineering-devops/assets/138770113/6d603fb9-e721-4bd9-9107-f4c09c8c3b2f)

[Go to task-0-screenshot](https://drive.google.com/file/d/10Gu3iTN2ojDxQ5UnIa3m9TpQfVxM5Qkh/view?usp=sharing)

## [Task 1 Distributed web infrastructure] <a name="task-1-distributed-web-infrastructure"></a>
~~~
On a whiteboard, design a three server web infrastructure that hosts the website www.foobar.com.

Requirements:

You must add:
2 servers
1 web server (Nginx)
1 application server
1 load-balancer (HAproxy)
1 set of application files (your code base)
1 database (MySQL)
You must be able to explain some specifics about this infrastructure:
For every additional element, why you are adding it
What distribution algorithm your load balancer is configured with and how it works
Is your load-balancer enabling an Active-Active or Active-Passive setup, explain the difference between both
How a database Primary-Replica (Master-Slave) cluster works
What is the difference between the Primary node and the Replica node in regard to the application
You must be able to explain what the issues are with this infrastructure:
Where are SPOF
Security issues (no firewall, no HTTPS)
No monitoring
Please, remember that everything must be written in English to further your technical ability in a variety of settings.
~~~

## [Answer] <a name="answer2"></a>

**Explanation of Additional Elements:**
~~~
**Load Balancer (HAProxy):**
Distributes incoming traffic across multiple web servers to improve performance and handle higher loads.
Ensures high availability by redirecting traffic to healthy servers if one fails.
~~~
~~~
**Second Web Server:**
Provides redundancy and increased capacity for handling requests.
~~~
~~~
**Database Server:**
Isolates the database for better performance and security.
Allows for database replication for high availability and disaster recovery.
~~~

**What distribution algorithm your load balancer is configured with and how it works?**
~~~
**Round Robin:** Chosen for this design. It distributes requests evenly among available servers in a circular fashion, ensuring fair load distribution.
~~~

**Is your load-balancer enabling an Active-Active or Active-Passive setup, explain the difference between both?**
~~~
**I used Active-Active**: Both web servers actively handle requests, maximizing resource utilization and providing failover capability.
as oppose to 
 Active-Passive: One server is active, while the other is on standby, taking over only if the primary fails. This setup is simpler but less efficient in resource usage.
~~~

**How a database Primary-Replica (Master-Slave) cluster works?**
~~~
The main database server handles all write operations and replicates data to the replica node.
~~~
**What is the difference between the Primary node and the Replica node in regard to the application?**
~~~
Application Writes: Always go to the primary node to ensure data consistency.

Application Reads: Can go to either the primary or replica node, depending on configuration and load balancing strategies.
~~~
**Issues with this infrastructure:**
~~~
**High Availability:** Prevents single points of failure, ensuring website uptime even if a server fails.

**Scalability:** Handles increased traffic by adding more web servers behind the load balancer.

**Performance:** Distributes load across multiple servers, improving response times and user experience.

**Security:** It needs a firewall and isolates the database for better protection against attacks and data breaches.

**Data Availability:** Replicates the database for disaster recovery and ensures data persistence in case of failures.
~~~

![1-distributed_web_infrastructure](https://github.com/Abel-alx-github/alx-system_engineering-devops/assets/138770113/fcde5548-6c3b-4bfe-960f-3455378667a1)

[Go to task-1-screenshot](https://drive.google.com/file/d/1hmdbI-61H-e9QkIU7_9WxuL3UFhIJn6r/view?usp=sharing)


## [Task 2 Secured and monitored web infrastructure] <a name="task-2-secured-and-monitored-web-infrastructure"></a>
~~~
On a whiteboard, design a three server web infrastructure that hosts the website www.foobar.com, it must be secured, serve encrypted traffic, and be monitored.

Requirements:

You must add:
3 firewalls
1 SSL certificate to serve www.foobar.com over HTTPS
3 monitoring clients (data collector for Sumologic or other monitoring services)
You must be able to explain some specifics about this infrastructure:
For every additional element, why you are adding it
What are firewalls for
Why is the traffic served over HTTPS
What monitoring is used for
How the monitoring tool is collecting data
Explain what to do if you want to monitor your web server QPS
You must be able to explain what the issues are with this infrastructure:
Why terminating SSL at the load balancer level is an issue
Why having only one MySQL server capable of accepting writes is an issue
Why having servers with all the same components (database, web server and application server) might be a problem
Please, remember that everything must be written in English to further your technical ability in a variety of settings.
~~~

## [Answer] <a name="#answer2"></a>
**Explanation of Additional Elements:**
~~~
Firewalls:
     Protect each server from unauthorized access and malicious traffic.
     Filter incoming and outgoing connections based on security rules.

SSL Certificate:
    Enables HTTPS encryption for secure communication between users' browsers and the web servers.
    Protects sensitive data in transit from interception.

Monitoring Clients:
    Collect performance and health metrics from servers and applications.
    Send data to a central monitoring service (SumoLogic) for analysis and alerting.
~~~
**What are firewalls for?**
  > Firewalls: Act as gatekeepers, enforcing security policies and preventing unauthorized access.
**Why is the traffic served over HTTPS?**
  > HTTPS: Encrypts traffic to protect user privacy, prevent eavesdropping, and ensure data integrity.
**What monitoring is used for?**
  > Monitoring: Provides visibility into system health, performance bottlenecks, and potential issues.
**How the monitoring tool is collecting data?**
  > Monitoring Tools: Collect data through agents installed on servers, system logs, or API calls.
**Explain what to do if you want to monitor your web server QPS?**
  > Monitoring QPS: Configure the monitoring tool to gather web server QPS metrics (queries per second) and track request volume.

**Issues with this infrastructure:**
**Why terminating SSL at the load balancer level is an issue?**
~~~
SSL Termination at Load Balancer:
Decrypts traffic at the load balancer, potentially exposing sensitive data within the internal network.
Consider end-to-end encryption or alternative SSL termination approaches for enhanced security.
~~~
**Why having only one MySQL server capable of accepting writes is an issue?**
~~~
Single Write-Capable MySQL Server:
Creates a bottleneck for write operations and a single point of failure.
~~~
**Why having servers with all the same components (database, web server and application server) might be a problem?**
~~~
Limits flexibility and can lead to resource contention.
~~~
![2-secured_and_monitored_web_infrastructure](https://github.com/Abel-alx-github/alx-system_engineering-devops/assets/138770113/9bdcc3b9-8dce-41c3-99d2-0d63d81f31b8)


[Go to task-2-screenshot](https://drive.google.com/file/d/1FraGPgwSH7OMNB5C3fFQzYStnxK28Q4F/view?usp=sharing)
