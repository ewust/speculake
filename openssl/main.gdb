display/i $pc
set $i=0
break do_pattern
run
while ($i<100000)
si
end
quit
