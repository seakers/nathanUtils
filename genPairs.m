function [pairs] = genPairs(n)
% generates all pairs of elements from 1:n with the form
% [[a1,b1];[a2,b2]...]. where a1<b1
% if you want other indicies/keys do: oIndxs(genPairs(lengh(oIndxs))
pattern=triu(ones(n),1);
linIndxs=1:(n^2);
[a,b]=ind2sub([n,n],linIndxs(logical(pattern)));
pairs=[a',b'];
end