function res = FLR(lac,ace,tempC,post_mat,perc)
%FLR Summary of this function goes here
%   Detailed explanation goes here
colvec = [1;lac;ace;tempC;lac*ace;lac*tempC;ace*tempC];
resvec = post_mat * colvec;
epred = exp(resvec);
res = quantile(epred,perc);
end

