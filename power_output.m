function power_output = power_output(gain, powerdB, loss)
power_m = 25:45;

for i = 1:length(gain)
  power_m(i) = gain(i) - loss(i) + powerdB;
  power_m(i) = 10*log10(power_m(i));;
endfor

power_output = power_m;

endfunction