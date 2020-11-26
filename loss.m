function loss = loss(s)

l_in_m = 25:45;
l_out_m = 25:45;

for i = 1:length(s)
  l_in = -20*log10(abs(s(i, 1)));
  l_in_m(i) = l_in;
endfor

for i = 1:length(s)
  l_out = -20*log10(abs(s(i, 4)));
  l_out_m(i) = l_out;
endfor

loss = [l_in_m; l_out_m];

endfunction