

#### Requirements
the application consisting of of nginx webserver that proxies requests based on the URL path:

- /google requests should be proxied to google.com

- /freshcells requests should be proxied to freshcells.de

- all others requests respond with redirect 302 to amazon.com

- permanently redirect all requests for the domain without www. to the same domain with www.

- The deployment has HPA based on average CPU load: CPU threshold is 30% from 1cpu, minimum 2 replicas and maximum 5 replicas

- On each successful deployment of the Helm chart the API endpoint https://www.freshcells.de/some/api has to be called

- Ingress controller is nginx (doesn't need to be installed, suppose we have it already)



Explaination of the helm chart-

1. helm upgrade --install freshcells ./freshcells  -f freshcells/values.yaml --debug 

Run above command outside the freshcells directory

2. It will create a fresh cell demo service running on port 8080 on url /v2

3. It will create Hpa for our freshcells /hello api with 30 percent threshold

5. Main Resource Ingresses will be created which acts as proxy resource rules for routing requests based on different uris and wwww redirect mapping as per the above requirements
	