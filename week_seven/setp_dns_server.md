## Setting up DNS server on Coperate Data center
## VPC (172.31.0.0/16)
## CORP DOMAIN NAME : scontinum.corp

<img width="1194" alt="image" src="https://github.com/user-attachments/assets/83aa58e5-0b17-4d07-869f-204e414806eb" />


# On the Corporate DNS Server , Install DNS Packages

```
sudo yum update –y
sudo yum install bind bind-utils –y
```

# Create file /var/named/scontinum.corp.zone 

```
$TTL 86400
@ 	IN  SOA     ns1.scontinum.corp. root.scontinum.corp. (
        2013042201  ;Serial
        3600        ;Refresh
	      1800        ;Retry
	      604800      ;Expire
	      86400       ;Minimum TTL
)
; Specify our two nameservers
    IN  NS  dnsA.scontinum.corp.
    IN	NS  dnsB.scontinum.corp.
; Resolve nameserver hostnames to IP, replace with your two droplet IP addresses.
dnsA    IN  A  1.1.1.1
dnsB    IN  A  8.8.8.8
; Define hostname -> IP pairs which you wish to resolve(CORP-APP-SERVER IP)
@    IN  A  172.31.8.156
app  IN	 A  172.31.8.156
```

# Create file /etc/named.conf , the IP after localhost is the DNS SERVER IP

```
options {
  directory "/var/named";
  dump-file "/var/named/data/cache_dump.db";
  statistics-file "/var/named/data/named_stats.txt";
  memstatistics-file "/var/named/data/named_mem_stats.txt";
  allow-query { any; };
  allow-transfer { localhost; 172.31.15.60; };
  recursion yes;
  forward first;
  forwarders {
    172.31.0.2;
  };
  dnssec-validation yes;
  /* Path to ISC DLV key */
  bindkeys-file "/etc/named.iscdlv.key";
  managed-keys-directory "/var/named/dynamic";
};
zone "scontinum.corp" IN {
    type master;
    file "scontinum.corp.zone";
    allow-update { none; };
```

# Start the named service and enabled

```
sudo systemctl restart named.service
chkconfig named on
```

# Login to the Corperate App server and edit the /etc/resolv.conf

**Chnaged name server to  ip address of corp-dns-server**

# Test connectivity from the Managemnet VPC to Corp-VPC using domain name 

