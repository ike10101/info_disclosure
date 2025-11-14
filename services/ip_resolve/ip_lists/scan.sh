
#!/bin/bash

# Read ports into an array (one per line)
mapfile -t ports < ports.txt

# Loop over each port
for port in "${ports[@]}"; do
echo "Scanning port $port across all IPs..."
rustscan -a ips_to_scan_1 -p "$port" --no-banner --greppable --batch-size 100 --tries 3 --timeout 10000 >> ports_out/"$port" ; done

echo "All scans complete. Results saved per port."
