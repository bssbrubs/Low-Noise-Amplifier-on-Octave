function linear_gain = linear_gain(s)
gain_m = 25:45;

for i = 1:length(s)
  gain_m(i) = s(i, 1);
endfor

linear_gain = gain_m;

endfunction