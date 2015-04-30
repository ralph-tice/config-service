# Vagrant Consul Demo

This demo provides a very simple Vagrantfile that creates two nodes,
one at "172.20.20.10" and another at "172.20.20.11". Both are running
a standard Ubuntu 12.04 distribution, and Consul is pre-installed.

To get started, you can start the cluster by just doing:

    $ vagrant up

Once it is finished, you should be able to see the following:

    $ vagrant status
    Current machine states:
    n1                        running (vmware_fusion)
    n2                        running (vmware_fusion)

At this point the two nodes are running and you can SSH in to play with them:

    $ vagrant ssh n1
    ...
    $ vagrant ssh n2
    ...

To learn more about starting Consul, joining nodes and interacting with the agent,
checkout the [getting started guide](http://www.consul.io/intro/getting-started/install.html).

# Notes:

Consul isn't running.  A script ~/start_consul.sh has been added to start a new consul cluster with the web UI up.

The 2nd node is currently disabled in the vagrant file, since it has yet to be configured to connect to the 1st node.

# Example usage:

`curl localhost:8500/v1/catalog/nodes -s | jq .` should show output similar to:

	[
	  {
	    "Node": "n1",
	    "Address": "10.0.2.15"
	  }
	]

The example script, populate_config.sh, shows how one might add data to Consul and read it into an environment variable.

KV API docs are at [here](https://www.consul.io/docs/agent/http/kv.html)
