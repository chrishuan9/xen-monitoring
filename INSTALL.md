#Installation

Copy/Move/Download the perl script to 

```/usr/local/bin/xen_stats.pl```

of your xenhost (dom0 configuration)

Make the Output available via SNMP, add the following instructions to snmpd.configuration

```extend xen-stats   /usr/bin/sudo /usr/local/bin/xen_stats.pl```

Restart SNMP and test using snmpwalk

```snmpwalk -v2c -c public  srv-10 NET-SNMP-EXTEND-MIB::nsExtendOutputFull.\"xen-stats\"````