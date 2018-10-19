# Testing replication in SSB

This repository contains configuration files and scripts to test SSB replication in a virtual environment.

The Vagrantfile defines two virtual machines, sbot1 and sbot2, and a private network between them. You can use the included shell scripts to publish a series of messages on one sbot, and replicate them to the other one.

##  Setting up a scuttlebot

```
$ vagrant up sbot1
```
Installs and provisions a ubuntu virtual machine with nvm installed, then installs node 8.12.0 and scuttlebot. I set up a test network with different shs and sign keys, in case our network traffic leaks onto the Internet. This testnet should not affect regular scuttlebutt traffic.

## Running sbot

```
$ vagrant ssh sbot1
$ sbot server
```

## Publishing a bunch of messages

The populate.sh script publishes 5000 nonsense messages to SSB. Open another terminal and connect to sbot1.
```
$ vagrant ssh sbot1
$ time bash /vagrant/populate.sh > /dev/null

real    22m36.401s
user    11m51.646s
sys     1m53.001s
```

On my i7 Mac Book Pro, it takes 22 minutes to publish 5000 1K messages.

## Setting up another sbot

The configuration files include the secret identity installed on sbot1, so now we can set up a second sbot on the same private network and testnet. Open another terminal and connect to sbot2:

```
$ vagrant up sbot2
$ vagrant ssh sbot2
$ sbot server
```

## Requesting replication

See gossip.sh to see how to get sbot2 to request the posts from sbot1. Open a new terminal connected to sbot2. Connect sbot2 to sbot1:

```
$ sbot gossip.connect 192.168.118.11:8008:@E5VDgU3YPTnUf+p3MiZWOaTgAqkN8xVsCF8vJC2Pd4M=.ed25519
```

Data still won't flow, until you ask for it:

```
$ sbot replicate.request @E5VDgU3YPTnUf+p3MiZWOaTgAqkN8xVsCF8vJC2Pd4M=.ed25519
```

This is for all intents and purposes, instantaneous. It certainly doesn't take 22 minutes. I don't think it takes 22 miliseconds.

You can count how many posts have propagated to sbot2 by running:

```
$ sbot log | grep "## Post" | wc -l
```
