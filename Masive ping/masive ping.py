import subprocess

# List of IP addresses
ips = [
    "8.8.8.8",
    "130.103.100.234",
    "130.103.100.235",
    "130.103.100.239",
    "130.103.100.233",
    "130.103.100.238",
    "130.103.100.183",
    "130.103.100.237",
    "130.103.100.236",
    "130.103.100.210",
    "130.103.100.211",
    "130.103.100.189",
    "130.103.100.214",
    "130.103.100.190",
    "130.103.100.188",
    "130.103.100.185",
    "130.103.100.186",
    "130.103.100.187",
    "130.103.100.193",
    "130.103.100.203",
    "130.103.100.209",
    "130.103.100.202",
    "130.103.100.207",
    "130.103.100.189",
    "130.103.100.213"
]

# List to store IP addresses that did not respond
no_response = []

# Iterate over the IP addresses
for ip in ips:
    # Execute the ping command and capture the output
    result = subprocess.run(['ping', '-c', '1', ip], stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
    
    # Check the ping result
    if result.returncode == 0:
        print(f"{ip} ✅")
    else:
        print(f"{ip} ❌")
        no_response.append(ip)

# Check if all IP addresses responded correctly
if len(no_response) == 0:
    print("All IP addresses responded correctly.")
else:
    print("The following IP addresses did not respond:")
    for ip in no_response:
        print(ip)