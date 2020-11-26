function log_gain = log_gain(s)
gain_m = 25:45;

for i = 1:length(s)
  gain_m(i) = 20*log10(abs(s(i, 1)));
endfor

log_gain = gain_m;

endfunction