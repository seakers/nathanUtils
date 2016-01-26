function binary=de2biSubstitute(decimal,varargin)
    [m,n]=size(decimal);
    binaryStr=dec2bin(decimal,varargin{:});
    binaryLen=size(binaryStr,2);
    binary=reshape(str2num(reshape(binaryStr,m*n*binaryLen,1)),size(binaryStr,1),size(binaryStr,2));
end