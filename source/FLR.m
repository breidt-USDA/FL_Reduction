function res = FLR(lac,ace,tempC,post_mat,perc)
%Process a single data set with lactic, acetic and tempC
%INPUT:
%  lac = lactic (mM)
%  ace = acetic (mM)
%  tempC = temperature C
%  post_mat = Quentin's matrix
%  perc = quantile val
%OUTPUT
%  res = quantile result
%--------------------------------------------------------------------------
%first make col vec with data, and cross products
colvec = [1;lac;ace;tempC;lac*ace;lac*tempC;ace*tempC];
resvec = post_mat * colvec;               %multiply by matrix
epred = exp(resvec);                      %convert vec vals to e^x
res = quantile(epred,perc);               %calc quantile
end

