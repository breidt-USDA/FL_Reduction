function resvec = calcdata(data_tab,totmat,protmat)
%calculates all results for protonated acid and total acid 
%all input is for matlab "table" data format
%INPUT:
%  data_tab = table of FLR data with
%     lactic, acetic, plac, pace, tempC column headings
%  totmat and protmat = Quentin's matrices for total and prot acid
%     b_intercept,b_acetic,b_lactic,b_tempC,b_aceticlactic,
%     b_acetictempC,blactictempC
%OUTPUT:
%  resvec = Nx2 matrix with cols for each treatment in the data table
%     col1: 0.5 quantile for total acid
%     col2: 0.5 quantile for prot acid
%-------------------------------------------------------------------------
len = height(data_tab);                %get number of rows in data tab
resvec = zeros(len,2);                 %return matrix of zeros
for i=1:len                            %loop for each row
   lac = data_tab.lactic(i);           %get lactic val for row
   ace = data_tab.acetic(i);           %get acetic val for row
   tempC = data_tab.tempC(i);          %get temp for row
   restot = FLR(lac,ace,tempC,totmat{:,:},0.5); %Calc FLR with 0.5 quantile
   resvec(i,1) = restot.Q;             %assign result for total acid
   plac = data_tab.plac(i);            %get prot lac val for row
   pace = data_tab.pace(i);            %get prot ace val for row
   resprot = FLR(plac,pace,tempC,protmat{:,:},0.5); %FLR for 0.5 quantile
   resvec(i,2) = resprot.Q;            %assign result for prot acid
end
end