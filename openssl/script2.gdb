display/i $pc
set $i=0
break SSL_write
run s_server -key key.pem -cert cert.pem -accept 4433 -WWW
while ($i<100000)
si
end
quit
