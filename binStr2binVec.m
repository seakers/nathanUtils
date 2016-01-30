function [ binVec ] = binStr2binVec( binStr )
%Turns a binary string like 100 into a row vector of numbers 1,0,0
[m,n]=size(binStr);
binVec=reshape(str2num(reshape(binStr,m*n,1)),m,n)
end

