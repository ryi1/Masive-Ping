# Lista de direcciones IP
$ips = @(
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
)

# Lista para almacenar las direcciones IP que no respondieron
$no_response = @()

# Iterar sobre las direcciones IP
foreach ($ip in $ips) {
    # Ejecutar el comando de ping y capturar la salida
    $result = Test-Connection -ComputerName $ip -Count 1 -Quiet
    
    # Comprobar el resultado del ping
    if ($result) {
        Write-Host "$ip ✅"
    } else {
        Write-Host "$ip ❌"
        $no_response += $ip
    }
}

# Comprobar si todas las direcciones IP respondieron correctamente
if ($no_response.Count -eq 0) {
    Write-Host "Todas las direcciones IP respondieron correctamente."
} else {
    Write-Host "Las siguientes direcciones IP no respondieron:"
    foreach ($ip in $no_response) {
        Write-Host $ip
    }
}
