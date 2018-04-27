display/i $pc
set $i=0
break indirect_camellia
run
while ($i<100000)
si
end
quit
