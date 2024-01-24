
## Funktionsweise
1. Der Resolver fragt den Root-Nameserver nach der IP-Adresse des TLD-Nameservers für die angegebene Top-Level-Domain (zum Beispiel .com, .org usw.).
    
2. Der Root-Nameserver antwortet mit der IP-Adresse des entsprechenden TLD-Nameservers für die angegebene Top-Level-Domain.
    
3. Dann fragt der Resolver den TLD-Nameserver nach der IP-Adresse des Domainnamens (zum Beispiel google.com).
    
4. Der TLD-Nameserver antwortet mit der IP-Adresse des Domainnamens, oder er verweist auf die Nameserver der Subdomain (wie ns1.google.com, ns2.google.com), die dann die IP-Adresse für die Domain bereitstellen.