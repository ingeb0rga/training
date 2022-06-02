$text = "kube-system   coredns-869cb84759-drhbg                     1/1     Running   0          4h5m"

#$text.Split(' ') |  Where-Object { $_ -match "[-|_]" }

#$tmp = $text.Split(' ')
#$res = $tmp[$_.Length - 1]
#$res

#$text.Split('[ |:]') | Where-Object { $_ -match "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" }

#'{0:dd-MM-yyyy}' -f [DateTime]$text

#$text.Split(' |(|)')|  Where-Object { $_ -match "[a-zA-Z0-9]{6,}" }

#$text -replace '\s+', ' '

#$tmp = -split $text -join ' '
#$tmp