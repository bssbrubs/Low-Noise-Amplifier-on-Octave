function power_output = power_output(gain, powerdB)
power_m = 25:45;

for i = 1:length(gain)
  power_m(i) = gain(i) + powerdB;
endfor

power_output = power_m;

endfunction