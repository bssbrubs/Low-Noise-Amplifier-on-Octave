function noise_figure = noise_figure(s, fmin, rn, z0)

fn_m = 25:45;
for i = 1:length(s)
  rs = s(i, 1);
  rout = s(i, 2);
  fn_m(i) = fmin+(4*rn*abs(rs-rout)^2)/abs((z0*(1-abs(rs)^2)/abs(1+rout)^2));
endfor

noise_figure = fn_m;

endfunction