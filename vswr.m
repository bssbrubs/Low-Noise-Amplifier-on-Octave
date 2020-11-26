function vswr = vswr(s)

s_in_m = 25:45;
s_out_m = 25:45;

for i = 1:length(s)
  s_in = (1 + abs(s(i, 1)))/(1 - abs(s(i, 1)));
  s_in_m(i) = s_in;
endfor

for i = 1:length(s)
  s_out = (1 + abs(s(i, 4)))/(1 - abs(s(i, 4)));
  s_out_m(i) = s_out;
endfor

vswr = [s_in_m; s_out_m];

endfunction