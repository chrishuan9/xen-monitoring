# Citrix XEN Host monitoring

I wanted to monitor disk I/O and CPU usage for xen’s without running SNMP on 
each xen domain. I couldn’t find anything out of the box to do this 
(I can't be the first who wanted to do this? surely there must be something?!) 

It involves hooking a script in to your dom0’s snmp daemon and monitoring
the output in your favorite Monitoring Tool (Icinga,CA Specturm etc.)

The provided perl script outputs data from xentop and using xen-stats the output
can be made available via SNMP